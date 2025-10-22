/*class AddTodoBottomSheet extends StatefulWidget {
  const AddTodoBottomSheet({super.key});

  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  bool showDescription = false;
  bool isFavorite = false;

  void _saveTodo() {
    if (_titleController.text.trim().isEmpty) return;

    // 👉 여기에 할 일 추가 로직을 넣으면 됩니다.
    print('할 일 제목: ${_titleController.text}');
    print('설명: ${_descController.text}');
    print('즐겨찾기: $isFavorite');

    Navigator.of(context).pop(); // 바텀시트 닫기
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // 내용만큼 높이만 차지
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _titleController,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: '새 할 일',
              hintStyle: TextStyle(fontSize: 16),
              border: InputBorder.none,
            ),
            onSubmitted: (_) => _saveTodo(),
          ),
          const SizedBox(height: 8),
          if (showDescription)
            TextField(
              controller: _descController,
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
                  setState(() {
                    showDescription = !showDescription;
                  });
                },
              ),
              IconButton(
                icon: Icon(
                    isFavorite ? Icons.star : Icons.star_border),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: _titleController.text.trim().isEmpty
                    ? null
                    : _saveTodo,
                style: TextButton.styleFrom(
                  foregroundColor: _titleController.text.trim().isEmpty
                      ? Colors.grey
                      : Colors.deepOrange,
                ),
                child: const Text('저장'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
*/