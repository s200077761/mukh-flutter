import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String openId;
  final String? name;
  final String? email;
  final String? loginMethod;
  final String role; // 'user' or 'admin'
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime lastSignedIn;

  User({
    required this.id,
    required this.openId,
    this.name,
    this.email,
    this.loginMethod,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.lastSignedIn,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  bool get isAdmin => role == 'admin';
}
