import 'dart:convert';

OtpResponse otpResponseFromJson(String str) =>
    OtpResponse.fromJson(json.decode(str));

String otpResponseToJson(OtpResponse data) => json.encode(data.toJson());

class OtpResponse {
  OtpResponse({
    required this.status,
    required this.response,
    required this.requestId,
  });

  bool status;
  String response;
  String requestId;

  factory OtpResponse.fromJson(Map<String, dynamic> json) => OtpResponse(
        status: json["status"],
        response: json["response"],
        requestId: json["request_id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": response,
        "request_id": requestId,
      };
}
