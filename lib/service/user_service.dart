import 'dart:convert';

import 'package:delivery_app/beans/user_bean.dart';
import 'package:delivery_app/constant/url_constant.dart';
import 'package:delivery_app/helpers/http_helper.dart';
import 'package:delivery_app/response/users./user_response.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<UserResponse> addUserService(UserBean userBean) async {
    Map requestBody = userBean.toJson();
    final urlToAddUser = Uri.parse(UrlConstant.addUserUrl);
    final response = await http.post(
      urlToAddUser,
      headers: HttpHelper.headers,
      body: jsonEncode(requestBody),
    );
    return getUserResponse(response);
  }

  Future<UserResponse> getUsersService() async {
    final urlToGetUsers = Uri.parse(UrlConstant.getUsersUrl);
    final response = await http.get(
      urlToGetUsers,
      headers: HttpHelper.headers,
    );
    return getUserResponse(response);
  }

  Future<UserResponse> deleteUser(String email) async {
    final urlToDeleteUser =
    Uri.parse(UrlConstant.deleteUserUrl.replaceAll("{email}", email));
    final response = await http.delete(
      urlToDeleteUser,
      headers: HttpHelper.headers,
    );
    return getUserResponse(response);
  }

  UserResponse getUserResponse(http.Response response) {
    UserResponse userResponse;
    if (response.statusCode == HttpHelper.constantHttpOk) {
      dynamic decodedJson = jsonDecode(response.body);
      userResponse = UserResponse.fromJson(decodedJson);
    } else {
      userResponse = UserResponse(
        respMsg: "Failure",
        respCode: -1,
        apiErrorCode: 1100,
        message: "Either backend is down or you are missing value",
        users: <UserBean>[],
      );
    }
    return userResponse;
  }
}
