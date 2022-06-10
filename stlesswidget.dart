import 'portraitstfulwidget.dart';
import 'package:flutter/material.dart';
import 'package:hilowcardgameapp/responsivehelper.dart';
import 'landscapestfulwidget.dart';
import 'mobilelandscapemode.dart';
import 'mobileportraitmode.dart';

class Textbutton3 extends StatelessWidget {
  const Textbutton3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text(
              'About',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Blaka-Regular',
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            content: const Text(
              'High Low Game is a Nice Game. Enjoy!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Blaka-Regular',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
      child: const Text(
        'About',
        style: TextStyle(
          fontFamily: 'Blaka-Regular',
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class Textbutton2 extends StatelessWidget {
  const Textbutton2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text(
              'Mechanics',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Blaka-Regular',
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            content: const Text(
              ' > for greater than, < for less than and N for next card. First card is provided to players. The players will guess if the next card to be overturned will be higher or lower than the previous',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Blaka-Regular',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
      child: const Text(
        'Mechanics',
        style: TextStyle(
          fontFamily: 'Blaka-Regular',
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class Textbutton1 extends StatelessWidget {
  const Textbutton1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SecondScreen()));
      },
      child: const Text(
        'New Game',
        style: TextStyle(
          fontFamily: 'Blaka-Regular',
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class Imagewidget extends StatelessWidget {
  const Imagewidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      fit: FlexFit.tight,
      child: Image.asset(
        'assets/images/card.png',
        height: 600.0,
        width: 600.0,
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: ResponsiveWidget(
          mobile: PortraitORLandscape(),
          desktopportrait: MobileMode(),
          desktoplandscape: DesktopMode(),
        ),
      ),
      backgroundColor: Colors.green[200],
    );
  }
}

class DesktopMod extends StatefulWidget {
  const DesktopMod({
    Key? key,
  }) : super(key: key);

  @override
  State<DesktopMod> createState() => _DesktopModState();
}

class _DesktopModState extends State<DesktopMod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/first.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'High/Low Card Game',
              style: TextStyle(
                fontFamily: 'Blaka-Regular',
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            const Padding(padding: EdgeInsets.all(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Imagewidget(),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Textbutton1(),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Textbutton2(),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: Textbutton3(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MobileMod extends StatelessWidget {
  const MobileMod({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/first.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: const [
            Padding(padding: EdgeInsets.all(10)),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Text(
                'High/Low Card Game',
                style: TextStyle(
                  fontFamily: 'Blaka-Regular',
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Imagewidget(),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Textbutton1(),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Textbutton2(),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Textbutton3(),
            ),
          ],
        ),
      ),
    );
  }
}

class Mobile extends StatelessWidget {
  const Mobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/first.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: const [
            Padding(padding: EdgeInsets.all(10)),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Text(
                'High/Low Card Game',
                style: TextStyle(
                  fontFamily: 'Blaka-Regular',
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Imagewidget(),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Textbutton1(),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Textbutton2(),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Textbutton3(),
            ),
          ],
        ),
      ),
    );
  }
}

class PortraitORLandscape extends StatefulWidget {
  const PortraitORLandscape({Key? key}) : super(key: key);

  @override
  State<PortraitORLandscape> createState() => _PortraitORLandscapeState();
}

class _PortraitORLandscapeState extends State<PortraitORLandscape> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => orientation == Orientation.portrait
          ? buildPortrait()
          : buildLandscape(),
    );
  }

  Widget buildPortrait() => const Scaffold(
        body: MobilePortrait(),
      );

  Widget buildLandscape() => const Scaffold(
        body: MobileLandscape(),
      );
}

class Flipcard extends StatefulWidget {
  final String imgpath;
  const Flipcard({required Key key, required this.imgpath}) : super(key: key);

  @override
  State<Flipcard> createState() => _FlipcardState();
}

class _FlipcardState extends State<Flipcard> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.imgpath,
      key: ValueKey<String>(widget.imgpath),
      height: 250,
      width: 175,
      fit: BoxFit.fill,
    );
  }
}

class FlipcardMobile extends StatefulWidget {
  const FlipcardMobile({Key? key, required this.imagpath}) : super(key: key);
  final String imagpath;

  @override
  State<FlipcardMobile> createState() => _FlipcardMobileState();
}

class _FlipcardMobileState extends State<FlipcardMobile> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.imagpath,
      key: ValueKey<String>(widget.imagpath),
      height: 100,
      width: 50,
      fit: BoxFit.fill,
    );
  }
}

class FlipcardMobileLandscape extends StatefulWidget {
  const FlipcardMobileLandscape({Key? key, required this.imagpath})
      : super(key: key);
  final String imagpath;

  @override
  State<FlipcardMobileLandscape> createState() =>
      _FlipcardMobileLandscapeState();
}

class _FlipcardMobileLandscapeState extends State<FlipcardMobileLandscape> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.imagpath,
      key: ValueKey<String>(widget.imagpath),
      height: 240,
      width: 180,
      fit: BoxFit.fill,
    );
  }
}