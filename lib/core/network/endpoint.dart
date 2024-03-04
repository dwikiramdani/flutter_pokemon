import 'dart:core';

class Endpoint {
  static const dummyEndpoint = "";
  static const baseUrl = 'https://pokeapi.co/api/v2';
  static const pokemonByAbility = "/ability";

  static const baseOpenKube = 'https://openapi.kube.eperpus.com';
  static const portalBookItems = '/portal-admin/items';
  static const openApiListOfItem = '/openapi/items';
  static const openApiReadBook = '/openapi/organizations/read-book';

  static String openApiOrganizationListOfItem(int organizationId, int itemId) {
    return "/openapi/organizations/$organizationId";
  }

  static String openApiOrganizationItemById(int organizationId, int itemId) {
    return "/openapi/organizations/$organizationId/items/$itemId";
  }

  static String downloadBook(String expires, String signature) {
    return "/api/$expires/$signature/{_}";
  }

  static const generateApiKey = "/openapi/auth/api-key";

  static const apiKey = "EPP gAAAAABl5XNGLC1tnWWO2JEF8yi8Yk-vYV5bw4qwCypq-dUBmdrtKvObwtz5VWxQwEE67lqYky8PM1aIy86-VqPtHUzb8ah3ipVr6PJVrNu79PKEYJQStq58Yl42TdN1DSoYKSgPUKGNCZ1BzQ99snTEDc_b6kLQ0YQZbZtMPvq4WLU82_1d6hGlkzc4Ot6ko2CSCMWlFpmONsc06vgxjs6DGXnNgLT3Elc7Oi6GzS0N1YGEpZ3FM8VC_ZVqW1rcPdoPO6z-f6ZhnnipGfRpN59Hb4fLueFA54H6Ann5a2hQzqq1fK_Q-4E=";
}
