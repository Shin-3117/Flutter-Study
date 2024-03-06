import 'package:flutter/material.dart';

class AddItemSheet extends StatefulWidget {
  const AddItemSheet({super.key});

  @override
  State<AddItemSheet> createState() {
    return _AddItemSheet();
  }
}

class _AddItemSheet extends State<AddItemSheet> {
  // var _enteredTitle = '';

  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }

  final _titleController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            // onChanged: _saveTitleInput,
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                  },
                  child: const Text('SAVE')),
            ],
          )
        ],
      ),
    );
  }
}
