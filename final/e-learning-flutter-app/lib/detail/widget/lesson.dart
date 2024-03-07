import 'package:flutter/material.dart';

class LessonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson Page'),
      ),
      body: ListView.builder(
        itemCount: 5, // Number of lessons
        itemBuilder: (context, index) {
          // Lesson content
          String lessonName = 'Lesson ${index + 1}';

          return ListTile(
            title: Text(lessonName),
            trailing: IconButton(
              icon: Icon(
                Icons.play_circle_fill,
                size: 30,
                color: Colors.blue,
              ),
              onPressed: () {
                // Add your logic to handle the play button press
                print('Playing $lessonName');
              },
            ),
          );
        },
      ),
    );
  }
}
