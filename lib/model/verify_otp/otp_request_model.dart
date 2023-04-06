import 'dart:convert';

OtpRequest otpRequestFromJson(String str) =>
    OtpRequest.fromJson(json.decode(str));

String otpRequestToJson(OtpRequest data) => json.encode(data.toJson());

class OtpRequest {
  OtpRequest({
    required this.requestId,
    required this.code,
  });

  String requestId;
  String code;

  factory OtpRequest.fromJson(Map<String, dynamic> json) => OtpRequest(
        requestId: json["request_id"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "request_id": requestId,
        "code": code,
      };
}
