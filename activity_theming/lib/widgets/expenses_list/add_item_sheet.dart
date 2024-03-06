import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

  void _presentDatePicker() {
    final nowTime = DateTime.now();
    final firstDate = DateTime(nowTime.year - 1, nowTime.month, nowTime.day);

    showDatePicker(
        context: context,
        initialDate: nowTime, //
        firstDate: firstDate,
        lastDate: nowTime);
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
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            // onChanged: _saveTitleInput,
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(label: Text('제목')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  // onChanged: _saveTitleInput,
                  controller: _amountController,
                  maxLength: 50,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
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
                    Text('Select Date'),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: Icon(Icons.date_range))
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('취소'),
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
