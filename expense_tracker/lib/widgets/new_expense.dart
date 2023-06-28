import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  // final void Function(
  //     String title, double amount, DateTime date, String category) addExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          maxLength: 50,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(labelText: 'Title'),
          // onSubmitted: (value) => print(value),
        ),
      ]),
    );
  }
}
