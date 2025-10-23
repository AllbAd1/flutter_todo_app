import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/todo_detail_page.dart';


class Todo {
  String title;
  String? description;
  bool isDone;
  bool isFavorite;

  Todo({
    required this.title,
    this.description,
    this.isDone = false,
    this.isFavorite = false,
  });
}


class HomePage extends StatefulWidget {
  final String name;
  const HomePage(this.name, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  final List<Todo> _todoList = [];


  void _addTodo(String text) {
    setState(() {
      _todoList.add(Todo(title: text));
    });
  }

  
  void _toggleDone(int index) {
    setState(() {
      _todoList[index].isDone = !_todoList[index].isDone;
    });
  }


  void _toggleFavorite(int index) {
    setState(() {
      _todoList[index].isFavorite = !_todoList[index].isFavorite;
    });
  }

  
  void _showAddSheet() {
    controller.clear();
    final TextEditingController descriptionController = TextEditingController();
    bool showDescriptionField = false;
    bool isFavorite = false;
    final focusNode = FocusNode();

    Future.delayed(const Duration(milliseconds: 100), () {
      FocusScope.of(context).requestFocus(focusNode);
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
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
                    focusNode: focusNode,
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      hintText: '새 할 일',
                      hintStyle: TextStyle(fontSize: 16),
                      border: InputBorder.none,
                    ),
                  ),

                  if (showDescriptionField)
                    TextField(
                      controller: descriptionController,
                      maxLines: null, 
                      decoration: const InputDecoration(
                        hintText: '세부정보 추가',
                        hintStyle: TextStyle(fontSize: 14),
                        border: InputBorder.none,
                      ),
                    ),

                
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.short_text_rounded),
                        onPressed: () {
                          setModalState(() {
                            showDescriptionField = !showDescriptionField;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.star : Icons.star_border,
                          color: isFavorite ? Colors.black : Colors.grey[700],
                        ),
                        onPressed: () {
                          setModalState(() {
                            isFavorite = !isFavorite; 
                          });
                        },
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          if (controller.text.trim().isNotEmpty) {
                            setState(() {
                              _todoList.add(
                                Todo(
                                  title: controller.text.trim(),
                                  description: descriptionController.text
                                      .trim(),
                                  isFavorite: isFavorite,
                                ),
                              );
                            });
                            Navigator.pop(context);
                          }
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          widget.name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.grey[400],

      body: _todoList.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                Center(
                  child: Container(
                    width: 400,
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('asstes/cat.png', width: 120, height: 120),

                        const SizedBox(height: 16),
                        const Text(
                          "아직 할 일이 없음",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "할 일을 추가하고 ${widget.name}에서\n할 일을 추적하세요.",
                          style: TextStyle(
                            color: Colors.grey[700],
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                final todo = _todoList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ToDoDetailPage(
                          todo: _todoList[index],
                          onUpdate: (updatedTodo) {
                  
                            setState(() {
                              _todoList[index] = updatedTodo;
                            });
                          },
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            todo.isDone
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: todo.isDone
                                ? Colors.black
                                : Colors.grey[700],
                          ),
                          onPressed: () => _toggleDone(index),
                        ),
                        Expanded(
                          child: Text(
                            todo.title,
                            style: TextStyle(
                              decoration: todo.isDone
                                  ? TextDecoration.lineThrough
                                  : null,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            todo.isFavorite ? Icons.star : Icons.star_border,
                            color: todo.isFavorite
                                ? Colors.black
                                : Colors.grey[700],
                          ),
                          onPressed: () => _toggleFavorite(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: _showAddSheet,
      ),
    );
  }
}
