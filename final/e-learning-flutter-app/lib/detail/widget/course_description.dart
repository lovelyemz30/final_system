import 'package:e_learning_app/constants/colors.dart';
import 'package:e_learning_app/models/course.dart';
import 'package:flutter/material.dart';

class CourseDescription extends StatelessWidget {
  final Course course;
  CourseDescription(this.course);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                course.authorImg,
                width: 20,
              ),
              SizedBox(width: 5),
              Text(
                course.teacherName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 5,
                width: 5,
                decoration:
                    BoxDecoration(color: kFontLight, shape: BoxShape.circle),
              ),
              Icon(
                Icons.access_time_filled,
                size: 20,
                color: kAccent,
              ),
              SizedBox(width: 5),
              Text(
                '1h 35 min',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: kFont,
                ),
              )
            ],
          ),
          SizedBox(height: 15),
          Text(
            course.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: kFont,
            ),
          ),
          SizedBox(height: 15),
          // 5 Lessons Buttons with SizedBox
          Column(
            children: List.generate(
              5,
              (index) => Column(
                children: [
                  LessonButton(
                    lessonNumber: index + 1,
                    onPressed: () {
                      // Add your lesson button functionality here
                    },
                  ),
                  SizedBox(height: 10), // Adjust the height as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LessonButton extends StatelessWidget {
  final int lessonNumber;
  final VoidCallback onPressed;

  LessonButton({required this.lessonNumber, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10.0), // Adjust the radius as needed
      ),
      color: kAccent,
      child: ListTile(
        title: Text('Lesson $lessonNumber',
            style: TextStyle(color: Colors.white)), // Set text color to white
        trailing: IconButton(
          icon: Icon(Icons.play_circle_fill,
              color: Colors.white), // Set icon color to white
          onPressed: onPressed,
        ),
      ),
    );
  }
}
