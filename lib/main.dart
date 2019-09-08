// part of this codes are baesd on codes from Mr.Deven Joshi
//and his post in Medium Website
//and his puplic code in GitHUB

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twentyone/main_screen.dart';

main() async{
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp])
      .then(
          (_){runApp(StartPage());}
  );
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '21 Cards Game',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: MainScreen(),
    );
  }

}