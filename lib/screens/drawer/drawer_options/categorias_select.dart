import 'package:cached_network_image/cached_network_image.dart';
import 'package:cursin/helpers/methods/methods.dart';
import 'package:cursin/helpers/widgets/widgets.dart';
import 'package:cursin/screens/drawer/drawer.dart';
import 'package:cursin/model/curso_lista_model.dart';
import 'package:cursin/screens/drawer/drawer_options/categorias_showing.dart';
import 'package:cursin/model/dbhelper.dart';
import 'package:cursin/screens/drawer/drawer_options/search_courses.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoriasSelectCards extends StatefulWidget {
  @override
  _CategoriasSelectCardsState createState() => _CategoriasSelectCardsState();
}

class _CategoriasSelectCardsState extends State<CategoriasSelectCards> {
  // class method img from net to icons category
  Methods methods = Methods();

  // class of widgets
  WidgetsCursin widgetCursin = WidgetsCursin();

  late DatabaseHandler handler;
  // ignore: unused_field
  List<curso>? _cat;

  bool? darkTheme1;

  Future<Null> getSharedThemePrefs() async {
    SharedPreferences themePrefs = await SharedPreferences.getInstance();
    setState(() {
      darkTheme1 = themePrefs.getBool('isDarkTheme');
    });
  }

  @override
  // ignore: must_call_super
  void initState() {
    getSharedThemePrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkTheme1 == true ? Colors.grey[850] : Colors.white,
      appBar: AppBar(
        title: Text(
          "Todas las Categorias",
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
      body: widgetCursin.menuCategorias(context, darkTheme1),
      drawer: drawerCursin(
        context: context,
      ),
    );
  }
}
