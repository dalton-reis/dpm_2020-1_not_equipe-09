import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dao/book_dao.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'library.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(BookDao.tableSql);
    },
    version: 2,
  );
}
