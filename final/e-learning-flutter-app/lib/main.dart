import 'package:e_learning_app/login_register/login.dart';
import 'package:e_learning_app/login_register/register.dart';
import 'package:e_learning_app/screens/Navpage/profile.dart';
import 'package:e_learning_app/screens/home/home.dart';
import 'package:e_learning_app/screens/teacher/add_course.dart';
import 'package:e_learning_app/screens/teacher/home.dart';
import 'package:e_learning_app/screens/teacher/view_course.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Learning',
      home: LoginPage(),
      routes: {
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegistrationPage(),
        '/teacher_home': (context) => TeacherHomePage(),
        'AddCoursePage': (context) => AddCoursePage(),
        // 'ViewCoursePage': (context) => ViewCoursePage(),
      },
    );
  }
}
