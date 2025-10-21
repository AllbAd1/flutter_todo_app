import 'package:flutter/material.dart';

class Mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "범수's Tasks",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Container(
            width: 400,
            height: 250,

            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "아직 할 일이 없음\n \n 할 일을 추가하고 범수's Tasks에서 할 일을 추적하세요. ",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
