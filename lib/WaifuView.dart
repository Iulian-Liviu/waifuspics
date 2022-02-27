import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:waifuspics/theme.dart';

class WaifuView extends StatelessWidget {
  final String image;
  const WaifuView({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Theme_Color_Scheme.cardColor,
        shadowColor: Theme_Color_Scheme.shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 1,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Theme_Color_Scheme.shadowColor, blurRadius: 9.0)
            ],
            borderRadius: BorderRadius.circular(16.0),
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: NetworkImage(image),
            ),
          ),
        ),
      ),
    );
  }
}
