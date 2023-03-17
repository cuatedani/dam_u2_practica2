import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "TaqueriaDB.db";
  static final _databaseVersion = 1;
  static final table = 'tablapedidos';
  static final columnId = 'NumPedido';
  static final columnCantidad = 'Cantidad';
  static final columnTipo = 'Tipo';
  static final columnCebolla = 'Cebolla';
  static final columnCilantro = 'Cilantro';
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = await getDatabasesPath();
    String fullPath = join(path, _databaseName);
    return await openDatabase(fullPath,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnCantidad TEXT NOT NULL,
            $columnTipo TEXT NOT NULL,
            $columnCebolla TEXT NULL,
            $columnCilantro TEXT NULL
          )
          ''');
  }

  Future<int> registrarpedido(
      String cant, String tipo, String ceb, String cil) async {
    Database db = await database;
    Map<String, dynamic> row = {
      columnCantidad: cant,
      columnTipo: tipo,
      columnCebolla: ceb,
      columnCilantro: cil
    };
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> obtenerpedidos() async {
    Database db = await database;
    return await db.query(table);
  }
}
