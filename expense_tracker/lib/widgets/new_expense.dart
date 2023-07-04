import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  // final void Function(
  //     String title, double amount, DateTime date, String category) addExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController =
      TextEditingController(); // This controller is optimized by Flutter to
  // handle user text input. We have to dispose it when we are done or else it
  // lives on in memory and causes overflows.
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      // showDatePicker returns a Future object (like a promise in JS)
      context: context,
      initialDate: now,
      firstDate: now.subtract(const Duration(days: 365)),
      lastDate: now,
    ).then((value) => null);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefixText: '\$ ',
                  labelText: 'Amount',
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'No date selected'
                        : formatter.format(_selectedDate!),
                  ),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            DropdownButton<Category>(
              value: _selectedCategory,
              items: Category.values.map((category) {
                return DropdownMenuItem<Category>(
                  value: category,
                  child: Text(category.name.toUpperCase()),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  if (value == null) return;
                  _selectedCategory = value;
                });
              },
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Save Expense'),
            )
          ],
        )
      ]),
    );
  }
}
