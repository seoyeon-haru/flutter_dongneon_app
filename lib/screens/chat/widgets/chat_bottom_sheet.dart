import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project03/utils/app_theme.dart';
import 'package:project03/view_model/chat_view_model.dart';

class ChatBottomSheet extends ConsumerStatefulWidget {
  final double bottomPadding;
  const ChatBottomSheet(this.bottomPadding, {super.key});

  @override
  ConsumerState<ChatBottomSheet> createState() => _ChatBottomSheetState();
}

class _ChatBottomSheetState extends ConsumerState<ChatBottomSheet> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    // ViewModel을 통해 메시지 전송
    ref.read(chatViewModelProvider.notifier).sendMessage(_controller.text);
    // 입력창 비우기
    _controller.clear();
    // 키보드 내리기
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10 + widget.bottomPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
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
              decoration: InputDecoration(
                hintText: '메시지를 입력하세요',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              onSubmitted: (value) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: _sendMessage,
            color: AppColors.secondary,
          ),
        ],
      ),
    );
  }
}
