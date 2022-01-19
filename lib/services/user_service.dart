part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(String email, String password,
      {http.Client? client}) async {
    // await Future.delayed(const Duration(milliseconds: 500));
    // return ApiReturnValue(value: mockUser, message: 'Wrong email or password');
    client ??= http.Client();
    String url = baseURL + '/login';
    var uri = Uri.parse(url);

    var response = await client.post(uri,
        headers: {"Content-Type": "application/json"},
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<User>> signUp(User user, String password,
      {File? pictureFile, http.Client? client}) async {
    client ??= http.Client();

    String url = baseURL + '/register';
    var uri = Uri.parse(url);

    debugPrint("Body Request : " + user.toString());

    var response = await client.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        'name': user.name.toString(),
        'email': user.email.toString(),
        'password': password,
        'password_confirmation': password,
        'address': user.address.toString(),
        'city': user.city.toString(),
        'houseNumber': user.houseNumber.toString(),
        'phoneNumber': user.phoneNumber.toString(),
      }));

    if (response.statusCode != 200) {
      debugPrint(response.body);
      return ApiReturnValue(message: 'Please try again');
    }

    var data = json.decode(response.body);

    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    if (pictureFile != null) {
      ApiReturnValue<String> result = await uploadProfilePicture(pictureFile);
      if (result.value != null) {
        value = value.copyWith(
            picturePath: "http://127.0.0.1:8000/storage/" + result.value!);
      }
    }

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<String>> uploadProfilePicture(File pictureFile,
      {http.MultipartRequest? request}) async {
    String url = baseURL + 'user/photo';
    var uri = Uri.parse(url);

    request ??= http.MultipartRequest("POST", uri)
      ..headers["Content-Type"] = "application/json"
      ..headers["Authorization"] = "Bearer ${User.token}";

    var multipartFile =
        await http.MultipartFile.fromPath('file', pictureFile.path);
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      String imagePath = data['data'][0];

      return ApiReturnValue(value: imagePath);
    } else {
      return ApiReturnValue(message: 'Uploading Profile Picture Failed');
    }
  }
}