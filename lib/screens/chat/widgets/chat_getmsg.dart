import 'package:flutter/material.dart';

class ChatGetmsg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '서연',
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
            Text('25.08.07 10:50', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
