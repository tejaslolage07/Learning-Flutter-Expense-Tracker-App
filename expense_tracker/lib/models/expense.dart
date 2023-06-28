import 'package:uuid/uuid.dart'; // uuid is a package that generates unique ids. (3rd party package)

const uuid = Uuid();

enum Category { food, travel, leisure, work }

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid
            .v4(); // uuid.v4() generates a unique id string and passes it to the id parameter.
}
