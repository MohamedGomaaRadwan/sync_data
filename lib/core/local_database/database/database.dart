import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:sync_data/core/local_database/dao/dao.dart';
import 'package:sync_data/core/models/employee.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Employee])
abstract class EmployeeDatabase extends FloorDatabase {
  EmployeeDao get employeeDao;
}

