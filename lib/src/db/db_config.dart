import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'app_database.db');
    return openDatabase(
      path,
      version: 3,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE user(id INTEGER PRIMARY KEY, name TEXT, email TEXT UNIQUE, password TEXT, phone TEXT, image TEXT)',
        );

        await db.execute(
          'CREATE TABLE days(id INTEGER PRIMARY KEY, date TEXT UNIQUE)',
        );

        await db.execute(
          'CREATE TABLE inventory(id INTEGER PRIMARY KEY, name TEXT, image TEXT)',
        );

        await db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT, isCompleted INTEGER DEFAULT 0, dayId INTEGER, color TEXT,image TEXT, FOREIGN KEY(dayId) REFERENCES days(id) ON DELETE CASCADE)',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 3) {
          final columns = await db.rawQuery('PRAGMA table_info(user)');
          final columnNames =
              columns.map((col) => col['name']! as String).toList();

          if (!columnNames.contains('phone')) {
            await db.execute('ALTER TABLE user ADD COLUMN phone TEXT');
          }

          final taskColumns = await db.rawQuery('PRAGMA table_info(tasks)');
          final taskColumnNames =
              taskColumns.map((col) => col['name']! as String).toList();

          if (!taskColumnNames.contains('color')) {
            await db.execute('ALTER TABLE tasks ADD COLUMN color TEXT');
          }
          await db.execute(
            'CREATE TABLE IF NOT EXISTS inventory(id INTEGER PRIMARY KEY, name TEXT, image TEXT)',
          );
        }
      },
    );
  }

  Future<void> updateUser(
    int id,
    String name,
    String email,
    String password,
    String phone,
    String image,
  ) async {
    final db = await database;
    await db.update(
      'user',
      {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'image': image,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Funciones para usuarios
  Future<int> insertUser(
    String name,
    String email,
    String password,
    String phone,
    String iamge,
  ) async {
    final db = await database;
    //create validation if user exist
    final List<Map<String, dynamic>> existingUsers = await db.query(
      'user',
      where: 'email = ?',
      whereArgs: [email],
    );

    if (existingUsers.isNotEmpty) {
      return -1; // Usuario ya existe
    }

    return db.insert(
      'user',
      {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
        'image': iamge,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final db = await database;
    final users =
        await db.query('user', where: 'email = ?', whereArgs: [email]);
    if (users.isNotEmpty) {
      return users.first;
    }
    return null;
  }

  Future<int> insertInventory(String name, String image) async {
    final db = await database;
    return db.insert(
      'inventory',
      {
        'name': name,
        'image': image,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getInventory() async {
    final db = await database;
    final inventory = await db.query('inventory');
    return inventory;
  }

  Future<void> deleteInventory(int id) async {
    final db = await database;
    await db.delete('inventory', where: 'id = ?', whereArgs: [id]);
  }

  // Funciones para days y tasks
  Future<int?> insertDay(String date) async {
    final db = await database;

    // Verifica si el día ya existe
    final existingDay = await db.query(
      'days',
      where: 'date = ?',
      whereArgs: [date],
    );

    // Si el día ya existe, retorna el id de ese día
    if (existingDay.isNotEmpty) {
      return existingDay.first['id'] as int?;
    }

    // Si no existe, inserta el nuevo día
    return db.insert(
      'days',
      {'date': date},
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<int?> insertTask(
    String title,
    String description,
    String date,
    String color,
    String image,
  ) async {
    final db = await database;

    // Verificar si el día ya existe, si no, lo crea
    var dayId = await insertDay(date);

    // Obtener el id del día si ya existe
    if (dayId == 0) {
      final day = await db.query('days', where: 'date = ?', whereArgs: [date]);
      dayId = day.first['id']! as int;
    }

    // Insertar la tarea con el dayId
    await db.insert(
      'tasks',
      {
        'title': title,
        'description': description,
        'dayId': dayId,
        'isCompleted': 0,
        'color': color,
        'image': image,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return dayId;
  }

  Future<List<Map<String, dynamic>>> getTasksForDay(String date) async {
    final db = await database;
    final day = await db.query('days', where: 'date = ?', whereArgs: [date]);
    if (day.isEmpty) return [];

    final dayId = day.first['id']! as int;
    final tasks =
        await db.query('tasks', where: 'dayId = ?', whereArgs: [dayId]);

    // Convertir el color hexadecimal de vuelta a un Color
    return tasks;
  }

  // Función para marcar una tarea como completada o no
  Future<void> updateTaskCompletion(
    int id,
    bool isCompleted,
    String image,
  ) async {
    final db = await database;
    await db.update(
      'tasks',
      {
        'isCompleted': isCompleted ? 1 : 0,
        'image': image,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateTask(int id, String title, String description) async {
    final db = await database;
    await db.update(
      'tasks',
      {'title': title, 'description': description},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  // Obtener el rango de semana de lunes a domingo con el total de tareas registradas
  Future<List<Map<String, dynamic>>> getWeeklyTaskCount(
    String startDate,
    String endDate,
  ) async {
    final db = await database;

    // Obtener tareas entre el rango de fechas
    final List<Map<String, dynamic>> tasks = await db.rawQuery(
      '''
      SELECT t.id, t.title, t.description, t.dayId,t.isCompleted, d.date, COUNT(t.id) as taskCount
      FROM tasks t
      JOIN days d ON t.dayId = d.id
      WHERE d.date = ?
      GROUP BY d.date
      ORDER BY d.date
    ''',
      [startDate],
    );

    return tasks;
  }

  Future<List<Map<String, dynamic>>> getDaysPast() async {
    //filter days past to day now
    final db = await database;
    final now = DateTime.now();
    final dateFormat = '${now.day}-${now.month}-${now.year}';

    // Consulta para obtener todas las fechas diferentes a la actual
    final List<Map<String, dynamic>> days = await db.rawQuery(
      '''
    SELECT d.id,d.date
    FROM days d
    WHERE d.date != ?
    ORDER BY d.date
    ''',
      [dateFormat], // Pasa la fecha actual como parámetro
    );

    return days;
  }
}
