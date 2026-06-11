import 'package:attendance_tracker/screens/attendance_screen.dart';
import 'package:flutter/material.dart';

class AttendanceTrackerApp extends StatelessWidget {
  const AttendanceTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Tracker App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.cyan.shade50,
      ),
      home: AttendanceScreen(),
    );
  }
}
