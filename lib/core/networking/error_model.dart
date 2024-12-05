class ErrorModel {
  int? responseCode;
  String? message;

  Map<dynamic, dynamic>? content;

  ErrorModel({
    this.responseCode,
    this.message,
    this.content,
  });
}
