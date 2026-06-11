import 'package:attendance_tracker/providers/attendance_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AttendanceProvider(),
      child: const AttendanceTrackerApp(),
    ),
  );
}
