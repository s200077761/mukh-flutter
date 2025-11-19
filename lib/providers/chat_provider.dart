import 'package:flutter/material.dart';
import 'package:mukh_flutter/models/conversation.dart';
import 'package:mukh_flutter/models/message.dart';
import 'package:mukh_flutter/services/api_service.dart';

class ChatProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Conversation> _conversations = [];
  Map<int, List<Message>> _messages = {};
  Conversation? _currentConversation;
  bool _isLoading = false;
  String? _error;

  // Getters
  List<Conversation> get conversations => _conversations;
  Conversation? get currentConversation => _currentConversation;
  List<Message> get currentMessages =>
      _currentConversation != null ? _messages[_currentConversation!.id] ?? [] : [];
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Load conversations
  Future<void> loadConversations() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _conversations = await _apiService.getConversations();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Create new conversation
  Future<void> createConversation(String title) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final conversation = await _apiService.createConversation(title: title);
      _conversations.insert(0, conversation);
      _currentConversation = conversation;
      _messages[conversation.id] = [];
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Select conversation
  Future<void> selectConversation(Conversation conversation) async {
    _currentConversation = conversation;
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      if (!_messages.containsKey(conversation.id)) {
        _messages[conversation.id] =
            await _apiService.getMessages(conversation.id);
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Send message
  Future<void> sendMessage(String content) async {
    if (_currentConversation == null) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Add user message optimistically
      final userMessage = Message(
        id: DateTime.now().millisecondsSinceEpoch,
        conversationId: _currentConversation!.id,
        role: 'user',
        content: content,
        createdAt: DateTime.now(),
      );

      _messages[_currentConversation!.id]?.add(userMessage);
      notifyListeners();

      // Send to server
      final aiMessage = await _apiService.sendMessage(
        conversationId: _currentConversation!.id,
        content: content,
      );

      // Update with actual response
      _messages[_currentConversation!.id]?.add(aiMessage);
    } catch (e) {
      _error = e.toString();
      // Remove optimistic message on error
      _messages[_currentConversation!.id]?.removeWhere(
        (m) => m.role == 'user' && m.content == content,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Delete conversation
  Future<void> deleteConversation(int conversationId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _apiService.deleteConversation(conversationId);
      _conversations.removeWhere((c) => c.id == conversationId);
      _messages.remove(conversationId);

      if (_currentConversation?.id == conversationId) {
        _currentConversation = null;
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
