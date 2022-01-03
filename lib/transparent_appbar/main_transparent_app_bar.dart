import 'package:flutter/material.dart';

class MainTransparentAppBar extends StatelessWidget {
  const MainTransparentAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Important
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('AppBar Transparente'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.lightBlue,
        child: const Center(
          child: Text(
            'Cuerpo Body',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
