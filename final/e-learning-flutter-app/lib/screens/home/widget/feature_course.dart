import 'dart:convert'; // Add this import
import 'package:e_learning_app/screens/home/widget/category_title.dart';
import 'package:e_learning_app/screens/home/widget/course_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/course.dart';

class FeatureCourse extends StatefulWidget {
  @override
  _FeatureCourseState createState() => _FeatureCourseState();
}

class _FeatureCourseState extends State<FeatureCourse> {
  List<Course> coursesList = [];

  @override
  void initState() {
    super.initState();
    fetchCourses();
  }

  Future<void> fetchCourses() async {
    final response =
        await http.get(Uri.parse('http://localhost:5000/modules/course'));

    if (response.statusCode == 200) {
      final List<dynamic> data =
          json.decode(response.body); // Parse the JSON string
      setState(() {
        coursesList = data
            .map((courseData) => Course(
                  courseData['teacherName'],
                  courseData['authorImg'],
                  courseData['title'],
                  courseData['imageUrl'],
                ))
            .toList();
      });
    } else {
      throw Exception('Failed to load courses');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CategoryTitle('Courses', ""),
          Container(
            height: 300,
            padding: const EdgeInsets.all(25),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: coursesList.length,
              itemBuilder: (context, index) => CourseItem(coursesList[index]),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(width: 15),
            ),
          ),
        ],
      ),
    );
  }
}
