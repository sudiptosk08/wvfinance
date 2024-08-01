import 'dart:convert';

CommonResponse errorResponseFromJson(String str) =>
    CommonResponse.fromJson(json.decode(str));

String errorResponseToJson(CommonResponse data) => json.encode(data.toJson());

class CommonResponse {
  CommonResponse({
    required this.message,
  });

  String message;

  factory CommonResponse.fromJson(Map<String, dynamic> json) => CommonResponse(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
