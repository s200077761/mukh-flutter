import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mukh_flutter/config/constants.dart';
import 'package:mukh_flutter/providers/chat_provider.dart';
import 'package:mukh_flutter/screens/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChatProvider>().loadConversations();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppConstants.backgroundColor),
      appBar: AppBar(
        backgroundColor: Color(AppConstants.surfaceColor),
        elevation: 0,
        title: const Text(
          'Mukh',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<ChatProvider>(
        builder: (context, chatProvider, _) {
          if (chatProvider.isLoading && chatProvider.conversations.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 6, 182, 212),
                ),
              ),
            );
          }

          if (chatProvider.conversations.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat_bubble_outline,
                    size: 64,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No conversations yet',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () => _showNewChatDialog(context),
                    icon: const Icon(Icons.add),
                    label: const Text('Start New Chat'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(AppConstants.accentColor),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: chatProvider.conversations.length,
            itemBuilder: (context, index) {
              final conversation = chatProvider.conversations[index];
              return ListTile(
                title: Text(
                  conversation.title,
                  style: const TextStyle(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  conversation.updatedAt.toString().split('.')[0],
                  style: TextStyle(color: Colors.grey[500]),
                ),
                onTap: () {
                  context.read<ChatProvider>().selectConversation(conversation);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ChatScreen(),
                    ),
                  );
                },
                trailing: PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text('Delete'),
                      onTap: () {
                        context
                            .read<ChatProvider>()
                            .deleteConversation(conversation.id);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(AppConstants.accentColor),
        onPressed: () => _showNewChatDialog(context),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showNewChatDialog(BuildContext context) {
    final titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(AppConstants.surfaceColor),
        title: const Text(
          'New Chat',
          style: TextStyle(color: Colors.white),
        ),
        content: TextField(
          controller: titleController,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Chat title...',
            hintStyle: TextStyle(color: Colors.grey[600]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[700]!),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleController.text.isNotEmpty) {
                context
                    .read<ChatProvider>()
                    .createConversation(titleController.text);
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(AppConstants.accentColor),
            ),
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}
