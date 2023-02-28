/// This class contains the Urls of the api
class UrlConstant {
  /// Base URL
  static const String baseUrl = "http://localhost:8080";

  /// URL for adding the user
  static const String addUserUrl = "$baseUrl/user/addUser";

  /// URL for fetching user
  static const String getUserUrl = "$baseUrl/user/getUser?email={email}";

  /// URL for fetching users
  static const String getUsersUrl = "$baseUrl/user/getUsers";

  /// URL for updating the user
  static const String updateUserUrl = "$baseUrl/user/updateUser";

  /// URL for deleting the user
  static const String deleteUserUrl = "$baseUrl/user/deleteUser?email={email}";
}
