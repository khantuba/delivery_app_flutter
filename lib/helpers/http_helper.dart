import 'package:delivery_app/constant/common_constant.dart';

///Helper class for setting up the headers of the api
class HttpHelper {
  ///The header that can be used for api calling
  static Map<String, String> headers = <String, String>{
    "Content-Type": CommonConstant.constantApplicationType,
  };

  ///The Constant Http Ok
  static int constantHttpOk = 200;
}
