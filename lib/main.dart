//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:org_app/rotas/app_routes.dart';

void main() async {
  /*WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'ORG App';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      initialRoute: '/',
      routes: AppRoutes.rotas(appTitle: appTitle),
    );
  }
}
