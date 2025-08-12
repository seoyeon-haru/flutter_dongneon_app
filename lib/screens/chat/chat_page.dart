import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project03/screens/chat/widgets/chat_bottom_sheet.dart';
import 'package:project03/screens/chat/widgets/chat_content_page.dart';
import 'package:project03/utils/app_theme.dart';
import '../../models/user_state.dart';
import '../../view_model/chat_view_model.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key, required this.userState});
  final UserState userState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to the stream of chats
    final chatListAsync = ref.watch(chatStreamProvider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: false,
          // Use the user's address from the state
          title: Text(userState.address, style: AppTextStyles.title),
        ),
        bottomSheet: ChatBottomSheet(
          bottomPadding: MediaQuery.of(context).padding.bottom,
          userState: userState,
        ),
        body: Column(
          children: [
            // Use AsyncValue.when to handle loading/error/data states
            Expanded(
              child: chatListAsync.when(
                data: (chats) => ChatContentPage(
                  chats: chats,
                  currentUserId: userState.senderId,
                ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text('Error: $error')),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
