import 'dart:async';
import 'package:cursin/helpers/methods/methods.dart';
import 'package:cursin/screens/drawer/drawer_options/noticias_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_webview_pro/webview_flutter.dart';

class webviewNewsScreen extends StatefulWidget {
  webviewNewsScreen({required this.urlNew});

  late String urlNew;

  @override
  webviewNewsScreenState createState() => webviewNewsScreenState();
}

class webviewNewsScreenState extends State<webviewNewsScreen> {
  bool isloaded = false;

  late WebViewController _controller;

  final Completer<WebViewController> _controllerCompleter =
      Completer<WebViewController>();

  String modelDevice = '';

  void initState() {
    super.initState();
    isloaded = true;
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  Methods methods = Methods();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _goBack(),
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 20,
              onPressed: () {
                _goBack();
              },
            ),
            title: Text(
              'Noticias Cursin',
              style: TextStyle(fontSize: 15),
            ),
            centerTitle: true,
            actions: <Widget>[
              Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.close,
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  PopupMenuButton<String>(
                    iconSize: 20,
                    onSelected: handleClick,
                    itemBuilder: (BuildContext context) {
                      return {'Copiar Enlace', 'Abrir con el navegador'}
                          .map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  ),
                ],
              ),
            ]),
        body: WebView(
          userAgent:
              'Mozilla/5.0 (Linux; Android 9.0; $modelDevice Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Mobile Safari/537.3',
          //'Mozilla/5.0 (Linux; Android 9.0; Build/N2G48H; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/68.0.3440.70 Mobile Safari/537.36',
          //'Mozilla/5.0 (Linux; Android 9.0; $modelDevice Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Mobile Safari/537.3',
          //Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36

          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controllerCompleter.future.then((value) => _controller = value);
            _controllerCompleter.complete(webViewController);
          },
          initialUrl: widget.urlNew.toString(),
        ),
      ),
    );
  }

  void handleClick(String value) {
    switch (value) {
      case 'Copiar Enlace':
        methods.copiarEnlace(widget.urlNew);
        break;
      case 'Abrir con el navegador':
        methods.openUrl(widget.urlNew);
        break;
    }
  }

  _goBack() {
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => noticiasScreen(context),
      ),
    );
  }
}
