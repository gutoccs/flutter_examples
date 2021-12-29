import 'package:flutter/material.dart';

class NotExistsScreen extends StatelessWidget {
  const NotExistsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Página no existe',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        elevation: 0,
      ),
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
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(50, 50),
              textStyle: const TextStyle(
                fontSize: 24,
              ),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.15,
        )
      ],
    );
  }
}
