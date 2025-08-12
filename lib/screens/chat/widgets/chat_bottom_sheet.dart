import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project03/models/user_state.dart';
import 'package:project03/utils/app_theme.dart';
import 'package:project03/view_model/chat_view_model.dart';

class ChatBottomSheet extends ConsumerStatefulWidget {
  final double bottomPadding;
  final UserState userState;

  const ChatBottomSheet({
    super.key,
    required this.bottomPadding,
    required this.userState,
  });

  @override
  ConsumerState<ChatBottomSheet> createState() => _ChatBottomSheetState();
}

class _ChatBottomSheetState extends ConsumerState<ChatBottomSheet> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final message = _controller.text.trim();
    if (message.isNotEmpty) {
      // ViewModel을 통해 메시지와 사용자 정보 전송
      ref.read(chatViewModelProvider.notifier).sendMessage(
            message: message,
            userState: widget.userState,
          );
      _controller.clear();
      // 메시지 전송 후에도 포커스를 유지하여 연속적인 입력이 가능
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10 + widget.bottomPadding),
      decoration: const BoxDecoration(
        color: AppColors.secondary,
        border: Border(
          top: BorderSide(color: AppColors.primary, width: 1.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              autofocus: true,
              decoration: InputDecoration(
                  hintText: '내용을 입력해 주세요...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: AppColors.primary)),
                  filled: true,
                  fillColor: Colors.white,
                  // contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20)),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
