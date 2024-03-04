import 'dart:core';

class Endpoint {
  static const dummyEndpoint = "";
  static const baseUrl = 'https://pokeapi.co/api/v2';
  static const baseOpenKube = 'https://openapi.kube.eperpus.com';

  static String bookItems(String sharedLibrary) {
    return "/openapi/organizations/$sharedLibrary/items";
  }

  static String readBooks(int organizationId, int itemId) {
    return "/openapi/organizations/$organizationId/read-book/$itemId";
  }

  static String downloadBook(String expires, String signature) {
    return "/api/$expires/$signature/{_}";
  }

  static const generateApiKey = "/openapi/auth/api-key";
}
