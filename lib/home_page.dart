import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage(this.name);

  TextEditingController controller = TextEditingController();
  @override
  String name;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          '$name',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.grey[400],
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: 400,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Column(
                  children: [
                    Image.asset('asstes/cat.png', width: 130, height: 130),
                    Text(
                      "아직 할 일이 없음",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "할 일을 추가하고 $name에서",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Text(
                      "할 일을 추적하세요",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 12,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: controller,
                      focusNode: FocusNode(),
                      decoration: const InputDecoration(
                        hintText: '새 할 일',
                        hintStyle: TextStyle(fontSize: 16),
                        border: InputBorder.none,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.short_text_rounded),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.star_border),
                          onPressed: () {},
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.deepOrange,
                          ),
                          child: const Text('저장'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
