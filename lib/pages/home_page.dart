import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Examples',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [],
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
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size(50, 50),
      textStyle: const TextStyle(
        fontSize: 24,
      ),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: () => Navigator.pushNamed(context, page),
        child: Text(textPage),
      ),
    );
  }
}
