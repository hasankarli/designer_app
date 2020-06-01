import 'package:designer_app2/data/food_delivery_app/data.dart';
import 'package:designer_app2/models/food_delivery_app/order.dart';
import 'package:flutter/material.dart';

class RecentOrders extends StatelessWidget {
  _buildRecentOrder(BuildContext context, Order order) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 320,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(width: 1.0, color: Colors.grey[200])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    image: AssetImage(order.food.imageUrl),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          order.food.name,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.0,),
                        Text(
                          order.restaurant.name,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4.0,),
                        Text(
                          order.date,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
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
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Recent Order",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.2),
          ),
        ),
        Container(
          height: 120,
          child: ListView.builder(
            padding: EdgeInsets.only(left:10.0),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (BuildContext context, int index) {
              Order order = currentUser.orders[index];
              return _buildRecentOrder(context, order);
            },
          ),
        )
      ],
    );
  }
}
