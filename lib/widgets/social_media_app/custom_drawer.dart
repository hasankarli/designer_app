import 'package:designer_app2/data/social_media_app/data.dart';
import 'package:designer_app2/screens/social_media_app/login_screen.dart';
import 'package:designer_app2/screens/social_media_app/profile_screen.dart';
import 'package:designer_app2/screens/social_media_app/social_home_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  _buildDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                image: AssetImage(currentUser.backgroundImageUrl),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 3.0,
                              color: Theme.of(context).primaryColor)),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      currentUser.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5),
                    )
                  ],
                ),
              )
            ],
          ),
          _buildDrawerOption(
              Icon(Icons.dashboard),
              'Home',
              () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => SocialHomeScreen()))),
          _buildDrawerOption(Icon(Icons.chat), 'Chat', () {}),
          _buildDrawerOption(Icon(Icons.location_on), 'Map', () {}),
          _buildDrawerOption(Icon(Icons.account_circle), 'Your Profile', () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ProfileScreen(user: currentUser)))),
          _buildDrawerOption(Icon(Icons.settings), 'Settings', () {}),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                  Icon(Icons.directions_run),
                  'Logout',
                  () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()))),
            ),
          ),
        ],
      ),
    );
  }
}
