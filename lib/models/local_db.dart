import 'package:marketlist/models/product.dart';
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

  Future<void> insert(Product product) async {
    Database database = await this._init();
    await database.insert(
      'itens',
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return;
  }

  Future<List<Product>> selectAll() async {
    Database database = await this._init();
    final List<Map<String, dynamic>> itensDb = await database.query(
      'itens',
      orderBy: 'ID DESC',
    );
    return List.generate(itensDb.length, (index) {
      return Product(
        id: itensDb[index]['ID'],
        name: itensDb[index]['NAME'],
        status: (itensDb[index]['STATUS'] == 1) ? true : false,
      );
    });
  }

  Future<void> update(Product product) async {
    Database database = await this._init();
    await database.update(
      'itens',
      product.toMap(),
      where: 'id = ?',
      whereArgs: [product.getId()],
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
