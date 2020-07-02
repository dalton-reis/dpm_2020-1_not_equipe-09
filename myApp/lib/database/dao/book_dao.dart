import 'package:sqflite/sqflite.dart';
import '../app_database.dart';
import '../../models/book.dart';

class BookDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_author TEXT, '
      '$_status TEXT)';
  static const String _tableName = 'books';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _author = 'author';
  static const String _status = 'status';

  Future<int> save(Book book) async {
    final Database db = await getDatabase();
    Map<String, dynamic> bookMap = _toMap(book);
    return db.insert(_tableName, bookMap);
  }

  Future<List<Book>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Book> books = _toList(result);
    return books;
  }

  Map<String, dynamic> _toMap(Book book) {
    final Map<String, dynamic> bookMap = Map();
    bookMap[_name] = book.name;
    bookMap[_author] = book.author;
    bookMap[_status] = book.status;
    return bookMap;
  }

  List<Book> _toList(List<Map<String, dynamic>> result) {
    final List<Book> books = List();
    for (Map<String, dynamic> row in result) {
      final Book book = Book(
        row[_id],
        row[_name],
        row[_author],
        row[_status],
      );
      books.add(book);
    }
    return books;
  }
}
