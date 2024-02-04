import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//HANDLE FETCHING CACHE VALUE
Future<T> getPref<T>(String prefKey, T defaultValue) async {
  final prefs = await SharedPreferences.getInstance();
  dynamic prefValue;
  if (defaultValue is bool) {
    prefValue = prefs.getBool(prefKey) ?? defaultValue;
  } else if (defaultValue is double) {
    prefValue = prefs.getDouble(prefKey) ?? defaultValue;
  } else if (defaultValue is int) {
    prefValue = prefs.getInt(prefKey) ?? defaultValue;
  } else if (defaultValue is String) {
    prefValue = prefs.getString(prefKey) ?? defaultValue;
  } else if (defaultValue is List<String>) {
    prefValue = prefs.getStringList(prefKey) ?? defaultValue;
  } if (defaultValue is Map<String, dynamic>) {
    prefValue = json.decode(prefs.getString(prefKey)!) ?? defaultValue;
  } else {
    prefValue = prefs.get(prefKey) ?? defaultValue;
  }
  return prefValue;
}

//HANDLE SAVING CACHE VALUE
Future<void> savePref<T>(String prefKey, T value) async {
  final prefs = await SharedPreferences.getInstance();
  if (value is bool) {
    await prefs.setBool(prefKey, value);
  } else if (value is double) {
    await prefs.setDouble(prefKey, value);
  } else if (value is int) {
    await prefs.setInt(prefKey, value);
  } else if (value is String) {
    await prefs.setString(prefKey, value);
  } else if (value is List<String>) {
    await prefs.setStringList(prefKey, value);
  } else if (value is Map<String, dynamic>) {
    await prefs.setString(prefKey, json.encode(value));
  } else {
    throw 'savePref: $value is not defined';
  }
}

//HANDLE REMOVING CACHE VALUE
Future<void> removePref(String prefKey) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(prefKey);
}

//HANDLE CACHE STORE FOR JWT TOKEN
const tokenJwt = 'tokenJwt';
Future<void> setTokenJwt(String value) async {
  debugPrint('setToken: $value');
  await savePref(tokenJwt, value);
}

Future<String?> getTokenJwt() async {
  debugPrint('getToken');
  String? value = await getPref(tokenJwt, '');
  return value;
}

Future<void> deleteTokenJwt() async {
  debugPrint('deleteToken');
  await removePref(tokenJwt);
}
