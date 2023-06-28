import 'package:uuid/uuid.dart'; // uuid is a package that generates unique ids. (3rd party package)

const uuid = Uuid();

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Expense({required this.title, required this.amount, required this.date})
      : id = uuid
            .v4(); // uuid.v4() generates a unique id string and passes it to the id parameter.
}
