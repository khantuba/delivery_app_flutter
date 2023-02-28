import 'dart:convert';

import 'package:delivery_app/response/response.dart';

import '../../beans/user_bean.dart';

///This class contains the User Response
class UserResponse extends Response {
  /// The list of users
  final List<UserBean> _users;

  UserResponse({
    required String respMsg,
    required int respCode,
    required int apiErrorCode,
    required String message,
    required List<UserBean> users,
  })  : _users = users,
        super(
          respMsg: respMsg,
          respCode: respCode,
          apiErrorCode: apiErrorCode,
          message: message,
        );

  ///Function to return the users
  List<UserBean> get users => _users;

  /// Converting the decoded Json Response to POJO for easy accessibility
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    List<UserBean> users = <UserBean>[];
    //Checking the null safety
    if (null != json["users"]) {
      List<dynamic> dynamicUsers = json["users"];
      for (var element in dynamicUsers) {
        users.add(UserBean.fromJson(element));
      }
    }

    //Returning the converted response from JSON TO POJO
    return UserResponse(
      respMsg: json["respMsg"],
      respCode: json["respCode"],
      apiErrorCode: json["apiErrorCode"],
      message: json["message"],
      users: users,
    );
  }

  @override
  String toString() {
    return 'UserResponse{_users: $_users}';
  }
}
