import 'package:dio/dio.dart';

import '../models/student.dart';

class StudentDioRepository {
  Future<List<Student>> findAll() async {
    try {
      final studentResult = await Dio().get('http://localhost:8080/students');

      return studentResult.data.map<Student>((student) {
        return Student.fromMap(student);
      }).toList();
    } on DioError {
      throw Exception();
    }
  }

  Future<Student> findById(int id) async {
    try {
      final studentResult =
          await Dio().get('http://localhost:8080/students/$id');

      if (studentResult.data == null) {
        throw Exception();
      }

      return Student.fromMap(studentResult.data);
    } on DioError {
      throw Exception();
    }
  }

  Future<void> insert(Student student) async {
    try {
      await Dio().post(
        'http://localhost:8080/students',
        data: student.toMap(),
      );
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> update(Student student) async {
    try {
      await Dio().put(
        'http://localhost:8080/students/${student.id}',
        data: student.toMap(),
      );
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> deleteById(int id) async {
    try {
      Dio().delete('http://localhost:8080/students/$id');
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }
}
