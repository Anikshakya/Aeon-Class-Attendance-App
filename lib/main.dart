import 'package:aeon_class_attendance/view/scan_code.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aeon Class Attendance',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: const Color(0xffEE3253),
          selectionColor: const Color(0xffEE3253).withOpacity(0.3),
          selectionHandleColor: const Color(0xffEE3253),
        ),
      ),
      home: const ScanCode(),
    );
  }
}
