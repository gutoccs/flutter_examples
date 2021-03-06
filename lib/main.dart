import 'package:flutter/material.dart';
import 'package:flutter_examples/pages/not_exists_screen.dart';

import 'package:flutter_examples/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Examples',
      initialRoute: 'home',
      routes: getApplicationsRoutes(),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => const NotExistsScreen(),
        );
      },
    );
  }
}
