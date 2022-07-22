part of 'services.dart';

class FoodService {
  // static Future<ApiReturnValue<List<Food>>> getFoods() async {
  //   await Future.delayed(const Duration(milliseconds: 500));
  //   return ApiReturnValue(value: mockFoods);
  // }

  static Future<ApiReturnValue<List<Food>>> getFoods(
      {http.Client? client}) async {
    client ??= http.Client();

    String url = baseURL + '/food';
    var uri = Uri.parse(url);

    var response = await client.get(uri);

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);
    debugPrint(response.body);

    List<Food> foods = (data['data']['data'] as Iterable)
        .map((e) => Food.fromJson(e))
        .toList();

    return ApiReturnValue(value: foods);
  }
}