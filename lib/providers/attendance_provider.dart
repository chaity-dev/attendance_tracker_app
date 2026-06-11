import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/student_model.dart';

class AttendanceProvider extends ChangeNotifier {
  final List<Student> students = List.generate(
    10,
    (index) => Student(name: 'Student ${index + 1}'),
  );
  void toggleAttendance(int index, bool value) {
    students[index].isPresent = value;
    notifyListeners();
  }

  int get presentCount => students.where((student) => student.isPresent).length;

  int get absentCount => students.where((student) => !student.isPresent).length;

  List<String> get presentStudents => students
      .where((student) => student.isPresent)
      .map((e) => e.name)
      .toList();

  List<String> get absentStudents => students
      .where((student) => !student.isPresent)
      .map((e) => e.name)
      .toList();
}
