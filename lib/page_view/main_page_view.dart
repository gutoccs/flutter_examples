import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: const [
          MyPage(
            imageURL:
                'https://pbs.twimg.com/media/FHxm0izXEAA15CY?format=jpg&name=900x900',
            beachName: 'Playa La Cueva',
            beachLocation: 'La Guaira',
            showArrowUp: false,
            showArrowDown: true,
          ),
          MyPage(
            imageURL:
                'https://pbs.twimg.com/media/FHkhkFkXwAAn1vg?format=jpg&name=large',
            beachName: 'Playa Mansa',
            beachLocation: 'Lechería',
            showArrowUp: true,
            showArrowDown: true,
          ),
          MyPage(
            imageURL:
                'https://pbs.twimg.com/media/FH77EbMWYAMaPJZ?format=jpg&name=large',
            beachName: 'Playa El Agua',
            beachLocation: 'Isla de Margarita',
            showArrowUp: true,
            showArrowDown: false,
          ),
        ],
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final String imageURL;
  final String beachName;
  final String beachLocation;
  final bool showArrowUp;
  final bool showArrowDown;

  const MyPage({
    Key? key,
    required this.imageURL,
    required this.beachName,
    required this.beachLocation,
    required this.showArrowUp,
    required this.showArrowDown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle auxTextStyle1 = const TextStyle(
      fontSize: 30,
      color: Colors.white,
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.5),
    );

    TextStyle auxTextStyle2 = const TextStyle(
      fontSize: 22,
      color: Colors.black,
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
    );

    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        FadeInImage.assetNetwork(
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: 'assets/images/island_1526x1170.png',
          image: imageURL,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              beachName,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: auxTextStyle1,
            ),
            const SizedBox(height: 10),
            Text(
              '$beachLocation  🇻🇪',
              maxLines: 2,
              style: auxTextStyle1,
            ),
          ],
        ),
        if (showArrowUp)
          Column(
            children: [
              const Icon(
                Icons.keyboard_arrow_up,
                size: 60,
                color: Colors.white,
              ),
              Text(
                'Desliza hacia abajo',
                style: auxTextStyle2,
              ),
              Expanded(child: Container()),
            ],
          ),
        if (showArrowDown)
          Column(
            children: [
              Expanded(child: Container()),
              Text(
                'Desliza hacia arriba',
                style: auxTextStyle2,
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                size: 60,
                color: Colors.white,
              ),
            ],
          )
      ],
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
