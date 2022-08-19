import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CoffeeType extends StatelessWidget {
  final typecoffee;
  final bool isSelected;
  final VoidCallback onTap;

  const CoffeeType({Key? key, required this.typecoffee, required this.isSelected, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Text(
          typecoffee,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, 
              color:isSelected? Colors.orange : Colors.white),
        ),
      ),
    );
  }
}
