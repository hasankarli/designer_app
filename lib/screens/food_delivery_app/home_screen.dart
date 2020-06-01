import 'package:designer_app2/data/food_delivery_app/data.dart';
import 'package:designer_app2/models/food_delivery_app/restaurant.dart';
import 'package:designer_app2/screens/food_delivery_app/cart_screen.dart';
import 'package:designer_app2/screens/food_delivery_app/restaurant_screen.dart';
import 'package:designer_app2/widgets/food_delivery_app/rating_stars.dart';
import 'package:designer_app2/widgets/food_delivery_app/recent_orders.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _buildRestaurants() {
    List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RestaurantScreen(
                        restaurant: restaurant,
                      ))),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(width: 1.0, color: Colors.grey[200])),
            child: Row(
              children: <Widget>[
                Hero(
                  tag: restaurant.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                        image: AssetImage(restaurant.imageUrl)),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(restaurant.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 4.0,
                        ),
                        RatingStars(restaurant.rating),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(restaurant.address,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w600)),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text('0.2 miles away',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    return Column(children: restaurantList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Food Delivery"),
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle,
                size: 30,
              )),
          actions: <Widget>[
            FlatButton(
                onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen())),
                child: Text(
                  "Cart (${currentUser.cart.length})",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ))
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(width: 0.8)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(
                            width: 0.8, color: Theme.of(context).primaryColor)),
                    hintText: "Search Food or Restuarants",
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: Icon(Icons.clear, size: 30))),
              ),
            ),
            RecentOrders(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Nearby Restaurants",
                    style: TextStyle(
                        fontSize: 24.0,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                _buildRestaurants()
              ],
            ),
          ],
        ));
  }
}
