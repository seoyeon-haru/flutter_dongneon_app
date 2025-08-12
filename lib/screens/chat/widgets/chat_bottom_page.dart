import 'package:flutter/material.dart';

class ChatBottomPage extends StatefulWidget {
  @override
  State<ChatBottomPage> createState() => _ChatBottomPageState();
}

class _ChatBottomPageState extends State<ChatBottomPage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 130,
      color: Color(0xFFFFEBB0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                border: MaterialStateOutlineInputBorder.resolveWith(
                  (states) {
                    return OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xFF4C9DB0)));
                  },
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              print('전송됨');
            },
            child: Container(
              width: 50,
              height: 50,
              color: Colors.transparent,
              child: Icon(
                Icons.send,
                color: Color(0xFF4C9DB0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
