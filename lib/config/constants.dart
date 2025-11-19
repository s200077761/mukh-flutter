class AppConstants {
  // API Configuration
  static const String apiBaseUrl = 'https://3000-iz1creme12jkt6cg3rjh9-83b6f5e1.manus-asia.computer';
  static const String apiPrefix = '/api/trpc';
  
  // App Info
  static const String appName = 'Mukh';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'AI Chatbot powered by Hugging Face';
  
  // Colors
  static const int primaryColor = 0xFF1E40AF; // Deep Blue
  static const int accentColor = 0xFF06B6D4; // Cyan
  static const int backgroundColor = 0xFF0F172A; // Dark Blue
  static const int surfaceColor = 0xFF1E293B; // Dark Gray
  
  // Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration chatTimeout = Duration(seconds: 60);
  
  // Local Storage Keys
  static const String userKey = 'user';
  static const String tokenKey = 'token';
  static const String conversationsKey = 'conversations';
}
