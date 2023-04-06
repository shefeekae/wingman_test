import 'dart:convert';

MobileNumber mobileNumberFromJson(String str) =>
    MobileNumber.fromJson(json.decode(str));

String mobileNumberToJson(MobileNumber data) => json.encode(data.toJson());

class MobileNumber {
  MobileNumber({
    required this.mobile,
  });

  String mobile;

  factory MobileNumber.fromJson(Map<String, dynamic> json) => MobileNumber(
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
      };
}
