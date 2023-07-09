import 'package:cached_network_image/cached_network_image.dart';
import 'package:cursin/helpers/methods/methods.dart';
import 'package:cursin/screens/drawer/drawer_options/categorias_showing.dart';
import 'package:flutter/material.dart';

class WidgetsCursin extends StatefulWidget{

  Methods methods = Methods();

    @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  Widget menuCategorias (BuildContext context, darkTheme1){
    return Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(7, 5, 7, 5),
            child: Column(
              children: [
                //ADMINISTRACION Y FINANZAS
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('finanzas'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 15.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'FINANZAS Y NEGOCIOS',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionados al mundo de las finanzas, la contabilidad, los negocios y la administración',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Finanzas",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //IDIOMAS
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('idiomas'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 16.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'IDIOMAS Y LENGUAJES',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis sobre Inglés, Japonés, Koreano, Ortografía y demás idiomas',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Idiomas",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //Programacion
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: darkTheme1 == true
                          ? Colors.grey[850]
                          : Colors.white, // Your desired background color

                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('desarrollo'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 15.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'DESARROLLO Y PROGRAMACIÓN',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionado con el Software, el desarrollo y la programación en varios lenguajes.',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Programacion",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //TIC
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('tic'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            //alignment: Alignment.center,
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 15.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'INFORMÁTICA Y TIC',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionados a las TIC, electrónica, redes, telecomunicaciones ofimática e informática en general.',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "TIC",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //Marketing digital
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('marketing'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 16.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'MARKETING DIGITAL',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionados con la promoción, publicidad, ventas en linea y marketing en general',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Marketing",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //SEGURIDAD INFORMÁTICA
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('ciberseguridad'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                    height: 50,
                                    width: 50,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                    )),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 11.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'SEGURIDAD INFORMÁTICA',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionados con el haking ético, seguridad en redes, seguridad informática en general',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Ciberseguridad",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //Salud
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('salud'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 15.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'SALUD Y BIENESTAR',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis sobre el área del bienestar y la salud como medicina, psicologia, nutrición, cuidados, entre otros',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Salud",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //Razonamiento Cuantitativo
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('razonamiento'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 16.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'RAZONAMIENTO CUANTITATIVO',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionados con los números, las matematicas, el cálculo, analisis numericos, estadistica y razonamiento cuantitativo en general',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Razonamiento",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //INGENIERIA
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('ingenieria'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 16.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'INGENIERIA',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionados con la ingeniería civil, ingenieria mecánica, ingenieria industrial, ingenieria mecatrónica y afines.',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Ingenieria",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //PROFESIONALES
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('profesionales'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 16.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'FORMACIÓN PROFESIONAL',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionados con el mejoramiento y crecimiento del perfil profesional',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Profesionales",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //Ciencia y análisis de datos
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('datos'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 16.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'CIENCIA Y ANÁLISIS DE DATOS',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionados a la ciencia análisis de datos, desde cursos introductorios hasta mas completos con lenguajes y librerías',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene:
                                                "Ciencia y Análisis de Datos",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //INTELIGENCIA ARTIFICIAL
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('ia'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 16.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'INTELIGENCIA ARTIFICIAL',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionados al mundo de la inteligencia artificial, redes neuronales, deep learning, machine learning, etc...',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "IA",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //CRYPTO Y TRADING
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('cripto'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 16.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'CRYPTO Y TRADING',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionados al mundo de las Criptomonedas, el blockchain y demás tecnologías de la web3',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Crypto",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //ARTES
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('artes'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 30.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ARTES',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionados con el diseño gráfico, dibujo, literatura, actuación y arte en general, incluyendo pintura, escultura, fotografía, historia del arte, entre otros...',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Artes",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //COCINA Y ALIMENTOS
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('cocina'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 11.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'COCINA Y ALIMENTOS',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionados con la preparación y manipulación de alimentos, la nutrición y la gastronomía, incluyendo técnicas de cocina, repostería, panadería, cocina internacional, alimentación saludable, entre otros...',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Cocina y alimentos",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //MUSICA
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('musica'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 16.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'MÚSICA',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionados con los instrumentos musicales, géneros, canto y la música en general, incluyendo teoría musical, técnica de instrumentos, interpretación, composición, entre otros...',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "musica",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //SOCIALES Y JURIDICAS
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('sociales'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 11.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'SOCIALES, SOCIEDADES Y JURÍDICAS',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionados con el derecho, la sociedad, las leyes y el trabajo social, incluyendo derecho, sociología, trabajo social, política, entre otros...',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Sociales",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //AGRO
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('agro'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 11.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'AGROPECUARIO',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionados con el sector agrícola y pecuario, incluyendo agricultura, ganadería, horticultura, piscicultura, apicultura, jardinería, entre otros...',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Agropecuario",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //TRANSPORTE
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('transporte'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 11.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'TRANSPORTE',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratuis relacionados con la conducción de vehículos: moto, carro, transporte de carga, transporte en general y más.',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Transporte",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //BELLEZA
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('belleza'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 11.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'MODA Y BELLEZA',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionados con el cuidado de la piel, tatoo, peluqueria, manicure, barberia, pedicure, dermatologia, entre otros...',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Belleza",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //TRABAJOS VARIOS
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('trabajos'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 16.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'TRABAJOS VARIOS',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Encuentra cursos gratis relacionados con trabajos que no requieren una educación formal como limpiador, bodeguero, auxiliar, panadero, voluntario, paseador y más.',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Trabajos Varios",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //OTHERS
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          darkTheme1 == true ? Colors.grey[850] : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      child: new Row(
                        children: <Widget>[
                          Padding(
                            //PADDING OF THE IMAGE
                            padding:
                                const EdgeInsets.fromLTRB(8.0, 8.0, 16.0, 8.0),
                            child: new Container(
                              alignment: Alignment.center,
                              child: CachedNetworkImage(
                                imageUrl: methods.getImgCategoria('otros'),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          new Container(
                            child: Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    8.0, 8.0, 30.0, 8.0),
                                child: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'OTROS CURSOS ...',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Aquí podrás encontrar los cursos que aún no tienen categoria debido al bajo numero registrados',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: darkTheme1 == true
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  onTap: () async {
                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => categorias(
                                            catProviene: "Otros",
                                            puntoPartida: 'categorias_select'),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      
  }
  


}