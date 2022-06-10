import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'stlesswidget.dart';
import 'suits.dart';

class MobileLandscape extends StatefulWidget {
  const MobileLandscape({Key? key}) : super(key: key);

  @override
  State<MobileLandscape> createState() => _MobileLandscapeState();
}

class _MobileLandscapeState extends State<MobileLandscape> {
  final ScrollController controller = ScrollController();
  int xy = 0;
  int get imagePath => deckList[xy].keys;
  late FlipCardController _controller;
  int xy1 = 1;
  int get imagpath => deckList[xy1].keys;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _controller = FlipCardController();
  }

  bool button1 = true, button2 = true, button3 = false;

  void button1Condition() {
    button1 = false;
    button2 = false;
    button3 = true;
  }

  void button2Condition() {
    button1 = false;
    button2 = false;
    button3 = true;
  }

  void button3Condition() {
    button1 = true;
    button2 = true;
    button3 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/first.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    'High or Low...Choose < or >',
                    style: TextStyle(
                      fontFamily: 'Blaka-Regular',
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  const Text(
                    'Deck',
                    style: TextStyle(
                      fontFamily: 'Blaka-Regular',
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          color: Colors.black,
                          height: 240,
                          width: 180,
                          child: FlipcardMobileLandscape(
                            imagpath:
                                'assets/images/${deckList[xy].imgpath}.png',
                            key: ValueKey<int>(imagpath),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(5)),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          color: Colors.black,
                          height: 240,
                          width: 180,
                          child: FlipCard(
                            speed: 500,
                            controller: _controller,
                            flipOnTouch: false,
                            front: Image.asset(
                              'assets/images/playing-card-back.jpg',
                              fit: BoxFit.fill,
                            ),
                            back: FlipCardDetailsLandscape(
                              imagePath:
                                  'assets/images/${deckList[xy1].imgpath}.png',
                              key: ValueKey<int>(imagePath),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black,
              height: MediaQuery.of(context).size.height,
              width: 83,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Opacity(
                    opacity: button1 ? 1.0 : 0.2,
                    child: TextButton(
                      onPressed: () {
                        if (button1) {
                          button1Condition();
                          setState(() {
                            _controller.state?.controller?.forward();
                            if (deckList[xy1].number >= deckList[xy].number) {
                              _counter++;
                              if (_counter <= 5) {
                                store.add(deckList[xy1].imgpath);
                              }
                            } else {
                              _counter = 0;
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                      'Sorry, Please try Again!'),
                                  content: const Text(
                                      'Game Over!Tap OK to home page'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SecondScreen()));
                                        worldShuffle();
                                        store = [];
                                      },
                                      child: const Text('Play Again'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.popUntil(context, (route) {
                                          return route.settings.name == "/";
                                        });
                                        worldShuffle();
                                        store = [];
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          });
                        }
                      },
                      child: const Text(
                        '>',
                        style: TextStyle(
                          fontFamily: 'Blaka-Regular',
                          fontSize: 70,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: button2 ? 1.0 : 0.2,
                    child: TextButton(
                      onPressed: () {
                        if (button2) {
                          button2Condition();
                          setState(() {
                            _controller.state?.controller?.forward();
                            if (deckList[xy1].number < deckList[xy].number) {
                              _counter++;
                              if (_counter <= 5) {
                                store.add(deckList[xy1].imgpath);
                              }
                            } else {
                              _counter = 0;
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                      'Sorry, Please try Again!'),
                                  content: const Text(
                                      'Game Over!Tap OK to home page'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SecondScreen()));
                                        worldShuffle();
                                        store = [];
                                      },
                                      child: const Text('Play Again'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.popUntil(context, (route) {
                                          return route.settings.name == "/";
                                        });
                                        worldShuffle();
                                        store = [];
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          });
                        }
                      },
                      child: const Text(
                        '<',
                        style: TextStyle(
                          fontFamily: 'Blaka-Regular',
                          fontSize: 70,
                          color: Color.fromARGB(255, 255, 17, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: button3 ? 1.0 : 0.2,
                    child: TextButton(
                      onPressed: () {
                        if (button3) {
                          button3Condition();
                          setState(() {
                            xy++;
                            xy1++;
                            _controller.state?.controller?.reset();
                            if ((_counter == 52)) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Congratulations!!'),
                                  content: const Text(
                                      'You guessed all the cards.Tap OK to home page'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SecondScreen()));
                                        worldShuffle();
                                        store = [];
                                      },
                                      child: const Text('Play Again'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.popUntil(context, (route) {
                                          return route.settings.name == "/";
                                        });
                                        worldShuffle();
                                        store = [];
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          });
                        }
                      },
                      child: const Text(
                        'N',
                        style: TextStyle(
                          fontFamily: 'Blaka-Regular',
                          fontSize: 70,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Five Guessed Cards'),
                              content: SingleChildScrollView(
                                child: Column(children: [
                                  SizedBox(
                                    height: 170,
                                    width: 450,
                                    child: ListView.builder(
                                        itemCount: store.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(
                                            height: 170,
                                            width: 130,
                                            child: Center(
                                              child: Image.asset(
                                                'assets/images/${store[index]}.png',
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                                ]),
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
                        });
                      },
                      child: const Text(
                        'Show 5 Cards',
                        style: TextStyle(
                          fontFamily: 'Blaka-Regular',
                          fontSize: 31,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      'Score: $_counter',
                      style: const TextStyle(
                        fontFamily: 'Blaka-Regular',
                        fontSize: 31,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          worldShuffle();
                          store = [];
                          Navigator.popUntil(context, (route) {
                            return route.settings.name == "/";
                          });
                        });
                      },
                      child: const Text(
                        'Home',
                        style: TextStyle(
                          fontFamily: 'Blaka-Regular',
                          fontSize: 31,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}