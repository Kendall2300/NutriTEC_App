import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LoginCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: 'https://nutritec-api-pg.azurewebsites.net/api/auth_client',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic clientID(dynamic response) => getJsonField(
        response,
        r'''$.result.client_id''',
      );
}

class ConsultRecipeCall {
  static Future<ApiCallResponse> call({
    String? consultRecipeID = '',
  }) {
    final body = '''
{
  "recipe_id": "${consultRecipeID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ConsultRecipe',
      apiUrl: 'https://nutritec-api-pg.azurewebsites.net/api/search_recipe',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic rRecipeID(dynamic response) => getJsonField(
        response,
        r'''$.result.recipe_id''',
      );
  static dynamic rPortions(dynamic response) => getJsonField(
        response,
        r'''$.result.portions''',
      );
  static dynamic rCalories(dynamic response) => getJsonField(
        response,
        r'''$.result.calories''',
      );
  static dynamic rIngredients(dynamic response) => getJsonField(
        response,
        r'''$.result.ingredients''',
      );
}

class ConsultProductCall {
  static Future<ApiCallResponse> call({
    String? consultBarcode = '',
  }) {
    final body = '''
{
  "barcode": "${consultBarcode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ConsultProduct',
      apiUrl:
          'https://nutritec-api-pg.azurewebsites.net/api/nutri_search_product',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddRecipeCall {
  static Future<ApiCallResponse> call({
    String? addRecipeID = '',
    String? addPortions = '',
    String? addCalories = '',
    String? addIngredients = '',
  }) {
    final body = '''
{
  "recipe_id": "${addRecipeID}",
  "portions": "${addPortions}",
  "calories": "${addCalories}",
  "ingredients": "${addIngredients}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddRecipe',
      apiUrl: 'https://nutritec-api-pg.azurewebsites.net/api/insert_recipe',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteRecipeCall {
  static Future<ApiCallResponse> call({
    String? deletRecipeID = '',
  }) {
    final body = '''
{
  "recipe_id": "${deletRecipeID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteRecipe',
      apiUrl: 'https://nutritec-api-pg.azurewebsites.net/api/delete_recipe',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class EditRecipeCall {
  static Future<ApiCallResponse> call({
    String? editRecipeID = '',
    String? editPortions = '',
    String? editCalories = '',
    String? editIngredients = '',
  }) {
    final body = '''
{
  "recipe_id": "${editRecipeID}",
  "portions": "${editPortions}",
  "calories": "${editCalories}",
  "ingredients": "${editIngredients}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EditRecipe',
      apiUrl: 'https://nutritec-api-pg.azurewebsites.net/api/update_recipe',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AddDailyConsumptionCall {
  static Future<ApiCallResponse> call({
    String? addConsumptionBarcode = '',
    String? addConsumptionClientID = '',
    String? addConsumptionEatingTime = '',
    String? addConsumptionDatec = '',
  }) {
    final body = '''
{
  "barcode": "${addConsumptionBarcode}",
  "client_id": "${addConsumptionClientID}",
  "eating_time": "${addConsumptionEatingTime}",
  "datec": "${addConsumptionDatec}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AddDailyConsumption',
      apiUrl:
          'https://nutritec-api-pg.azurewebsites.net/api/assign_daily_consumption',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
