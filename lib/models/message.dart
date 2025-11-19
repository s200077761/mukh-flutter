import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  final int id;
  final int conversationId;
  final String role; // 'user' or 'assistant'
  final String content;
  final DateTime createdAt;

  Message({
    required this.id,
    required this.conversationId,
    required this.role,
    required this.content,
    required this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  bool get isUser => role == 'user';
  bool get isAssistant => role == 'assistant';
}
