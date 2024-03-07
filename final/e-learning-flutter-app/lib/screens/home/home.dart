import 'dart:convert';

import 'package:e_learning_app/constants/colors.dart';
import 'package:e_learning_app/screens/Navpage/profile.dart';
// import 'package:e_learning_app/screens/home/widget/active_course.dart';
import 'package:e_learning_app/screens/home/widget/emoji_text.dart';
import 'package:e_learning_app/screens/home/widget/feature_course.dart';
import 'package:e_learning_app/screens/home/widget/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FlutterSecureStorage secureStorage;
  String firstname = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secureStorage = const FlutterSecureStorage();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    String? userData = await secureStorage.read(key: "USER_DATA");
    final body = json.decode(userData!);

    // print(body["data"]["firstname"]);

    setState(() {
      firstname = body["data"]["firstname"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(firstname),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            EmojiText(),
            SearchInput(),
            FeatureCourse(),
            // ActiveCourse(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: kBackground,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Container(
            padding: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: kAccent, width: 2)),
            ),
            child: Text(
              'Home',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // BottomNavigationBarItem(
        //   label: 'Calendar',
        //   icon: Image.asset(
        //     'assets/icons/calendar.png',
        //     width: 20,
        //   ),
        // ),
        // BottomNavigationBarItem(
        //   label: 'Bookmark',
        //   icon: Image.asset(
        //     'assets/icons/bookmark.png',
        //     width: 20,
        //   ),
        // ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: Image.asset(
            'assets/icons/user.png',
            width: 20,
          ),
        ),
      ],
      onTap: (index) {
        if (index == 1) {
          // Navigate to the profile page when 'Profile' tab is selected
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        }
      },
    );
  }

  AppBar _buildAppBar(String firstname) {
    return AppBar(
      backgroundColor: kBackground,
      elevation: 0,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          'Hello, $firstname',
          style: const TextStyle(color: kFontLight, fontSize: 16),
        ),
      ),
      actions: [
        // Stack widget to put together Container & Positioned
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10, right: 20),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border:
                    Border.all(color: kFontLight.withOpacity(0.3), width: 2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                'assets/icons/notification.png',
                width: 30,
              ),
            ),
            // Position notification circle into the right place
            Positioned(
              top: 15,
              right: 30,
              child: Container(
                height: 8,
                width: 8,
                decoration: const BoxDecoration(
                  color: kAccent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
