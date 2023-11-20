import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Employee.dart';

class DbHelper {
  Database? _database;
  var CREATE_TABLE_EMPLOYEE =
      'CREATE TABLE employee (id INTEGER PRIMARY KEY AUTOINCREMENT , name TEXT, designation TEXT,department TEXT ,salary TEXT,age TEXT)';
  var DROP_TABLE_EMPLOYEE = 'DROP TABLE IF EXISTS cart_master';
  Future<Database> get db async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    var db = await openDatabase(
      join(documentDirectory.path, 'EmployeeDB.db'),
      version: 1,
      onCreate: onCreate,
      onUpgrade: onUpgradeDb,
    );
    return db;
  }

  onCreate(Database db, int version) async {
    await db.execute(CREATE_TABLE_EMPLOYEE);
  }

  onUpgradeDb(Database db, int oldVersion, int newVersion) async {
    await db.execute(DROP_TABLE_EMPLOYEE);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }

  Future<int> insertEmployee(Employee employeeModel) async {
    var dbClient = await db;
    Map<String, dynamic> row = {
      "name": employeeModel.name,
      "designation": employeeModel.designation,
      "department": employeeModel.department,
      "salary": employeeModel.salary,
      "age": employeeModel.age
    };

    return await dbClient.insert("employee", row);
  }

  Future<List<Employee>> getEmployees() async {
    var dbClient = await db;
    List<Employee> list = [];

    List<Map> map = await dbClient.rawQuery('SELECT * FROM employee');
    for (int i = 0; i < map.length; i++) {
      Employee model = Employee(
          id: map[i]['id'],
          name: map[i]['name'],
          designation: map[i]['designation'],
          department: map[i]['department'],
          salary: map[i]['salary'],
          age: map[i]['age']);
      // Employee model = Employee(
      //   id: map[i]['id'],
      //   name: map[i]['name'],
      //   designation: map[i]['designation'],
      //   department: map[i]['department'],
      //   salary: map[i]['salary'],
      //   age: map[i]['age'],
      // );
      list.add(model);
    }
    return list;
  }

  update(Employee product) async {
    try {
      final dbClient = await db;
      var result = await dbClient.update("employee", product.toMap(),
          where: "id = ?", whereArgs: [product.id]);
      print("result::$result");
      return result;
    } catch (e) {
      print("error$e");
    }
  }

  delete(int id) async {
    final dbClient = await db;
    dbClient.delete("employee", where: "id = ?", whereArgs: [id]);
  }
}
