import 'dart:math';

import 'package:flutter/material.dart';
import 'package:twentyone/playing_card.dart';
import 'package:firebase_admob/firebase_admob.dart';

class MainScreen extends StatefulWidget {
  static PlayingCard playingCard;

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  //list to store all the cards
  List<PlayingCard> allCards = [];

  //the main stack will be used in the game
  List<PlayingCard> mainStack = [];

  //the rows stacks
  List<PlayingCard> leftStack = [];
  List<PlayingCard> middleStack = [];
  List<PlayingCard> rightStack = [];

  String noteText, btnText;

  int round = 0;

  //the function that will define and choose the card type
  String _cardTypeToString(int index, List<PlayingCard> myList) {
    switch (myList[index].cardType) {
      case CardType.one:
        return "1";
      case CardType.two:
        return "2";
      case CardType.three:
        return "3";
      case CardType.four:
        return "4";
      case CardType.five:
        return "5";
      case CardType.six:
        return "6";
      case CardType.seven:
        return "7";
      case CardType.eight:
        return "8";
      case CardType.nine:
        return "9";
      case CardType.ten:
        return "10";
      case CardType.jack:
        return "J";
      case CardType.queen:
        return "Q";
      case CardType.king:
        return "K";
      default:
        return "";
    }
  }

  Image _suitToImage(int index, List<PlayingCard> myList) {
    switch (myList[index].cardSuit) {
      case CardSuit.hearts:
        return Image.asset('images/hearts.png');
      case CardSuit.diamonds:
        return Image.asset('images/diamonds.png');
      case CardSuit.clubs:
        return Image.asset('images/clubs.png');
      case CardSuit.spades:
        return Image.asset('images/spades.png');
      default:
        return null;
    }
  }

  Widget cardsFace(int index, List<PlayingCard> myList) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          border: Border.all(color: Colors.black),
        ),
        height: 70.0,
        width: 45.0,
        child: Stack(
          children: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    _cardTypeToString(index, myList),
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Container(
                    height: 20.0,
                    child: _suitToImage(index, myList),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _cardTypeToString(index, myList),
                      style: TextStyle(fontSize: 10.0),
                    ),
                    Container(
                      height: 10.0,
                      child: _suitToImage(index, myList),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _initMagic();
    myBanner
  // typically this happens well before the ad is shown
  ..load()
  ..show(
    // Positions the banner ad 60 pixels from the bottom of the screen
    anchorOffset: 0.0,
    // Positions the banner ad 10 pixels from the center of the screen to the right
    horizontalCenterOffset: 0.0,
    // Banner Position
    anchorType: AnchorType.bottom,
  );
    super.initState();
  }

  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    birthday: DateTime.now(),
    childDirected: false,
    designedForFamilies: false,
    gender:
    MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
    testDevices: <String>[], // Android emulators are considered test devices
  );

  static BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: 'ca-app-pub-2556925527469330/3321255619',
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

  @override
  Widget build(BuildContext context) {
    AppBar myAppBar() {
      return AppBar(
        centerTitle: true,
        title: Text("21 Cards Magic"),
        backgroundColor: Colors.green[900],
      );
    }

    Column myBody() {
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    cardsFace(0, leftStack),
                    cardsFace(1, leftStack),
                    cardsFace(2, leftStack),
                    cardsFace(3, leftStack),
                    cardsFace(4, leftStack),
                    cardsFace(5, leftStack),
                    cardsFace(6, leftStack),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    cardsFace(0, middleStack),
                    cardsFace(1, middleStack),
                    cardsFace(2, middleStack),
                    cardsFace(3, middleStack),
                    cardsFace(4, middleStack),
                    cardsFace(5, middleStack),
                    cardsFace(6, middleStack),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    cardsFace(0, rightStack),
                    cardsFace(1, rightStack),
                    cardsFace(2, rightStack),
                    cardsFace(3, rightStack),
                    cardsFace(4, rightStack),
                    cardsFace(5, rightStack),
                    cardsFace(6, rightStack),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                Text(
                  noteText,
                  style: TextStyle(color: Colors.indigo[50], fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                RaisedButton(
                  elevation: 4.0,
                  child: Text(
                    btnText,
                    style: TextStyle(
                      color: Colors.red[200],
                    ),
                  ),
                  color: Colors.green[900],
                  onPressed: () {
                    if (round != 3) {
                      _stackSelection(context);
                    } else {
                      setState(() {
                        _initMagic();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: myAppBar(),
      body: myBody(),
    );
  }

  void _initMagic() {
    //all the 52 cards
    allCards = [];

    //the cards will be used in the game
    mainStack = [];

    //the three stacks to divide the cards into
    leftStack = [];
    middleStack = [];
    rightStack = [];

    //rest the rounds
    round = 0;

    //change to the start up text
    noteText =
        "without touching the cards, Choose a Card from the cards above, and save it in your mind , then press the button below to select its row";

    //the text on the button
    btnText = "Go";
    // Add all cards to deck
    CardSuit.values.forEach((suit) {
      CardType.values.forEach((type) {
        allCards.add(PlayingCard(
          cardType: type,
          cardSuit: suit,
          faceUp: true,
        ));
      });
    });

    Random random = Random();

    //randomly select the 21 Cards
    for (int i = 0; i < 21; i++) {
      int randomNumber = random.nextInt(allCards.length);

      PlayingCard card = allCards[randomNumber];
      mainStack.add(
        card
          ..opened = true
          ..faceUp = true,
      );
      allCards.removeAt(randomNumber);
    }

    for (var i = 0; i < 7; i++) {
      leftStack.add(mainStack[i]);
    }
    for (var i = 7; i < 14; i++) {
      middleStack.add(mainStack[i]);
    }
    for (var i = 14; i < 21; i++) {
      rightStack.add(mainStack[i]);
    }
  }

  divideIntoThreeStackes() {
    // leftStack.clear();
    // rightStack.clear();
    // middleStack.clear();

    for (var i = 0; i < 7; i++) {
      leftStack.add(mainStack[i]);
    }
    for (var i = 7; i < 14; i++) {
      middleStack.add(mainStack[i]);
    }
    for (var i = 14; i < 21; i++) {
      rightStack.add(mainStack[i]);
    }
  }

  roundShuffles() {
    setState(() {
      leftStack.clear();
      rightStack.clear();
      middleStack.clear();
      for (var i = 0; i < 7; i++) {
        leftStack.add(mainStack[0]);
        middleStack.add(mainStack[1]);
        rightStack.add(mainStack[2]);

        mainStack.removeAt(2);
        mainStack.removeAt(1);
        mainStack.removeAt(0);
      }
    });
  }

  _finishingCheck() {
    switch (round) {
      case 1:
        setState(() {
          noteText =
              "very good , now where is your card again, press the button below to select its row";
        });
        break;
      case 2:
        setState(() {
          noteText =
              "Excelent ,keep going , where is your card again? press the button below to select its row";
        });
        break;
      case 3:
        setState(() {
          noteText = "I found it !, press the button below to play again";
          btnText = "play again";
          _finalCard(context);
        });
        break;
      default:
    }
  }

  Future<int> _stackSelection(BuildContext context) async {
    return await showDialog<int>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Which Row includes your Card"),
            content: Text('press the row below'),
            actions: <Widget>[
              FlatButton(
                child: Text('Top'),
                onPressed: () {
                  mainStack.clear();
                  mainStack = middleStack + leftStack + rightStack;
                  roundShuffles();
                  round++;
                  Navigator.pop(context);
                  _finishingCheck();
                },
              ),
              FlatButton(
                child: Text('middle'),
                onPressed: () {
                  mainStack.clear();
                  mainStack = leftStack + middleStack + rightStack;
                  roundShuffles();
                  round++;
                  Navigator.pop(context);
                  _finishingCheck();
                },
              ),
              FlatButton(
                child: Text('bottom'),
                onPressed: () {
                  mainStack.clear();
                  mainStack = middleStack + rightStack + leftStack;
                  roundShuffles();
                  round++;
                  Navigator.pop(context);
                  _finishingCheck();
                },
              ),
            ],
          );
        });
  }

  void _finalCard(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("I found your card !"),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              cardsFace(3, middleStack),
            ],
          ),
          backgroundColor: Colors.pink[900],
          actions: <Widget>[
            FlatButton(
              child: Text("Play Again"),
              onPressed: () {
                setState(() {
                  _initMagic();
                });
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("ok"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
//cardsFace(3, middleStack),
