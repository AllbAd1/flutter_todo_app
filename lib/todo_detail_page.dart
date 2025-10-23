import 'package:flutter/material.dart';
import 'home_page.dart';

class ToDoDetailPage extends StatefulWidget {
  final Todo todo;
  final ValueChanged<Todo> onUpdate;

  const ToDoDetailPage({super.key, required this.todo, required this.onUpdate});

  @override
  State<ToDoDetailPage> createState() => _ToDoDetailPageState();
}

class _ToDoDetailPageState extends State<ToDoDetailPage> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.todo.isFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      widget.todo.isFavorite = isFavorite;
      widget.onUpdate(widget.todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],

        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.star : Icons.star_border,
              color: isFavorite ? Colors.black : Colors.grey[700],
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
      backgroundColor: Colors.grey[400],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.todo.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            if (widget.todo.description != null &&
                widget.todo.description!.isNotEmpty)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.short_text_rounded,
                    size: 20,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.todo.description!,
                      style: const TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ),
                ],
              )
            else
              const Text(
                '세부 정보 없음',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
          ],
        ),
      ),
    );
  }
}
