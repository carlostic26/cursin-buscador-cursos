import 'package:cursin/ad_ids.dart';
import 'package:cursin/screens/drawer/drawer.dart';
import 'package:cursin/screens/drawer/drawer_options/certifiedWidgetCarrusel.dart';
import 'package:cursin/screens/drawer/drawer_options/search_courses.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

class certificadosScreen extends StatefulWidget {
  const certificadosScreen({super.key});

  @override
  State<certificadosScreen> createState() => _certificadosScreenState();
}

//Clase que abre una pantalla entregando información relacionada a los certificados de estudio mas comunes que se puedan encontrar

class _certificadosScreenState extends State<certificadosScreen> {
  BannerAd? _anchoredAdaptiveAd;
  bool _isLoaded = false;

    @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadAdaptativeAd();
  }

  Future<void> _loadAdaptativeAd() async {
    // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
    final AnchoredAdaptiveBannerAdSize? size =
        await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
            MediaQuery.of(context).size.width.truncate());

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

      adCursin ads = adCursin();

    _anchoredAdaptiveAd = BannerAd(
      // TODO: replace these test ad units with your own ad unit.
      adUnitId:  ads.banner,
      size: size,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$ad loaded: ${ad.responseInfo}');
          setState(() {
            // When the ad is loaded, get the ad size and use it to set
            // the height of the ad container.
            _anchoredAdaptiveAd = ad as BannerAd;
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Anchored adaptive banner failedToLoad: $error');
          ad.dispose();
        },
      ),
    );
    return _anchoredAdaptiveAd!.load();
  }


  bool? darkTheme1, isNotifShowed;

  Future<Null> getSharedThemePrefs() async {
    SharedPreferences themePrefs = await SharedPreferences.getInstance();
    setState(() {
      darkTheme1 = themePrefs.getBool('isDarkTheme');
    });
  }

  static const AdRequest request = AdRequest(
      //keywords: ['',''],
      //contentUrl: '',
      //nonPersonalizedAds: false
      );

  @override
  void initState() {
    super.initState();

        _loadAdaptativeAd();
    //es necesario inicializar el sharedpreferences tema, para que la variable book darkTheme esté inicializada como la recepcion del valor del sharedpreferences
    getSharedThemePrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkTheme1 == true ? Colors.grey[850] : Colors.white,
      appBar: AppBar(
        title: Text(
          "Certificados",
          style: TextStyle(
            fontSize: 16.0, /*fontWeight: FontWeight.bold*/
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //pass to search screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => searchedCourses(
                        catProviene: "sinCategoria",
                        puntoPartida: 'categorias_select'),
                  ),
                );
              },
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Estos son algunos certificados que puedes obtener usando Cursin App como herramienta para encontrar cursos gratis online de toda internet.',
                style: TextStyle(
                  fontSize: 12.0,
                  color: darkTheme1 == true ? Colors.white : Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10),

            //carrusel
            carruselCertifiedScreen(),
            SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.green,
                  boxShadow: [
                    //BoxShadow(color: Color.fromARGB(255, 24, 24, 24), spreadRadius: 3),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: new ExpansionTile(
                      backgroundColor: Colors.grey,
                      title: Text('¿Cómo reclamo mi certificado?',
                          style: new TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          )),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Card(
                                      color: Colors.grey,
                                      child: new Container(
                                        child: Column(
                                          children: [
                                            Text(
                                                'Si en la tabla de información del curso dentro de Cursin, la emisión del certificado se encuentra marcada como "con certificado gratis" significa que no tendrás que pagar absolutamente nada por dicho diploma.\n\nSi en la tabla de información del curso dentro de Cursin, la emisión del certificdo se encuentra marcada como "sin certificado gratis" significa que puede que no emitan ningún certificado, o que puede que cobren por ello.\n'),
                                            Text(
                                                'Cada plataforma dueña de los cursos gratis es autónoma en la manera de emitir los certificados de finalización.'),
                                            Text(
                                                '\nLa mayoria de las plataformas libera los certificados una vez se alcanza el 100% de todas las clases o lecciones que conforman el curso.'),
                                            Text(
                                                '\nDependiendo de la plataforma que emite el curso, es posible que el certificado lo envíen directamente a tu correo electronico asociado'),
                                            Text(
                                                '\nDependiendo de la plataforma que emite el curso, es posible que el certificado pueda descargarse directamente. Por lo tanto, te recomendamos que abras el curso con el navegador si deseas descargar el certificado en tu dispositivo.'),
                                          ],
                                        ),
                                      )),
                                ],

                                //img button save
                              )),
                        ),
                      ] // Add all items you wish to show when the tile is expanded
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: drawerCursin(context: context),
      //ad banner bottom screen
      bottomNavigationBar: _anchoredAdaptiveAd != null && _isLoaded
    ? Container(
        color: Colors.green,
        width: _anchoredAdaptiveAd!.size.width.toDouble(),
        height: _anchoredAdaptiveAd!.size.height.toDouble(),
        child: AdWidget(ad: _anchoredAdaptiveAd!),
      )
    : Container(
        color: Colors.green, // Aquí se establece el color del Container
        width: _anchoredAdaptiveAd!.size.width.toDouble(),
        height: _anchoredAdaptiveAd!.size.height.toDouble(),
        child: AdWidget(ad: _anchoredAdaptiveAd!),
      ),
    );
  }
}
