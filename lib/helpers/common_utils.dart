/// This class contains the common utils for the application
class CommonUtils {
  /// Function to check whether the value is blank or null
  static bool isNullOrBlank(String value) {
    if (value.isEmpty || (value.toLowerCase() == "null")) {
      return true;
    }
    return false;
  }
}
