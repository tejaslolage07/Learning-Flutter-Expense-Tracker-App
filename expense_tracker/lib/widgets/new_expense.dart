import 'package:flutter/material.dart';

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
      child: Column(children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            prefixText: '\$ ',
            labelText: 'Amount',
          ),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
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
