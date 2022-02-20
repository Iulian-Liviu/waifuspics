import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class WaifuView extends StatelessWidget {
  final String image;
  final int? id;
  const WaifuView({ required this.image, this.id = 0, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shadowColor: Colors.amber[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 0,
        child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.87,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.amber,
                  blurRadius: 3.0
                )
              ],
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
            ),
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(id.toString(),style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}
