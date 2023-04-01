class AppResponse {
  String errorTxt;
  int? statusCode;
  dynamic data; 
  AppResponse({
    this.errorTxt = '',
    this.data,
    this.statusCode,
  });
}
