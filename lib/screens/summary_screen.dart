import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../providers/attendance_provider.dart';

class SummeryScreen extends StatelessWidget {
  const SummeryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);

    final int totalStudents = provider.students.length;

    final double presentPercent = provider.presentCount / totalStudents;

    final double absentPercent = provider.absentCount / totalStudents;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.cyan.shade50),

      body: Column(
        children: [
          Text(
            'Attendance Summary',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 60),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Present',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),

                  SizedBox(height: 10),

                  CircularPercentIndicator(
                    radius: 70,
                    lineWidth: 15,
                    animation: true,
                    percent: presentPercent,
                    progressColor: Colors.green,
                    backgroundColor: Colors.green.shade200,
                    circularStrokeCap: CircularStrokeCap.round,

                    center: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${provider.presentCount}/10\n',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          TextSpan(
                            text: '(${(presentPercent * 100).toInt()}%)',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  Text(
                    'Absent',
                    style: TextStyle(
                      color: Colors.blueGrey.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),

                  SizedBox(height: 10),

                  CircularPercentIndicator(
                    radius: 70,
                    lineWidth: 15,
                    animation: true,
                    percent: absentPercent,
                    progressColor: Colors.blueGrey,
                    backgroundColor: Colors.blueGrey.shade100,
                    circularStrokeCap: CircularStrokeCap.round,

                    center: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${provider.presentCount}/10\n',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          TextSpan(
                            text: '(${(presentPercent * 100).toInt()}%)',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 60),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Present Students:',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      provider.presentStudents.isEmpty
                          ? 'None'
                          : provider.presentStudents.join(', '),
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),

                    SizedBox(height: 12),

                    Text(
                      'Absent Students:',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      provider.absentStudents.isEmpty
                          ? 'None'
                          : provider.absentStudents.join(', '),
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
