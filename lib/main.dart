import 'dart:async';
import 'package:cursin/controller/theme_preferences.dart';
import 'package:cursin/screens/launch/percent_indicator_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cursin/model/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

AppOpenAd? openAd;
bool isAdLoaded = false;
bool shouldShowAd = false; // Variable adicional para controlar si se debe mostrar el anuncio


Future<void> loadAd() async {
  await AppOpenAd.load(
    adUnitId:
        // test:  // ca-app-pub-3940256099942544/3419835294
        // real: ca-app-pub-4336409771912215/5446190186 || real2:ca-app-pub-4336409771912215/5955842482
        'ca-app-pub-3940256099942544/3419835294',
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
      debugShowCheckedModeBanner: false,
      home: PercentIndicatorRiverpod(),
    ),
  ));
}