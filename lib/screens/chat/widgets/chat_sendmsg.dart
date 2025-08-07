import 'package:flutter/material.dart';

class ChatSendmsg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '이샘',
              style: TextStyle(fontSize: 15),
            ),
            Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFFEBB0),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text('안녕하세요'),
                ],
              ),
            ),
            Text('25.08.07 11:00', style: TextStyle(color: Colors.grey)),
          ],
        ),
        SizedBox(width: 10),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[300],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.person),
            ],
          ),
        ),
      ],
    );
  }
}
