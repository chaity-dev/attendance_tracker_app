import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/student_model.dart';

class AttendanceProvider extends ChangeNotifier {
  final List<Student> students = [
    Student(id: 1, name: 'Mahmud'),
    Student(id: 2, name: 'Anika'),
    Student(id: 3, name: 'Sadia'),
    Student(id: 4, name: 'Sun'),
    Student(id: 5, name: 'Mim'),
    Student(id: 6, name: 'Rafiu'),
    Student(id: 7, name: 'Achia'),
    Student(id: 8, name: 'Jaha'),
    Student(id: 9, name: 'Aunkon'),
    Student(id: 10, name: 'Payel'),
  ];

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
