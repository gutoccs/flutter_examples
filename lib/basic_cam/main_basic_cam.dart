import 'package:flutter/material.dart';

import 'dart:io';

import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_examples/basic_cam/basic_cam_provider.dart';
import 'package:flutter_examples/widgets/my_app_bar.dart';

class MainBasicCam extends StatelessWidget {
  const MainBasicCam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BasicCamProvider()),
      ],
      child: Scaffold(
        appBar: myAppBar('Cámara Básica'),
        body: const SingleChildScrollView(
          child: _CreateBody(),
        ),
        bottomNavigationBar: const _CreateSelectionBottomNavigationBar(),
      ),
    );
  }
}

class _CreateBody extends StatelessWidget {
  const _CreateBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 25),
        _ShowImage(),
        SizedBox(height: 15),
        _CreateAdviceToTheUser(),
      ],
    );
  }
}

class _ShowImage extends StatelessWidget {
  const _ShowImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final basicCamProvider = Provider.of<BasicCamProvider>(context);
    final size = MediaQuery.of(context).size;
    final auxSize =
        (size.height >= size.width) ? size.width * 0.7 : size.height * 0.7;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                  bottom: Radius.circular(15),
                ),
                child: (basicCamProvider.changeImage)
                    ? Image.file(
                        File(basicCamProvider.fileImage.path),
                        height: auxSize,
                        width: auxSize,
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        'assets/images/fireworks_min.png',
                        height: auxSize,
                        width: auxSize,
                        fit: BoxFit.fill,
                      ),
              )
            ],
          ),
          SizedBox(height: (basicCamProvider.fileImageError != '') ? 10 : 0),
          if (basicCamProvider.fileImageError != '')
            Text(
              basicCamProvider.fileImageError,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}

class _CreateAdviceToTheUser extends StatelessWidget {
  const _CreateAdviceToTheUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final basicCamProvider = Provider.of<BasicCamProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '¿Cómo obtener mejores resultados?\n',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            (basicCamProvider.optionNavigation == 0)
                ? '- Seleccione una imagen con relación de aspecto 1:1 (cuadrada)'
                : '- No olvides configurar la cámara para que su relación de aspecto sea 1:1',
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class _CreateSelectionBottomNavigationBar extends StatelessWidget {
  const _CreateSelectionBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final basicCamProvider = Provider.of<BasicCamProvider>(context);

    return BottomNavigationBar(
      onTap: (int i) async {
        basicCamProvider.optionNavigation = i;

        switch (i) {
          case 0:
            _processImage(context, ImageSource.gallery);
            break;

          case 1:
            _processImage(context, ImageSource.camera);

            break;
        }
      },
      currentIndex: basicCamProvider.optionNavigation,
      elevation: 0,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.blue,
      iconSize: 28,
      selectedFontSize: 20,
      unselectedFontSize: 14,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.photo_size_select_actual_outlined),
          label: 'Seleccionar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt_outlined),
          label: 'Tomar',
        ),
      ],
    );
  }

  void _processImage(BuildContext context, ImageSource origin) async {
    final imagePicker = ImagePicker();
    final basicCamProvider =
        Provider.of<BasicCamProvider>(context, listen: false);

    final selectImage = await imagePicker.pickImage(
      source: origin,
    );

    if (selectImage != null) basicCamProvider.fileImage = selectImage;
  }
}
