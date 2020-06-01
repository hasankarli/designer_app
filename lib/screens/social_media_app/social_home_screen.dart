import 'package:designer_app2/data/social_media_app/data.dart';
import 'package:designer_app2/models/social_media_app/user_model.dart';
import 'package:designer_app2/widgets/social_media_app/custom_drawer.dart';
import 'package:designer_app2/widgets/social_media_app/following_users.dart';
import 'package:designer_app2/widgets/social_media_app/posts_carousel.dart';
import 'package:flutter/material.dart';

class SocialHomeScreen extends StatefulWidget {
  @override
  _SocialHomeScreenState createState() => _SocialHomeScreenState();
}

class _SocialHomeScreenState extends State<SocialHomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          'FRENZY',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 10.0),
        ),
        bottom: TabBar(
            controller: _tabController,
            indicatorWeight: 3.0,
            labelColor: Theme.of(context).primaryColor,
            labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            unselectedLabelStyle: TextStyle(fontSize: 18.0),
            tabs: <Widget>[
              Tab(
                text: 'Trending',
              ),
              Tab(
                text: 'Latest',
              )
            ]),
      ),
      body: ListView(
        children: <Widget>[
          FollowingUsers(),
          PostsCarousel(
              pageController: _pageController, title: 'Posts', posts: posts)
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
