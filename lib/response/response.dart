///The General Response parameters that will be extended all the Response
class Response {
  ///The Response Message
  final String _respMsg;

  ///The Response Code
  final int _respCode;

  ///The API Error Code
  final int _apiErrorCode;

  ///The API Message
  final String _message;

  const Response({
    required String respMsg,
    required int respCode,
    required int apiErrorCode,
    required String message,
  })  : _message = message,
        _apiErrorCode = apiErrorCode,
        _respCode = respCode,
        _respMsg = respMsg;

  String get respMsg => _respMsg;

  int get respCode => _respCode;

  int get apiErrorCode => _apiErrorCode;

  String get message => _message;

  @override
  String toString() {
    return 'Response{respMsg: $_respMsg, respCode: $_respCode, apiErrorCode: $_apiErrorCode, message: $_message}';
  }
}
