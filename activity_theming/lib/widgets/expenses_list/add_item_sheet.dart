import 'package:flutter/material.dart';
import 'package:activity_theming/models/expense.dart';

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
  final _amountController = TextEditingController();
  DateTime? _selectedData;

  void _presentDatePicker() async {
    final nowTime = DateTime.now();
    final firstDate = DateTime(nowTime.year - 1, nowTime.month, nowTime.day);

    final pickedData = await showDatePicker(
        context: context,
        initialDate: nowTime, //
        firstDate: firstDate,
        lastDate: nowTime);
    setState(() {
      _selectedData = pickedData;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            // onChanged: _saveTitleInput,
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(label: Text('제목')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  // onChanged: _saveTitleInput,
                  controller: _amountController,
                  maxLength: 50,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixText: '\$ ', // 앞에 해당 문자열 추가 추가
                      label: Text('사용금액')),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(_selectedData == null
                        ? 'Select Date'
                        : formatter.format(_selectedData!)),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: const Icon(Icons.date_range))
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              DropdownButton(
                  items: Category.values
                      .map(
                        //
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toString(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {}),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('취소'),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(_amountController.text);
                  },
                  child: const Text('SAVE')),
            ],
          ),
        ],
      ),
    );
  }
}
