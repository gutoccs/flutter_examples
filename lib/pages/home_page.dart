import 'package:flutter/material.dart';
import 'package:flutter_examples/styles/red_button_style.dart';
import 'package:flutter_examples/widgets/my_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Flutter Examples'),
      body: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const MenuButton(
            page: 'basic_cam',
            textPage: 'Cámara Básica',
          ),
          const MenuButton(
            page: 'transparent_app_bar',
            textPage: 'AppBar Transparente',
          ),
          const MenuButton(
            page: 'page_view',
            textPage: 'Page View',
          ),
          const MenuButton(
            page: 'credit_card',
            textPage: 'Tarjeta de Crédito',
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final String page;
  final String textPage;
  const MenuButton({Key? key, required this.page, required this.textPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: redButtonStyle(),
        onPressed: () => Navigator.pushNamed(context, page),
        child: Text(textPage),
      ),
    );
  }
}
