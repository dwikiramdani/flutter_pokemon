import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/core/network/api_client.dart';
import 'package:flutter_pokemon/core/network/endpoint.dart';
import 'package:flutter_pokemon/features/home/data/models/book_item.dart';
import 'package:flutter_pokemon/features/home/data/models/book_item_detail.dart';
import 'package:flutter_pokemon/features/home/data/models/sample_model.dart';

class HomeRepository {
  Future<List<SampleModel>> getAllData() {
    // TODO: implement getAllData
    throw UnimplementedError();
  }

  Future<void> getData(SampleModel data) {
    // TODO: implement getData
    throw UnimplementedError();
  }

  Future<void> updateData(SampleModel data) {
    // TODO: implement updateData
    throw UnimplementedError();
  }

  Future<void> deleteData(int id) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  List<Item> portalItems = [];
  Future<List<Item>> getPortalItems() async {
    try {
      String url = Endpoint.baseOpenKube + Endpoint.openApiListOfItem;
      final response = await ApiClient.instance.dio.get(
        url,
        options: Options(
          headers: await ApiClient.instance.getHeaders(),
        ),
      );
      if (response.statusCode == 200) {
        List resBooks = response.data["items"];
        for (var item in resBooks) {
          var dataModel = Item.fromJson(item);
          portalItems.add(dataModel);
        }
      }
    } catch (e) {
      debugPrint("Exeption Get: $e");
      portalItems = [];
    }
    return portalItems;
  }

  BookDetails? portalItemDetail;
  Future<BookDetails> getPortalItemById(int bookId) async {
    try {
      String url =
          "${Endpoint.baseOpenKube}${Endpoint.openApiListOfItem}/$bookId";
      final response = await ApiClient.instance.dio.get(
        url,
        options: Options(
          headers: await ApiClient.instance.getHeaders(),
        ),
      );
      print("Response Detail: ${response.data}");
      if (response.statusCode == 200) {
        portalItemDetail = BookDetails.fromJson(response.data);
      }
    } catch (e) {
      debugPrint("Exeption Get: $e");
      portalItemDetail = null;
    }
    return portalItemDetail!;
  }
  // Future<void> getPortalItemsDetail();
  // Future<void> getPortalSharedLibraryItem();
  //
  // Future<void> getOpenApiSearchItem();
  // Future<void> getOpenApiReadBook();
  // Future<void> getOpenApiBookDownload();
  // Future<void> setOpenApiKey();
}
