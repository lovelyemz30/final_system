// import 'dart:convert';
// import 'package:e_learning_app/screens/teacher/add_course.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ViewCoursePage extends StatefulWidget {
//   @override
//   _ViewCoursePageState createState() => _ViewCoursePageState();
// }

// class _ViewCoursePageState extends State<ViewCoursePage> {
//   final late AddCoursePage addCoursePage;
//   List<Map<String, dynamic>> courses = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchCourses();
//   }

//   Future<void> fetchCourses() async {
//     try {
//       final response = await http.get(
//         Uri.parse('http://localhost:5000/modules'), // Adjust the API endpoint
//       );

//       if (response.statusCode == 200) {
//         final List<dynamic> courseList = json.decode(response.body);
//         setState(() {
//           courses = List<Map<String, dynamic>>.from(courseList);
//         });
//       } else {
//         // Handle error cases
//         print('Failed to fetch courses');
//       }
//     } catch (error) {
//       // Handle network or other errors
//       print(error);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('View Courses'),
//       ),
//       body: ListView.builder(
//         itemCount: courses.length,
//         itemBuilder: (context, index) {
//           final course = courses[index];
//           return ListTile(
//             title: Text(course['title']),
//             subtitle: Text('Teacher ID: ${course['teacher_id']}'),
            
//             // Add other relevant information
//           );
//         },
//       ),
//     );
//   }
// }
