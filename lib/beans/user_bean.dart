import 'package:delivery_app/beans/user_details_bean.dart';

/// @author mohd.shadab
/// This is pojo class for holding the Bean Configuration
class UserBean {
  final String _email;
  final UserDetailsBean _userDetails;

  const UserBean({
    required String email,
    required UserDetailsBean userDetails,
  })  : _userDetails = userDetails,
        _email = email;

  @override
  String toString() {
    return 'UserBean{email: $_email, userDetails: $_userDetails}';
  }

  ///This function is used to convert the bean to json
  Map toJson() {
    Map userDetails = _userDetails.toJson();
    return {
      "email": _email,
      "userDetails": userDetails,
    };
  }

  ///This function is used to convert decoded json back into the pojo class
  factory UserBean.fromJson(Map<String,dynamic> json){
    return UserBean(email: json["email"], userDetails: UserDetailsBean.fromJson(json["userDetails"]));
  }

  UserDetailsBean get userDetails => _userDetails;
  String get email => _email;
}
