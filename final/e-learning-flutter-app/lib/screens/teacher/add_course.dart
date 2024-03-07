import 'package:e_learning_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddCoursePage extends StatefulWidget {
  @override
  _AddCoursePageState createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  final TextEditingController _teacherNameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorImgController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();
  late FlutterSecureStorage secureStorage;

  void _addCourse() async {
    final String teacherName = _teacherNameController.text;
    final String title = _titleController.text;
    final String authorImgPath = _authorImgController.text;
    final String imageUrlPath = _imageUrlController.text;
    secureStorage = const FlutterSecureStorage();

    if (teacherName.isEmpty || title.isEmpty) {
      // Show an alert or error message
      return;
    }

    try {
      // Upload authorImg and imageUrl images
      final authorImgResponse = await _uploadImage(authorImgPath);
      final imageUrlResponse = await _uploadImage(imageUrlPath);

      if (authorImgResponse.statusCode == 200 &&
          imageUrlResponse.statusCode == 200) {
        final Map<String, String> formData = {
          'teacherName': teacherName,
          'title': title,
          'authorImg': authorImgResponse.body,
          'imageUrl': imageUrlResponse.body,
        };

        final http.Response response = await http.post(
          Uri.parse("http://localhost:5000/modules/add"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(formData),
        );

        if (response.statusCode == 200) {
          // Course added successfully
          print(response.body);
          await secureStorage.write(key: "COURSE_DATA", value: response.body);
          final Map<String, dynamic> data = jsonDecode(response.body);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Success"),
                content: Text(data['message']),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        } else {
          // Error occurred while adding the course
          _showErrorDialog();
        }
      } else {
        // Error occurred while uploading images
        _showErrorDialog();
      }
    } catch (error) {
      print(error);
      _showErrorDialog();
    }
  }

  Future<http.Response> _uploadImage(String imagePath) async {
    final Uri uploadUri = Uri.parse(
        "http://localhost:5000/upload"); // Replace with your actual image upload endpoint
    final http.MultipartRequest request =
        http.MultipartRequest('POST', uploadUri);

    request.files.add(await http.MultipartFile.fromPath('image', imagePath));

    final http.Response response =
        await http.Response.fromStream(await request.send());
    return response;
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("An error occurred. Please try again."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _teacherNameController,
              decoration: InputDecoration(labelText: 'Teacher Name'),
            ),
            TextField(
              controller: _authorImgController,
              decoration: InputDecoration(labelText: 'Author Image URL'),
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addCourse,
              style: ElevatedButton.styleFrom(primary: kAccent),
              child: Text('Add Course'),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: kBackground,
      elevation: 0,
      centerTitle: false,
      title: const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Text(
          'Add Course',
          style: TextStyle(color: kFontLight, fontSize: 16),
        ),
      ),
    );
  }
}
