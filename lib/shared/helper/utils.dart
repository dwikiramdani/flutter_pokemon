import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/shared/consts/poke_type_enum.dart';
import 'package:flutter_pokemon/shared/consts/colors.dart';
import 'package:package_info_plus/package_info_plus.dart';

PokeTypeEnum? stringToEnum(List<PokeTypeEnum> values, String colorString) {
  for (var value in values) {
    if (value.toString().split('.').last == colorString) {
      return value;
    }
  }
  return null;
}

Color getPokeTypeColor(String typeEnumString) {
  Color? typeColor;

  PokeTypeEnum? selectedColor = stringToEnum(
    PokeTypeEnum.values,
    typeEnumString,
  );

  switch (selectedColor) {
    case PokeTypeEnum.fairy:
      typeColor = PokeTypeColor.fairy;
    case PokeTypeEnum.ice:
      typeColor = PokeTypeColor.ice;
    case PokeTypeEnum.grass:
      typeColor = PokeTypeColor.grass;
    case PokeTypeEnum.steal:
      typeColor = PokeTypeColor.steal;
    case PokeTypeEnum.rock:
      typeColor = PokeTypeColor.rock;
    case PokeTypeEnum.dark:
      typeColor = PokeTypeColor.dark;
    case PokeTypeEnum.physic:
      typeColor = PokeTypeColor.physic;
    case PokeTypeEnum.water:
      typeColor = PokeTypeColor.water;
    case PokeTypeEnum.ghost:
      typeColor = PokeTypeColor.ghost;
    case PokeTypeEnum.ground:
      typeColor = PokeTypeColor.ground;
    case PokeTypeEnum.dragon:
      typeColor = PokeTypeColor.dragon;
    case PokeTypeEnum.electric:
      typeColor = PokeTypeColor.electric;
    case PokeTypeEnum.fire:
      typeColor = PokeTypeColor.fire;
    case PokeTypeEnum.bug:
      typeColor = PokeTypeColor.bug;
    case PokeTypeEnum.poison:
      typeColor = PokeTypeColor.poison;
    case PokeTypeEnum.flying:
      typeColor = PokeTypeColor.flying;
    case PokeTypeEnum.fighting:
      typeColor = PokeTypeColor.fighting;
    case PokeTypeEnum.normal:
      typeColor = PokeTypeColor.normal;
    default:
      typeColor = PokeTypeColor.normal;
  }

  return typeColor;
}