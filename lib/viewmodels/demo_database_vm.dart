import 'dart:async';
import 'dart:io';
import '../utils/all_utils.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/demo_movie_model.dart';

class DemoDatabaseVM {
  static final DemoDatabaseVM db = DemoDatabaseVM();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'demo.db');
    return await openDatabase(path, version: 9, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE movies (row_id INTEGER PRIMARY KEY,'
          'movie_id INTEGER,poster TEXT,revenue INTEGER,title TEXT)');
      await db.execute('CREATE INDEX idx_movies_title ON movies (title);');
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {});
  }

  beginTransaction() async {
    final db = await database;
    db.rawDelete('BEGIN TRANSACTION;');
  }

  commit() async {
    final db = await database;
    db.rawDelete('COMMIT;');
  }

  Future<int> movieInsert(DemoMovieModel movie) async {
    final db = await database;
    var insertedId = await db.rawInsert(
        'INSERT INTO movies (row_id,movie_id,poster,revenue,title)'
        ' VALUES (?,?,?,?,?)',
        [
          null,
          movie.movie_id,
          movie.poster,
          movie.revenue,
          movie.title,
        ]);
    return insertedId;
  }

  Future<List<int>> movieLoadAllRowIds() async {
    final db = await database;
    var res = await db.rawQuery('SELECT row_id FROM movies');
    List<int> list =
        res.isNotEmpty ? res.map((c) => c.getInt('row_id')).toList() : [];
    return list;
  }

  Future<int> movieCount() async {
    final db = await database;
    var res = await db.rawQuery('SELECT COUNT(*) FROM movies');
    int? count = Sqflite.firstIntValue(res);
    if (count != null) {
      return count;
    } else {
      return 0;
    }
  }

  Future<List<int>> movieSearch(String title) async {
    final db = await database;
    var res = await await db
        .query('movies', where: 'title like ?', whereArgs: ['%$title%']);
    List<int> list =
        res.isNotEmpty ? res.map((c) => c.getInt('row_id')).toList() : [];
    return list;
  }

  Future<bool?> movieIdExists(int movie_id) async {
    final db = await database;
    var res =
        await db.query('movies', where: 'movie_id = ?', whereArgs: [movie_id]);
    return res.isNotEmpty;
  }

  Future<DemoMovieModel> movieLoad(int row_id) async {
    final db = await database;
    var res =
        await db.query('movies', where: 'row_id = ?', whereArgs: [row_id]);
    DemoMovieModel? result =
        res.isNotEmpty ? DemoMovieModel.fromMap(res.first) : DemoMovieModel();
    return result;
  }

  movieUpdate(int row_id, DemoMovieModel movie) async {
    final db = await database;
    var res = await db.update('movies', movie.toMap(),
        where: 'row_id = ?', whereArgs: [row_id]);
    return res;
  }

  movieDelete(int row_id) async {
    final db = await database;
    var res =
        await db.delete('movies', where: 'row_id = ?', whereArgs: [row_id]);
    return res;
  }

  movieDeleteAll() async {
    final db = await database;
    db.rawDelete('DELETE FROM movies;');
  }

  static demo() async {
    await DemoDatabaseVM.db.movieDeleteAll();
    var movie = DemoMovieModel();
    movie.movie_id = 1001;
    movie.poster = 'transformers.jpg';
    movie.title = 'Transformers: Rise of the Beasts';
    movie.revenue = 1000000000;
    await DemoDatabaseVM.db.movieInsert(movie);
    movie.movie_id = 1002;
    movie.poster = 'thor.jpg';
    movie.title = 'Thor: Love and Thunder';
    movie.revenue = 2000000000;
    await DemoDatabaseVM.db.movieInsert(movie);
    movie.movie_id = 1003;
    movie.poster = 'barbie.jpg';
    movie.title = 'Barbie';
    movie.revenue = 3000000000;
    await DemoDatabaseVM.db.movieInsert(movie);

    LoggerX.log('All rows:');
    var row_ids = await DemoDatabaseVM.db.movieLoadAllRowIds();
    for (final row_id in row_ids) {
      final movie = await DemoDatabaseVM.db.movieLoad(row_id);
      LoggerX.log(
          '[$row_id] movie_id: ${movie.movie_id} ${movie.title} ${movie.poster} ${movie.revenue}');
    }

    LoggerX.log('Number of rows: ${await DemoDatabaseVM.db.movieCount()}');

    final keyword = 'love';
    LoggerX.log('Search: $keyword');
    row_ids = await DemoDatabaseVM.db.movieSearch(keyword);
    for (final row_id in row_ids) {
      final movie = await DemoDatabaseVM.db.movieLoad(row_id);
      LoggerX.log('[$row_id] ${movie.title} ${movie.poster} ${movie.revenue}');
    }
  }
}
