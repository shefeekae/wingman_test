import 'dart:convert';

ProfileSubmitRequest profileSubmitRequestFromJson(String str) =>
    ProfileSubmitRequest.fromJson(json.decode(str));

String profileSubmitRequestToJson(ProfileSubmitRequest data) =>
    json.encode(data.toJson());

class ProfileSubmitRequest {
  ProfileSubmitRequest({
    required this.name,
    required this.email,
  });

  String name;
  String email;

  factory ProfileSubmitRequest.fromJson(Map<String, dynamic> json) =>
      ProfileSubmitRequest(
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
      };
}
