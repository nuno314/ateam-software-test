/// Shared model for chat items used by bloc and UI
library;

enum MessageStatus { sent, delivered, seen }

class ChatItem {
  final String name;
  final String message;
  final DateTime time;
  final String avatarUrl;
  final int? unreadCount;
  final MessageStatus? status;

  const ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
    this.unreadCount,
    this.status,
  });
}
