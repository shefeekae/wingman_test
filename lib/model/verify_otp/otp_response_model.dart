import 'dart:convert';

OtpVerifyResponse otpVerifyResponseFromJson(String str) =>
    OtpVerifyResponse.fromJson(json.decode(str));

String otpVerifyResponseToJson(OtpVerifyResponse data) =>
    json.encode(data.toJson());

class OtpVerifyResponse {
  OtpVerifyResponse({
    required this.status,
    required this.profileExists,
    required this.jwt,
    required this.response,
  });

  bool status;
  bool profileExists;
  String jwt;
  String response;

  factory OtpVerifyResponse.fromJson(Map<String, dynamic> json) =>
      OtpVerifyResponse(
        response: json["response"] ?? "",
        status: json["status"],
        profileExists: json["profile_exists"] ?? false,
        jwt: json["jwt"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "profile_exists": profileExists,
        "jwt": jwt,
      };
}
