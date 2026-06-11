# Attendance Tracker App

A simple flutter application that tracks the attendance of 10 static students using provider state management.

## How to Run the Project

1. Clone the repository.
2. Run `flutter pub get`.
3. Run `flutter run`.

# Why ChangeNotifier and notifyListeners() Were Used

ChangeNotifier is used to manage the attendance state of students.

when a student's attendance status changes, notifyListeners() is called to update all listening widgets automatically and refresh the UI with the latest data.






