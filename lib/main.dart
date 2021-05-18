import 'package:flutter/material.dart';
import 'package:carrasco/route_generator.dart';

void main() => runApp(CarrascoApp());

class CarrascoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dvid Carrasco',
      initialRoute: "/",
      //home: PageOne(),
      onGenerateRoute: RouteGenerator.generateRoute,
    ); //fin de materialApp
  } //fin de widget
} //fin de clase CarrascoApp

class PageOne extends StatelessWidget {
  String _params = "hola desde p1";
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  PageOne({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key al a scaffold para acceder al scaffold desde otro widget hijo
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Pagina 1 Carrasco'),
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
            child: Text(
              "siguiente pagina",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.black,
            onPressed: () {
              _openSecondPage(context);
            },
          ),
        ),
      ),
    );
  } //fin del widget

  void _openSecondPage(BuildContext context) async {
    String _datoRetornadoDeSecondPage;
    // await para esperar que se regrese dato desde la pantalla que se abre
    await Navigator.of(context)
        .pushNamed(
      "/secondPage",
      arguments: _params,
    )
        .then(
      (response) {
        _datoRetornadoDeSecondPage = response;
      },
    );

    // acceso al scaffold para mostrar snackbar
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          "Texto regresado: $_datoRetornadoDeSecondPage",
        ),
      ),
    );
  } //fin de open_Second Page
} //fin clase pageOne
