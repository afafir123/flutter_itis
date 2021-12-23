import 'chat_message.dart';

class ChatState {
  final List<ChatMessage> chatMessages;

  ChatState({
    required this.chatMessages,
  });

  factory ChatState.initial() => ChatState(
    chatMessages: const [],
  );
}