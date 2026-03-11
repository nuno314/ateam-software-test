import 'package:ateam_software_test/common/constants/app_gradient.dart';
import 'package:ateam_software_test/gen/assets.gen.dart';
import 'package:ateam_software_test/presentation/extensions/space_extension.dart';
import 'package:ateam_software_test/presentation/theme/theme_color.dart';
import 'package:ateam_software_test/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/cached_network_image.dart';
import 'bloc/chat_bloc.dart';
import 'bloc/chat_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatBloc get bloc => BlocProvider.of(context);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {},
      builder: (context, state) {
        Widget body;
        if (state is ChatLoading) {
          body = const Center(child: CircularProgressIndicator());
        } else if (state is ChatLoaded) {
          body = ListView.separated(
            padding: EdgeInsets.only(top: 20.h),
            itemCount: state.items.length,
            separatorBuilder: (_, __) => 8.vSpace,
            itemBuilder: (context, index) =>
                ChatListTile(item: state.items[index]),
          );
        } else if (state is ChatError) {
          body = Center(child: Text('Error: ${state.message}'));
        } else {
          body = const SizedBox.shrink();
        }

        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(16.r),
                  child: AppTextField(
                    hintText: 'Search messages',
                    prefixIcon: Assets.images.svg.icSearch.svg(),
                  ),
                ),
                Expanded(child: body),
              ],
            ),
            backgroundColor: ThemeColor.scaffold,
          ),
        );
      },
    );
  }
}

class ChatListTile extends StatelessWidget {
  final ChatItem item;

  const ChatListTile({super.key, required this.item});

  String _formatTime(DateTime dt) {
    final now = DateTime.now();
    if (now.difference(dt).inDays == 0) {
      return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
    }
    return '${dt.day}/${dt.month}/${dt.year}';
  }

  Widget _timeText(ChatItem item) {
    return Text(
      _formatTime(item.time),
      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
    );
  }

  Widget _statusIcon(ChatItem item) {
    if (item.status == null) return const SizedBox.shrink();

    switch (item.status!) {
      case MessageStatus.sent:
        return Assets.images.svg.icSent.svg();
      case MessageStatus.delivered:
        return Assets.images.svg.icReceived.svg();
      case MessageStatus.seen:
        return Assets.images.svg.icReceived.svg();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(26.w),
        child: CachedNetworkImageWrapper.avatar(
          url: item.avatarUrl,
          size: 52.w,
        ),
      ),
      title: Text(
        item.name,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        item.message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          _timeText(item),
          if (item.unreadCount != null && item.unreadCount! > 0)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: AppGradient.colors),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${item.unreadCount}',
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
          _statusIcon(item),
        ],
      ),
    );
  }
}
