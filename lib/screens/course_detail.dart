import 'dart:io';
import 'package:cursin/dialogs/dialog_class.dart';
import 'package:cursin/screens/drawer/drawer_options/certificados.dart';
import 'package:cursin/screens/drawer/drawer_options/courses_favs.dart';
import 'package:cursin/screens/drawer/drawer_options/delete_anun.dart';
import 'package:giff_dialog/giff_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cursin/model/curso_lista_model.dart';
import 'package:cursin/screens/course_option.dart';
import 'package:cursin/model/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class CourseDetail extends StatefulWidget {
  curso td;

  CourseDetail(
      {required this.td, required this.catProvino, required this.puntoPartida});

  late String puntoPartida;
  late String catProvino;

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

const int maxAttempts = 3;

//clase que muestra una pantalla con toda la informacion y detalles del curso que el usuario desea ver
class _CourseDetailState extends State<CourseDetail> {
  DialogsCursin dialogs = DialogsCursin();

  late DatabaseHandler handler;
  late bool adForCourse;
  late BannerAd staticAd;
  bool staticAdLoaded = false;

  static const AdRequest request = AdRequest(
      //keywords: ['',''],
      //contentUrl: '',
      //nonPersonalizedAds: false
      );

  void loadStaticBannerAd() {
    staticAd = BannerAd(
        adUnitId:
            //test: ca-app-pub-3940256099942544/6300978111 
            'ca-app-pub-3940256099942544/6300978111',
        size: AdSize.banner,
        request: request,
        listener: BannerAdListener(onAdLoaded: (ad) {
          setState(() {
            staticAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('ad failed to load ${error.message}');
        }));

    staticAd.load();
  }

  //initializing intersticial ad
  InterstitialAd? interstitialAd;
  int interstitialAttempts = 0;

  //initializing reward ad
  RewardedAd? rewardedAd;
  int rewardedAdAttempts = 0;

   //Creating interstitial
  //not used for the moment
  void createInterstitialAd() {
    InterstitialAd.load(
        // ignore: deprecated_member_use
        adUnitId: InterstitialAd.testAdUnitId,
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
          interstitialAd = ad;
          interstitialAttempts = 0;
        }, onAdFailedToLoad: (error) {
          interstitialAttempts++;
          interstitialAd = null;
          print('failed to load ${error.message}');

          if (interstitialAttempts <= maxAttempts) {
            createInterstitialAd();
          }
        }));
  }
 
  //showing interstitial
  void showInterstitialAd() {
    if (interstitialAd == null) {
      print('trying to show before loading');
      enterAcces++;

      if (enterAcces == 1 || enterAcces == 2) {
        createInterstitialAd();
        Fluttertoast.showToast(
          msg: "Reintentando...", // message
          toastLength: Toast.LENGTH_SHORT, // length
          gravity: ToastGravity.CENTER, // location
        );
      } else if (enterAcces == 3) {
        Fluttertoast.showToast(
          msg: "Tu telefono no ha cargado todos los componentes.", // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
        );
      } else if (enterAcces == 4 || enterAcces == 5) {
        Fluttertoast.showToast(
          msg: "Cambiate a un Wi-Fi más cercano\nReintentando...", // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
        );

        Navigator.pop(context);

        dialogs.showDialogProblemAds(context);
      } else if (enterAcces >= 6) {
         Fluttertoast.showToast(
          msg:
              "Es necesario que tu teléfono cargue los anuncios completamente. Acceso limitado", // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
        );

        //si definitivamente no ha cargado despues de 5 intentos, se genera un random al 50% para ingresar

        int number = 0;
        var rng = Random();
        number = rng.nextInt(2); // 50%
        print("numero aleatorio es: " + number.toString());

        if (number == 1) {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  courseOption(
                nameCourse: widget.td.title,
                urlCourse: widget.td.urlcourse,
                imgCourse: widget.td.imgcourse,
                nombreEntidad: widget.td.entidad,
              ),
              transitionDuration:
                  Duration(milliseconds: 500), // Duración de la transición
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          );
        }
        enterAcces = 0;
      }

      
      return;
    }

    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (ad) => print('ad showed $ad'),

        //when ad went closes
        onAdDismissedFullScreenContent: (ad) async {

          //open screen to select option how to see course
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => courseOption(
                    nameCourse: widget.td.title,
                    urlCourse: widget.td.urlcourse,
                    imgCourse: widget.td.imgcourse,
                    nombreEntidad: widget.td.entidad,
                  )));

          ad.dispose();
          createInterstitialAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          print('failed to show the ad $ad');
        });

    interstitialAd!.show();
    interstitialAd = null;
  }

  //creating rewarded
/*   //used for the moment
  void createRewardedAd() {
    RewardedAd.load(
        adUnitId: //rewarded ad, test: ca-app-pub-3940256099942544/5354046379 || real: ca-app-pub-4336409771912215/7921940595

            'ca-app-pub-4336409771912215/7921940595',
        request: request,
        rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad) {
          rewardedAd = ad;
          rewardedAdAttempts = 0;
        }, onAdFailedToLoad: (error) {
          rewardedAdAttempts++;
          rewardedAd = null;
          print('failed to load ${error.message}');

          if (rewardedAdAttempts <= maxAttempts) {
            createRewardedAd();
          }
        }));
  }

  //showing rewarded
  void showRewardedAd() {
    if (rewardedAd == null) {
      print('trying to show before loading');
      enterAcces++;

      if (enterAcces == 1 || enterAcces == 2) {
        Fluttertoast.showToast(
          msg: "Reintentando...", // message
          toastLength: Toast.LENGTH_SHORT, // length
          gravity: ToastGravity.CENTER, // location
        );
      } else if (enterAcces == 3) {
        Fluttertoast.showToast(
          msg: "Tu telefono no ha cargado todos los componentes.", // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
        );
      } else if (enterAcces == 4 || enterAcces == 5) {
        Fluttertoast.showToast(
          msg: "Cambiate a un Wi-Fi más cercano\nReintentando...", // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
        );

        Navigator.pop(context);
      } else if (enterAcces >= 6) {
        Fluttertoast.showToast(
          msg:
              "Es necesario que tu teléfono cargue los anuncios completamente. Acceso limitado", // message
          toastLength: Toast.LENGTH_LONG, // length
          gravity: ToastGravity.CENTER, // location
        );

        //si definitivamente no ha cargado despues de 5 intentos, se genera un random al 50% para ingresar

        int number = 0;
        var rng = Random();
        number = rng.nextInt(2); // 50%
        print("numero aleatorio es: " + number.toString());

        if (number == 1) {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  courseOption(
                nameCourse: widget.td.title,
                urlCourse: widget.td.urlcourse,
                imgCourse: widget.td.imgcourse,
                nombreEntidad: widget.td.entidad,
              ),
              transitionDuration:
                  Duration(milliseconds: 500), // Duración de la transición
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          );
        }
        enterAcces = 0;
      }

      _showDialogProblemAds(context);

      return;
    }

    rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (ad) => print('ad showed $ad'),

        //when ad went closes
        onAdDismissedFullScreenContent: (ad) async {

          //set recent course acces, load actual last course
          SharedPreferences lastCourse = await SharedPreferences.getInstance();
          lastCourse.setString('lastCourse', widget.td.title);

          //open screen to select option how to see course
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => courseOption(
                    nameCourse: widget.td.title,
                    urlCourse: widget.td.urlcourse,
                    imgCourse: widget.td.imgcourse,
                    nombreEntidad: widget.td.entidad,
                  )));

          ad.dispose();
          createRewardedAd();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          print('failed to show the ad $ad');

          //Toast diciendo: no se han podido cargar los anuncios.\n Asegurate de tener una buena conexión a internet, volver a abrir la App o intentar abrir el curso mas tarde, cuando los anuncios estén cargados en tu telefono.
          Fluttertoast.showToast(
            msg:
                "No se han podido cargar los anuncios.\nIntentalo de nuevo en 5 segundos", // message
            toastLength: Toast.LENGTH_LONG, // length
            gravity: ToastGravity.BOTTOM, // location
          );

          createRewardedAd();
        });

    rewardedAd!.show(onUserEarnedReward: (ad, reward) {
      print('reward video ${reward.amount} ${reward.type}');
    });
    rewardedAd = null;
  }
 */
  String getCoursesStringShP = "";
  String validadorCursoGuardado = "Guardar curso";
  bool click = false;

  Future<void> getSharedPrefs() async {
    SharedPreferences cursosFavString = await SharedPreferences.getInstance();

    String? coursesFavorites = cursosFavString.getString('coursesFavorites');

    if (coursesFavorites != null) {
      setState(() {
        getCoursesStringShP = coursesFavorites;
      });
    } else {
      // Aquí puedes manejar el caso en que no se obtenga un valor válido
      // Puedes mostrar un aviso, asignar un valor por defecto, o realizar cualquier otra acción necesaria.
    }
  }

  int enterAcces = 0;

  bool? darkTheme1;

  Future<Null> getSharedThemePrefs() async {
    SharedPreferences themePrefs = await SharedPreferences.getInstance();
    setState(() {
      darkTheme1 = themePrefs.getBool('isDarkTheme');
    });
  }

  @override
  void initState() {
    //es necesario inicializar el sharedpreferences tema, para que la variable book darkTheme esté inicializada como la recepcion del valor del sharedpreferences
    getSharedThemePrefs();

    adForCourse = false;
    //createInterstitialAd();
    loadStaticBannerAd();
    //createRewardedAd();
    createInterstitialAd();

    getSharedPrefs();
    super.initState();
  }

  int randNum = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);

        if (widget.puntoPartida == 'fav') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => CoursesFavs()),
          );
        }

        return true;
      },
      child: Scaffold(
        backgroundColor: darkTheme1 == true ? Colors.grey[850] : Colors.white,
        appBar: AppBar(
          title: Text(
            widget.td.title,
            style: TextStyle(
              fontSize: 16.0, /*fontWeight: FontWeight.bold*/
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: IconButton(
                icon: Icon(Icons.share_outlined),
                onPressed: () {
                  dialogs.shareCourse(widget.td.title, widget.td.entidad);
                },
              ),
            ),
          ],
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            //vertical: 10,
            horizontal: 8,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),

                Stack(children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(
                          1.0, 1.0, 0.0, 1.0), //borde de la imagen
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: CachedNetworkImage(
                          imageUrl: widget.td.imgcourse,
                          width: 400.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          placeholderFadeInDuration:
                              Duration(milliseconds: 200),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      )),
                  // ICONO EN LA ESQUINA SUPERIOR DERECHA
                  Positioned(
                    top: 5,
                    right: 2,
                    child: ClipRect(
                      child: Container(
                        color: Color.fromARGB(0, 0, 0, 0),
                        child: CachedNetworkImage(
                          imageUrl: widget.td.emision ==
                                  'Con certificado gratis'
                              ? 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjRLFEHYVoLlL4hmFrf_qEamOxDChdKy-7qYGmeT_ca1X62LuytAVqc2gXWDemQpOe1Kf-2FUQElVYx8583Kk12sN7siuSabRY-iDCDfAqdW9mZEWQF-EAcsAhLM08leySmOYu6T-SgxuswHvxjcXgEdT8vWGcQgi1dQ_zcUhXoGhW4eg--sG1-tWyg/s1600/0623.png'
                              : 'https://blogger.googleusercontent.com/img/a/AVvXsEjHD0pCtfjYChXbmlmbbZ-xHsf0EH1Jfzx2j7utG-3_3Rz5UvftUT9SfxAJ8iw3R59mQtN6pwk7iY6M0OO9I3eMzLqzIQeCIbBWoA6U3GtuVh1UWsHYANbPPKQWHmd41p3lAmXGexXG62eEtmmbdsldbmRyemO2B1zp4SrCslPg8wvxd9PbHWaFbA',
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.contain,
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 20,
                ),

                //NOMBRE CURSO
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(widget.td.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: darkTheme1 == true
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: darkTheme1 == true ? Colors.grey : Colors.black,
                    ),
                  ],
                ),

                //IDIOMA
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: RichText(
                                text: TextSpan(
                              text: "🗣️ Idioma:",
                              style: new TextStyle(
                                fontSize: 15.0,
                                color: darkTheme1 == true
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(widget.td.idioma,
                                style: TextStyle(
                                    color: darkTheme1 == true
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: darkTheme1 == true ? Colors.grey : Colors.black,
                    ),
                  ],
                ),

                //ENTIDAD
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: RichText(
                                text: TextSpan(
                              text: "🏢 Entidad:",
                              style: new TextStyle(
                                fontSize: 15.0,
                                color: darkTheme1 == true
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(widget.td.entidad,
                                style: TextStyle(
                                    color: darkTheme1 == true
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: darkTheme1 == true ? Colors.grey : Colors.black,
                    ),
                  ],
                ),

                //CATEGORIA
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: RichText(
                                text: TextSpan(
                              text: "🗂️ Categoría:",
                              style: new TextStyle(
                                fontSize: 15.0,
                                color: darkTheme1 == true
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(widget.td.categoria,
                                style: TextStyle(
                                    color: darkTheme1 == true
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: darkTheme1 == true ? Colors.grey : Colors.black,
                    ),
                  ],
                ),

                //DURACIÓN
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: RichText(
                                text: TextSpan(
                              text: "🕑 Duración:",
                              style: new TextStyle(
                                fontSize: 15.0,
                                color: darkTheme1 == true
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(widget.td.duracion,
                                style: TextStyle(
                                    color: darkTheme1 == true
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: darkTheme1 == true ? Colors.grey : Colors.black,
                    ),
                  ],
                ),

                //TIPO DE EMISION
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                              child: RichText(
                                  text: TextSpan(
                            text: "🎖️ Tipo de emisión:",
                            style: new TextStyle(
                              fontSize: 15.0,
                              color: darkTheme1 == true
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ))),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => certificadosScreen()),
                              );
                            },
                            child: Center(
                              child: Text(
                                widget.td.emision,
                                style: TextStyle(
                                    color: darkTheme1 == true &&
                                            widget.td.emision ==
                                                'Con certificado gratis'
                                        ? Colors.green
                                        : darkTheme1 == false &&
                                                widget.td.emision ==
                                                    'Con certificado gratis'
                                            ? Colors.green
                                            : darkTheme1 == false ||
                                                    darkTheme1 == true &&
                                                        widget.td.emision !=
                                                            'Con certificado gratis'
                                                ? Colors.grey
                                                : null,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: darkTheme1 == true ? Colors.grey : Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => certificadosScreen()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  'Ver certificados',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                //BOTON COMPARTOR CURSP
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.symmetric(horizontal: 2.0),
                          child: ElevatedButton.icon(

                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Cambia "Colors.blue" por el color que desees
                              ),
                            onPressed: () {
                              setState(() {
                                click = !click;
                                //validadorCursoGuardado = "Curso guardado";
                              });
                              sendSharedPreferences();
                            },
                            icon: Icon(
                              getCoursesStringShP.contains(widget.td.title) ==
                                          true ||
                                      click == true
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              // <-- Icon
                              size: 20.0,
                            ),
                            label: Text(
                              getCoursesStringShP.contains(widget.td.title) ==
                                          true ||
                                      click == true
                                  ? 'Curso guardado'
                                  : 'Guardar curso',
                            ), // <-- Text
                          ),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: ElevatedButton.icon(
                                   style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Cambia "Colors.blue" por el color que desees
                                    ),
                            onPressed: () {
                              dialogs.shareCourse(widget.td.title, widget.td.entidad);
                            },
                            icon: Icon(
                              // <-- Icon
                              Icons.share,
                              size: 20.0,
                            ),
                            label: Text('Compartir'), // <-- Text
                          ),
                        ),
                        Align(
                        alignment: Alignment.center,
                        child: Container(
                        width: 30,
                        alignment: Alignment.topCenter,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, // Background color
                          ),
                          onPressed: () {
                            dialogs.showDialogToReportProblem(context, widget.td.title, widget.td.entidad);
                          },
                          icon: Icon(
                            Icons.bug_report,
                            size: 12,
                          ),
                          label: Text(
                            '',
                            style: TextStyle(fontSize: 10),
                          ), // <-- Text
                        ),
                      ),
                    ),
                      ],
                    ),

                    
                    SizedBox(
                      height: 5,
                    ),
                    
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

                // DESCRIPCION Y DETALLES
                Column(
                  children: [
                    Container(
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(50, 138, 138, 138),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                            child: RichText(
                                text: TextSpan(
                              text: "Detalles\n",
                              style: new TextStyle(
                                fontSize: 18.0,
                                color: darkTheme1 == true
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(3, 5, 1, 7),
                            child: RichText(
                              text: TextSpan(
                                  text: descriptionFix(),
                                  style: TextStyle(
                                      color: darkTheme1 == true
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.normal)),
                            ),
                          ),
                        ])),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      onPressed: () async {
                        //Read all coins saved
                        SharedPreferences coinsPrefs =
                            await SharedPreferences.getInstance();

                        int actualCoins =
                            coinsPrefs.getInt('cursinCoinsSHP') ?? 2;

                        if (actualCoins >= 12) {
                          //Navigator.pop(context); //close dialog
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => courseOption(
                                      nameCourse: widget.td.title,
                                      urlCourse: widget.td.urlcourse,
                                      imgCourse: widget.td.imgcourse,
                                      nombreEntidad: widget.td.entidad,
                                    )),
                          );
                        } else {
                          //show dialog saying that ads keep service of the app
                          showDialogCourse(
                              context,
                              widget.td.imgcourse,
                              widget.td.title,
                              widget.td.entidad,
                              widget.td.urlcourse);

                          //Test de acceso libre
                          /*Navigator.pop(context); //close dialog
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => courseOption(
                                    nameCourse: widget.td.title,
                                    urlCourse: widget.td.urlcourse,
                                    imgCourse: widget.td.imgcourse,
                                    nombreEntidad: widget.td.entidad,
                                  )),
                        );
                        */
                        }
                      },
                      icon: Icon(
                        Icons.play_arrow,
                        size: 20.0,
                      ),
                      label: Text('Ir al curso'), // <-- Text
                    ),
                  ),
                ),

                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),

        //ad banner bottom screen
        bottomNavigationBar: Container(
          height: 60,
          child: Center(
            child: Column(
              children: [
                Container(
                  //load de ad and give size
                  child: AdWidget(
                    ad: staticAd,
                  ),
                  width: staticAd.size.width.toDouble(),
                  height: staticAd.size.height.toDouble(),
                  alignment: Alignment.bottomCenter,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showDialogCourse(
      BuildContext context, String img, title, entidad, urlcourse) {
    showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: Opacity(
            opacity: a1.value,
            child: NetworkGiffDialog(
              image: CachedNetworkImage(
                imageUrl: img,
                fit: BoxFit.cover,
              ),
              title: Text(
                '👀 Antes de ir...',
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              description: Text(
                'Puedes tomar este curso y reanudarlo cuando lo necesites. ' +
                    'Verás un pequeño anuncio para seguir manteniendo la app Cursin. \n\nGracias por tu apoyo.',
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
              buttonCancelText: const Text(
                'Eliminar anuncios',
                style: TextStyle(color: Colors.white),
              ),
              buttonOkText: const Text(
                'De acuerdo',
                style: TextStyle(color: Colors.white),
              ),
              buttonOkColor: Colors.green,
              onOkButtonPressed: () async {
                //validate if networf conection exist
                try {
                  //validating internet conection
                  final result = await InternetAddress.lookup('google.com');
                  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                    print('connected');

                    //data that ask if the last acces to course is the same course in the moment:
                    SharedPreferences lastCourse =
                        await SharedPreferences.getInstance();
                    lastCourse.getString('lastCourse');

                    //if actual course is the same to last course
                    if (title == lastCourse.getString('lastCourse')) {
                      //no ads for the same course, go course without see ads
                      print('no ads for the same course');

                      //close this screen
                      //Navigator.pop(context);

                      //go to webview screen
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => courseOption(
                                  nameCourse: title,
                                  urlCourse: urlcourse,
                                  imgCourse: img,
                                  nombreEntidad: entidad,
                                )),
                      );
                    } else {
                      showInterstitialAd();
                      //showRewardedAd(); //show ad
                      Navigator.pop(context); //close dialog
                    }
                  }
                  //if doesnt exist conection, then show toast to advert
                } on SocketException catch (_) {
                  //toast no conection exist
                  Fluttertoast.showToast(
                    msg:
                        "No estas conectado a internet.\nUsa Wi-Fi o datos moviles.", // message
                    toastLength: Toast.LENGTH_LONG, // length
                    gravity: ToastGravity.CENTER, // location
                  );
                }
              },
              onCancelButtonPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => deleteAnunScreen()),
                );
              },
            ),
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) => Container(),
    );
  }


  //this method fix the not jump line, adding a \n
  descriptionFix() {
    String description = widget.td.description;
    String newDescription = description.replaceAll("+", "\n");
    return newDescription;
  }

  int randomNumber() {
    int number = 0;
    var rng = Random();
    number = rng.nextInt(4);
    return number;
  }
  
  Future<void> sendSharedPreferences() async {
    SharedPreferences cursosFavString = await SharedPreferences.getInstance();
    String? getCoursesStringShP = cursosFavString.getString('coursesFavorites');

    //elimina la palabra 'curso de' de ese string
    final newTitle = widget.td.title;

    //No se efectúa el registro si ya existe el titulo en el ShP
    if (getCoursesStringShP?.contains(widget.td.title) == true) {
      //elimina el curso guardado
      final value = getCoursesStringShP;
      final newValue = value?.replaceAll(widget.td.title,
          ""); //reemplaza todo titulo que contenga el titulo de curso, por un sin espacio

      //sending new script titles
      cursosFavString.setString('coursesFavorites', newValue.toString());
      Fluttertoast.showToast(msg: 'Curso eliminado de Favoritos');

      print("value de cadena sin el curso: $newValue");
    } else {
      //si el shP está vacio, agrega entonces el primer curso titulo
      if (getCoursesStringShP == null) {
        //se envia por primera vez el primer script de titulo
        cursosFavString.setString('coursesFavorites', newTitle);
        Fluttertoast.showToast(msg: 'Curso guardado en Favoritos');
      } else {
        //sino, quiere decir que ya tiene titulos y pasa a concatenar
        String? oldCoursesString = getCoursesStringShP;
        String newCoursesString = oldCoursesString + "," + newTitle;

        //sending new script titles
        cursosFavString.setString('coursesFavorites', newCoursesString);
        Fluttertoast.showToast(msg: 'Curso guardado en Favoritos');
      }
    }
  }
}
