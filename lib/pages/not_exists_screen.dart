import 'package:flutter/material.dart';

import 'package:flutter_examples/styles/red_button_style.dart';
import 'package:flutter_examples/widgets/my_app_bar.dart';

class NotExistsScreen extends StatelessWidget {
  const NotExistsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Página no existe'),
      body: _CreateBody(),
    );
  }
}

class _CreateBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(height: size.height * 0.2),
        const Center(
          child: Text(
            'Esta página no está disponible',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Container(),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              'home',
              (Route<dynamic> route) => false,
            ),
            // ignore: prefer_const_constructors
            child: Text(
              'Ir al inicio',
            ),
            style: redButtonStyle(),
          ),
        ),
        SizedBox(
          height: size.height * 0.15,
        )
      ],
    );
  }
}
