import 'package:dio/dio.dart';
import 'package:mukh_flutter/config/constants.dart';
import 'package:mukh_flutter/models/conversation.dart';
import 'package:mukh_flutter/models/message.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.apiBaseUrl,
        connectTimeout: AppConstants.apiTimeout,
        receiveTimeout: AppConstants.apiTimeout,
        contentType: 'application/json',
      ),
    );
  }

  Future<List<Conversation>> getConversations() async {
    try {
      final response = await _dio.post(
        '${AppConstants.apiPrefix}/chat.getConversations',
        data: {},
      );

      if (response.statusCode == 200) {
        final data = response.data['result']['data'] as List;
        return data
            .map((item) => Conversation.fromJson(item as Map<String, dynamic>))
            .toList();
      }
      throw Exception('Failed to load conversations');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Conversation> createConversation({
    required String title,
  }) async {
    try {
      final response = await _dio.post(
        '${AppConstants.apiPrefix}/chat.createConversation',
        data: {'title': title},
      );

      if (response.statusCode == 200) {
        return Conversation.fromJson(
          response.data['result']['data'] as Map<String, dynamic>,
        );
      }
      throw Exception('Failed to create conversation');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Message>> getMessages(int conversationId) async {
    try {
      final response = await _dio.post(
        '${AppConstants.apiPrefix}/chat.getMessages',
        data: {'conversationId': conversationId},
      );

      if (response.statusCode == 200) {
        final data = response.data['result']['data'] as List;
        return data
            .map((item) => Message.fromJson(item as Map<String, dynamic>))
            .toList();
      }
      throw Exception('Failed to load messages');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<Message> sendMessage({
    required int conversationId,
    required String content,
  }) async {
    try {
      final response = await _dio.post(
        '${AppConstants.apiPrefix}/chat.sendMessage',
        data: {
          'conversationId': conversationId,
          'content': content,
        },
        options: Options(
          receiveTimeout: AppConstants.chatTimeout,
        ),
      );

      if (response.statusCode == 200) {
        return Message.fromJson(
          response.data['result']['data'] as Map<String, dynamic>,
        );
      }
      throw Exception('Failed to send message');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> deleteConversation(int conversationId) async {
    try {
      final response = await _dio.post(
        '${AppConstants.apiPrefix}/chat.deleteConversation',
        data: {'conversationId': conversationId},
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to delete conversation');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
