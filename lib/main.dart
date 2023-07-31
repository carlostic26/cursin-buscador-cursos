import 'dart:async';
import 'package:cursin/ad_ids.dart';
import 'package:cursin/services/localStorage/theme_preferences.dart';
import 'package:cursin/screens/launch/loading_screen/percent_indicator_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cursin/model/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppOpenAd? openAd;
bool isAdLoaded = false;

bool shouldShowAd = false;
adCursin ads = adCursin(); 

Future<void> loadAd() async {
  await AppOpenAd.load(
    adUnitId:      
        ads.openApp,
    request: const AdRequest(),
    adLoadCallback: AppOpenAdLoadCallback(
      onAdLoaded: (ad) {
        openAd = ad;
        openAd!.show();
        print("**Anuncio cargado correctamente");
        isAdLoaded = true; // El anuncio se cargó y mostró correctamente
      },
      onAdFailedToLoad: (error) {
        print("Error al cargar el anuncio: $error");
        isAdLoaded = false; // El anuncio no se cargó o mostró correctamente
      },
    ),
    orientation: AppOpenAd.orientationPortrait,
  );
}

Future<void> main() async {
  // init adv
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  //init theme
  final themePreference = ThemePreference();
  await themePreference.initialize();

  //init db sqlite
  await DatabaseHandler().initializeDB();

  await MobileAds.instance.initialize();
  // Inicializar anuncio de apertura y cancelar después de 9 segundos
  await loadAd();
  
  Timer(Duration(seconds: 9), () async {
    if (!shouldShowAd) { // Si el anuncio no se ha cargado
      openAd?.dispose();
      print('Anuncio de apertura cancelado después de 9 segundos.');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('adCancelado', true);
    } else { // Si el anuncio se ha cargado
      if (isAdLoaded) { // Verifica que el anuncio se haya mostrado previamente
        print('Anuncio de apertura mostrado correctamente.');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('adCancelado', false);
        openAd?.show();
      }
    }
  });

  runApp(ProviderScope(
    child: MaterialApp(
      // Configuración del tema
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          // Color de fondo del AppBar
          color: Colors.green,          
          // Iconos y elementos interactivos en el AppBar
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),

      debugShowCheckedModeBanner: false,
      home: PercentIndicatorRiverpod(),
    ),
  ));
}
