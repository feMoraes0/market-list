import 'package:marketlist/models/item.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDb {
  Future<Database> _init() async {
    return openDatabase(
      join(await getDatabasesPath(), 'market.db'),
      onCreate: (database, version) {
        return database.execute('CREATE TABLE itens('
            'ID INTEGER PRIMARY KEY AUTOINCREMENT,'
            'NAME TEXT,'
            'STATUS BOOLEAN'
            ')');
      },
      version: 1,
    );
  }

  Future<void> insert(Item item) async {
    Database database = await this._init();
    await database.insert(
      'itens',
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print(item.toMap());
    return;
  }

  Future<List<Item>> selectAll() async {
    Database database = await this._init();
    final List<Map<String, dynamic>> itensDb = await database.query(
      'itens',
      orderBy: 'ID DESC',
    );
    return List.generate(itensDb.length, (index) {
      return Item(
        name: itensDb[index]['NAME'],
        status: (itensDb[index]['STATUS'] == 1) ? true : false,
      );
    });
  }

  Future<void> update(Item item, int id) async {
    Database database = await this._init();
    await database.update(
      'itens',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> delete(int id) async {
    Database database = await this._init();
    await database.delete(
      'itens',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
