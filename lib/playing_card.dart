//this class baesd on codes from Mr.Deven Joshi
//and his post in Medium Website
//and his puplic code in GitHUB


import 'package:flutter/material.dart';
//in this will create all the cards and add the properties of the cards.

//the for different shapes
enum CardSuit {
  spades,
  hearts,
  diamonds,
  clubs,
}

// the cards types
enum CardType {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king
}
//the cards colors
enum CardColor {
  red,
  black,
}

// Simple playing card model
class PlayingCard {
  CardSuit cardSuit;
  CardType cardType;
  bool faceUp;
  bool opened;

  PlayingCard({
    @required this.cardSuit,
    @required this.cardType,
    this.faceUp = false,
    this.opened = false,
  });

  CardColor get cardColor {
    if(cardSuit == CardSuit.hearts || cardSuit == CardSuit.diamonds) {
      return CardColor.red;
    } else {
      return CardColor.black;
    }
  }

}