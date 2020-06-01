import 'package:designer_app2/data/food_delivery_app/data.dart';
import 'package:designer_app2/models/food_delivery_app/food.dart';
import 'package:designer_app2/models/food_delivery_app/restaurant.dart';
import 'package:designer_app2/widgets/food_delivery_app/rating_stars.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantScreen({this.restaurant});

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  _buildMenuItem(Food menuItem) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: 150.0,
            width: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(menuItem.imageUrl), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Container(
            height: 150.0,
            width: 150.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),
                    Colors.black38.withOpacity(0.3),
                  ],
                  stops: [
                    0.1,
                    0.4,
                    0.6,
                    0.9
                  ]),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Positioned(
            bottom: 55.0,
            child: Column(
              children: <Widget>[
                Text(menuItem.name,
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.2,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600)),
                Text('\$${menuItem.price}',
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.2,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Positioned(
            bottom: 7.0,
            right: 7.0,
            child: Container(
              width: 48.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: widget.restaurant.imageUrl,
                  child: Image(
                    height: 220.0,
                    width: MediaQuery.of(context).size.width,
                    image: AssetImage(widget.restaurant.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          iconSize: 30,
                          color: Colors.white,
                          onPressed: () => Navigator.of(context).pop()),
                      IconButton(
                          icon: Icon(Icons.favorite),
                          iconSize: 30,
                          color: Theme.of(context).primaryColor,
                          onPressed: () {})
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(widget.restaurant.name,
                          style: TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.w600)),
                      Text('0.2 miles away',
                          style: TextStyle(
                            fontSize: 18.0,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  RatingStars(widget.restaurant.rating),
                  SizedBox(
                    height: 5,
                  ),
                  Text(widget.restaurant.address,
                      style: TextStyle(
                        fontSize: 18.0,
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  child: Text('Reviews',
                      style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text('Contacts',
                      style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Menu",
                style: TextStyle(
                    fontSize: 22.0,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: GridView.count(
              padding: EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(widget.restaurant.menu.length, (index) {
                Food food = widget.restaurant.menu[index];
                return _buildMenuItem(food);
              }),
            ))
          ],
        ),
      ),
    );
  }
}
