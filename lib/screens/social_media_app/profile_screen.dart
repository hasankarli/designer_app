import 'package:designer_app2/data/social_media_app/data.dart';
import 'package:designer_app2/models/social_media_app/user_model.dart';
import 'package:designer_app2/widgets/social_media_app/custom_drawer.dart';
import 'package:designer_app2/widgets/social_media_app/posts_carousel.dart';
import 'package:designer_app2/widgets/social_media_app/profile_clipper.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  const ProfileScreen({this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PageController _yourPostsController;
  PageController _favoritesPageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _yourPostsController = PageController(initialPage: 0, viewportFraction: 0.8);
    _favoritesPageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 300.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage(widget.user.backgroundImageUrl),
                  ),
                ),
                Positioned(
                  top: 30.0,
                  left: 20.0,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 30,
                    color: Theme.of(context).primaryColor,
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  ),
                ),
                Positioned(
                    bottom: 10.0,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 6.0,
                                offset: Offset(0, 2),
                                color: Colors.black45)
                          ]),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          height: 120.0,
                          width: 120.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                widget.user.name,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Following',
                        style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5)),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(widget.user.following.toString(),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('Followers',
                        style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5)),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(widget.user.followers.toString(),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ))
                  ],
                )
              ],
            ),
            PostsCarousel(
              pageController: _yourPostsController,
              title: 'Your Posts',
              posts: widget.user.posts,
            ),
            PostsCarousel(
              pageController: _favoritesPageController,
              title: 'Favorites',
              posts: widget.user.favorites,
            )
          ],
        ),
      ),
    );
  }
}
