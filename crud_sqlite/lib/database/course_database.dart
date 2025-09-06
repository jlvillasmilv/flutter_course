import 'package:crud_sqlite/models/contacs.dart';
import 'package:crud_sqlite/models/tasks.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContactDatabase {
  static final ContactDatabase instance = ContactDatabase._init();

  static Database? _database;

  ContactDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('contacts.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final sql = '''
      CREATE TABLE contacts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        phone TEXT NOT NULL,
        email TEXT NOT NULL
      )
    ''';

    final sql2 = '''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        contact_id INTEGER NOT NULL,
        title TEXT NOT NULL,
        description TEXT NOT NULL,
        isCompleted INTEGER NOT NULL,
        FOREIGN KEY (contact_id) REFERENCES contacts(id)
      )
    ''';

    await db.execute(sql);
    await db.execute(sql2);
  }

  Future<List<Contact>> getContacts() async {
    final db = await database;
    final List<Map<String, dynamic>> contacts = await db.query('contacts');
    return List.generate(contacts.length, (i) {
      return Contact(
        id: contacts[i]['id'],
        name: contacts[i]['name'],
        phone: contacts[i]['phone'],
        email: contacts[i]['email'],
      );
    });
  }

  Future<List<Task>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> tasks = await db.query('tasks');
    return List.generate(tasks.length, (i) {
      return Task(
        id: tasks[i]['id'],
        contactId: tasks[i]['contact_id'],
        title: tasks[i]['title'],
        description: tasks[i]['description'],
        isCompleted: tasks[i]['isCompleted'],
      );
    });
  }

  Future<int> insertContact(Contact contact) async {
    final db = await database;
    return await db.insert('contacts', contact.toMap());
  }

  Future<int> insertTask(Task task) async {
    final db = await database;
    return await db.insert('tasks', task.toMap());
  }

  Future<int> updateContact(Contact contact) async {
    final db = await database;
    return await db.update(
      'contacts',
      contact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> updateTask(Task task) async {
    final db = await database;
    return await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteContact(int id) async {
    final db = await database;
    return await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
