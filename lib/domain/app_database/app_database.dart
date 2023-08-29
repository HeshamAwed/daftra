import 'dart:async';
import 'package:daftra/domain/app_database/user_dao.dart';
import 'package:daftra/domain/enitities/user.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part  'app_database.g.dart';

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}