import 'package:attendance_tracker/screens/summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/attendance_provider.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade50,
        title: Padding(
          padding: const EdgeInsets.only(
              top:30,
              left: 26),

          child: Text(
            'Daily Attendance - June 10',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black12)],
                ),

                child: ListView.builder(
                  itemCount: provider.students.length,
                  itemBuilder: (context, index) {
                    final student = provider.students[index];

                    return CheckboxListTile(
                      activeColor: Colors.green,
                      checkboxShape: CircleBorder(),
                      title: Text(
                        student.name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      value: student.isPresent,
                      onChanged: (value) {
                        provider.toggleAttendance(index, value ?? false);
                      },
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SummeryScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
