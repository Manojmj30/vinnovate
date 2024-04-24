// To parse this JSON data, do
//
//     final errorResponse = errorResponseFromJson(jsonString);

import 'dart:convert';

ErrorResponse errorResponseFromJson(String str) => ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse data) => json.encode(data.toJson());

class ErrorResponse {
  Error? error;

  ErrorResponse({
    this.error,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
    error: Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error!.toJson(),
  };
}

class Error {
  int? statusCode;
  String? name;
  String? message;

  Error({
    this.statusCode,
    this.name,
    this.message,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    statusCode: json["statusCode"],
    name: json["name"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "name": name,
    "message": message,
  };
}
