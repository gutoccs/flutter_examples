import 'package:flutter/material.dart';
import 'package:flutter_examples/pages/home_page.dart';
import 'package:flutter_examples/basic_cam/main_basic_cam.dart';

Map<String, WidgetBuilder> getApplicationsRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => const HomePage(),
    'basic_cam': (BuildContext context) => const MainBasicCam(),
  };
}
