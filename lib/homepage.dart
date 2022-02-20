import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swiping_card_deck/swiping_card_deck.dart';
import 'package:waifuspics/ApiHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:math' as math;

import 'package:waifuspics/WaifuView.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WaifuView> cardDeckG = <WaifuView>[];
  late FirebaseFirestore firestore;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _loadAsync();
  }
  _loadAsync() async {
    firestore= FirebaseFirestore.instance;
    setState(() {
      isLoading = true;
    });

    var temp = await getCardDecks();
    setState(() {
      cardDeckG = temp;
      isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    final SwipingDeck deck = SwipingDeck<WaifuView>(
      cardDeck: cardDeckG,
      onDeckEmpty: deckCardEmpty,
      onLeftSwipe: onSwipeLeft,
      onRightSwipe: onSwipeRight,
      cardWidth: 200,
      swipeThreshold: MediaQuery.of(context).size.width / 4,
      minimumVelocity: 1000,
      rotationFactor: 0,
      swipeAnimationDuration: const Duration(milliseconds: 500),
    );

    if(isLoading){
      return SafeArea(child:
      Scaffold(
        backgroundColor: Colors.black12,
        body: Center(
          child: RefreshProgressIndicator(),
        ),
      ));
    }
    else{
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black12,
          body: deck,
        ),
      );
    }
  }

  // List<WaifuView> getCardDeck() {
  //   List<WaifuView> cardDeck = [];
  //   int i = 0;
  //     cardDeck.add(WaifuView(id: i,));
  //     i++;
  //   return cardDeck;
  // }cardDeck
  Future<List<WaifuView>> getCardDecks() async {
    List<WaifuView> cards = [];
    var list = await getURLFromApi(10);
    for (int i = 0; i < list.length; i++) {
      cards.add(WaifuView(image: list[i]));
    }
    if (kDebugMode) {
      print(cards.length);
    }
    return cards;
  }

  onSwipeRight(WaifuView w, List<WaifuView> lw, int swipeCount) {
    _SaveData();
    if (swipeCount == cardDeckG.length) {
        _loadAsync();
    }
  }

  onSwipeLeft(WaifuView w, List<WaifuView> lw, int swipeCount) {
  _SaveData();
    if (swipeCount == cardDeckG.length) {
      _loadAsync();
    }
  }

  deckCardEmpty() {
    _loadAsync();
  }
  _SaveData(){
    CollectionReference urls = firestore.collection('Urls');
    if (kDebugMode) {
      print(urls.id);
    }
  }
}
