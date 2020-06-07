import 'package:bytebank/models/expense.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bytebank/database/app_database.dart';

class ExpenseDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_value INTEGER,'
      '$_recurrence INTEGER)';
  static const String _tableName = 'expense';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _value = 'valor';
  static const String _recurrence = 'recurrence';

  Future<int> save(Expense expense) async {
    final Database db = await getDatabase();
    Map<String, dynamic> expanseMap = _toMap(expense);
    return db.insert(_tableName, expanseMap);
  }

  Future<List<Expense>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Expense> expenses = _toList(result);
    return expenses;
  }

  Map<String, dynamic> _toMap(Expense expense) {
    final Map<String, dynamic> expenseMap = Map();
    expenseMap[_name] = expense.name;
    expenseMap[_value] = expense.value;
    expenseMap[_recurrence] = expense.recurrence;
    return expenseMap;
  }

  List<Expense> _toList(List<Map<String, dynamic>> result) {
    final List<Expense> expenses = List();
    for (Map<String, dynamic> row in result) {
      final Expense expense = Expense(
        row[_id],
        row[_name],
        row[_value],
        row[_recurrence],
      );
      expenses.add(expense);
    }
    return expenses;
  }

}
