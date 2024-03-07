import 'package:flutter/material.dart';
import 'package:activity_theming/models/expense.dart';

class AddItemSheet extends StatefulWidget {
  const AddItemSheet({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;

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

  Category _selectedCategory = Category.leisure;

  void _submitExpenseData() {
    // tryParse('hello') => null, tryParse('1.23') => 1.23
    final enteredAmount = double.tryParse(_amountController.text);
    final isAmountInvalid = enteredAmount == null || enteredAmount <= 0;
    // 유효성 검사  trim(): 공백 제거
    if (_titleController.text.trim().isEmpty ||
        isAmountInvalid ||
        _selectedData == null) {
      //에러 메시지 보여주기
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text('올바른 입력을 해주세요'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                }, //
                child: const Text('Okay'))
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(
      Expense(
          title: _titleController.text,
          amount: enteredAmount,
          date: _selectedData!,
          category: _selectedCategory),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Padding(
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
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                  value: _selectedCategory,
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('취소'),
                ),
                ElevatedButton(
                    onPressed: _submitExpenseData, child: const Text('저장')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
