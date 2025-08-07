import 'package:flutter/material.dart';
import 'package:project03/utils/app_theme.dart';

class ChatBottomSheet extends StatefulWidget {
  ChatBottomSheet(this.bottomPadding);

  final double bottomPadding;
  @override
  State<ChatBottomSheet> createState() => _ChatBottomPageState();
}

class _ChatBottomPageState extends State<ChatBottomSheet> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onSend() {
    print('onSend 터치됨');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70 + widget.bottomPadding,
      color: AppColors.secondary,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    onSubmitted: (value) => onSend(),
                    decoration: InputDecoration(border:
                        MaterialStateOutlineInputBorder.resolveWith((states) {
                      return OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: AppColors.primary));
                    })),
                  ),
                ),
                GestureDetector(
                  onTap: onSend,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.transparent,
                    child: Icon(
                      Icons.send,
                      color: AppColors.primary,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: widget.bottomPadding)
        ],
      ),
    );
  }
}
