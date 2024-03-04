import 'package:flutter/material.dart';
import 'package:flutter_pokemon/app.dart';
import 'package:flutter_pokemon/core/network/api_client.dart';
import 'package:flutter_pokemon/shared/consts/api_constant.dart';
import 'package:flutter_pokemon/shared/helper/config.dart';

void main() {
  FlavorConfig(
    flavor: Flavor.prod,
    values: FlavorValues(
      baseUrl: ApiConstants.baseUrl,
      appName: "Boo Ku Ku"
    ),
  );
  ApiClient(values: FlavorConfig.instance.values);

  runApp(const MyApp());
}
