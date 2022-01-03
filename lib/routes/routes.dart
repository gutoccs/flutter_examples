import 'package:flutter/material.dart';
import 'package:flutter_examples/pages/home_page.dart';
import 'package:flutter_examples/basic_cam/main_basic_cam.dart';
import 'package:flutter_examples/transparent_appbar/main_transparent_app_bar.dart';
import 'package:flutter_examples/page_view/main_page_view.dart';

Map<String, WidgetBuilder> getApplicationsRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => const HomePage(),
    'basic_cam': (BuildContext context) => const MainBasicCam(),
    'transparent_app_bar': (BuildContext context) =>
        const MainTransparentAppBar(),
    'page_view': (BuildContext context) => const MainPageView(),
  };
}
