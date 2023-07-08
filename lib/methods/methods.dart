import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mailto/mailto.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Methods{



  void compartirUrl(nameCourse) {
    Share.share("Acabé de encontrar un " +
        nameCourse +
        " GRATIS y CON CERTIFICADO incluido 🥳" +
        "\n\nDan acceso a este y otros cursos gratis en esta App llamada Cursin 👏🏻" +
        " Aprovechala que recién la acaban de sacar en la PlayStore 🥳👇🏼" +
        "\n\nhttps://play.google.com/store/apps/details?id=com.appcursin.blogspot");
  }


    //metodo para ejecutar el link de abrir en Chrome
  void openUrl(url) async {
    if (await canLaunch(url)) launch(url);
  }

  void copiarEnlace(url) {
    Clipboard.setData(ClipboardData(text: url));
    Fluttertoast.showToast(
      msg: "Enlace copiado", // message
      toastLength: Toast.LENGTH_LONG, // length
      gravity: ToastGravity.BOTTOM, // location
    );
  }
}