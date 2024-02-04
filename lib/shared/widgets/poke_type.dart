import 'package:flutter/material.dart';
import 'package:flutter_pokemon/shared/helper/utils.dart';

Widget buildPokeType(String colorTypeString) {
  Color? typeColor = getPokeTypeColor(colorTypeString);
  String? typeText =
      "${colorTypeString[0].toUpperCase()}${colorTypeString.substring(1)}";

  return Container(
    decoration: BoxDecoration(
      color: typeColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(typeText),
  );
}
