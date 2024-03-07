import 'dart:convert';
import 'package:e_learning_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:e_learning_app/login_register/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late FlutterSecureStorage secureStorage;
  String fullname = "";

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

    setState(() {
      fullname = "${body["data"]["firstname"]} ${body["data"]["lastname"]}";
    });
  }

  Future<void> logout() async {
    await secureStorage.delete(key: "USER_DATA");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: kBackground,
      title: Text('Profile', style: TextStyle(color: kFontLight)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            fullname,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Use ScaffoldMessenger to show SnackBar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Logging out...'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'OK',
                    onPressed: () {
                      // Perform logout logic here
                      // For simplicity, just navigate to the login page
                      logout();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: kAccent, // Use the accent color from your theme
            ),
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
