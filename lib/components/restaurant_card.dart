import 'package:flutter/material.dart';
import '../pages/restaurant_detail.dart';

class RestaurantCard extends StatefulWidget {
  String name;
  num rating;
  String city;
  String type;
  String pictureId;
  String description;
  Map<String, dynamic> menus;
  RestaurantCard({
    required this.name,
    required this.rating,
    required this.city,
    required this.type,
    required this.pictureId,
    required this.description,
    required this.menus,
  });

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        elevation: 2.0,
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.pictureId,
                  child: Image.network(
                    widget.pictureId,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          pressed = !pressed;
                        });
                      },
                      icon: Icon(
                        !pressed ? Icons.favorite_border : Icons.favorite,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        widget.type.toUpperCase(),
                        style: TextStyle(
                          color: Color.fromRGBO(138, 138, 138, 1),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.rating.toStringAsFixed(1),
                            style: TextStyle(
                              color: Color.fromRGBO(254, 177, 27, 1),
                              textBaseline: TextBaseline.ideographic,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Color.fromRGBO(254, 177, 27, 1),
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            widget.city,
                            style: TextStyle(
                              color: Color.fromRGBO(138, 138, 138, 1),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(254, 177, 27, 1),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: IconButton(
                          padding: EdgeInsets.all(0.0),
                          constraints: BoxConstraints(
                            maxHeight: 40.0,
                            maxWidth: 40.0,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RestaurantDetailPage(
                                  name: widget.name,
                                  description: widget.description,
                                  pictureId: widget.pictureId,
                                  menus: widget.menus,
                                  city: widget.city,
                                  rating: widget.rating,
                                  type: widget.type,
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
