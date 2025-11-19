# Mukh - AI Chatbot Flutter App

Mukh is a lightweight, fast AI chatbot application built with Flutter and Dart. It connects to the Mukh backend API powered by Hugging Face for intelligent conversations.

## Features

- 💬 Real-time chat with AI
- 🗂️ Multiple conversation management
- 🎨 Beautiful dark theme UI
- 📱 Cross-platform (iOS, Android)
- ⚡ Fast and responsive
- 🔐 Secure API communication

## Architecture

- **State Management**: Provider pattern
- **API Client**: Dio HTTP client
- **Local Storage**: SharedPreferences
- **UI Framework**: Flutter Material Design 3

## Project Structure

```
lib/
├── config/          # App constants and configuration
├── models/          # Data models
├── providers/       # State management
├── screens/         # UI screens
├── services/        # API services
└── main.dart        # App entry point
```

## Getting Started

### Prerequisites

- Flutter SDK 3.24.0 or higher
- Dart 3.5.0 or higher
- Xcode (for iOS development)
- CocoaPods (for iOS dependencies)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/mukh_flutter.git
cd mukh_flutter
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Building for iOS

### Prerequisites

- Apple Developer Account
- Xcode 14.0 or higher
- CocoaPods

### Steps

1. Update iOS deployment target:
```bash
cd ios
pod repo update
cd ..
```

2. Build for iOS:
```bash
flutter build ios --release
```

3. Open in Xcode:
```bash
open ios/Runner.xcworkspace
```

4. Configure signing:
   - Select "Runner" project
   - Go to "Signing & Capabilities"
   - Select your development team
   - Update bundle identifier

5. Build and run on device or simulator

## Submitting to App Store

1. Create an App Store Connect record
2. Configure app information:
   - App name: Mukh
   - Bundle ID: com.mukh.app
   - Version: 1.0.0
3. Upload build via Xcode
4. Submit for review

## Configuration

Update `lib/config/constants.dart` to configure:
- API base URL
- App colors and theme
- API timeouts
- Local storage keys

## API Integration

The app connects to the Mukh backend API. Ensure the API is running and accessible at the configured base URL.

### Available Endpoints

- `POST /api/trpc/chat.getConversations` - Get all conversations
- `POST /api/trpc/chat.createConversation` - Create new conversation
- `POST /api/trpc/chat.getMessages` - Get conversation messages
- `POST /api/trpc/chat.sendMessage` - Send a message
- `POST /api/trpc/chat.deleteConversation` - Delete conversation

## Testing

Run tests with:
```bash
flutter test
```

## Performance

- Optimized state management with Provider
- Efficient message rendering with ListView
- Async API calls with proper error handling
- Local caching of conversations

## Security

- HTTPS API communication
- Secure token handling
- Input validation
- Error handling and logging

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, email support@mukh.app or open an issue on GitHub.

## Roadmap

- [ ] User authentication
- [ ] Conversation search
- [ ] Message export
- [ ] Voice input
- [ ] Dark/Light theme toggle
- [ ] Offline mode
- [ ] Push notifications
- [ ] Android release

---

Built with ❤️ by the Mukh team
