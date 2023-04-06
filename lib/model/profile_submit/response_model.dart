import 'dart:convert';

ProfileSubmitResponse profileSubmitResponseFromJson(String str) =>
    ProfileSubmitResponse.fromJson(json.decode(str));

String profileSubmitResponseToJson(ProfileSubmitResponse data) =>
    json.encode(data.toJson());

class ProfileSubmitResponse {
  ProfileSubmitResponse({
    required this.status,
    required this.response,
  });

  bool status;
  String response;

  factory ProfileSubmitResponse.fromJson(Map<String, dynamic> json) =>
      ProfileSubmitResponse(
        status: json["status"],
        response: json["response"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": response,
      };
}
