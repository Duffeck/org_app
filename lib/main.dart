//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:org_app/providers/posts.dart';
import 'package:org_app/providers/users.dart';
import 'package:org_app/rotas/app_routes.dart';
import 'package:provider/provider.dart';

void main() async {
  /*WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'ORG App';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Posts(),
      child: ChangeNotifierProvider(
        create: (ctx) => Users(),
        child: MaterialApp(
          title: appTitle,
          initialRoute: '/',
          //home: Feed(),
          routes: AppRoutes.rotas(appTitle: appTitle),
        ),
      ),
    );
  }
}
