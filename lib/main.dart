import 'package:designer_app2/constants/budget_app/theme_data.dart';
import 'package:designer_app2/constants/social_media_app/theme_data.dart';
import 'package:designer_app2/screens/social_media_app/login_screen.dart';
import 'package:flutter/material.dart';
import 'screens/budget_app/budget_home_screen.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: socialMediaAppTheme,
      home: LoginScreen(),
    );
  }
}