import 'package:flutter/material.dart';
import 'package:flutter_examples/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationsRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => const HomePage(),
  };
}
