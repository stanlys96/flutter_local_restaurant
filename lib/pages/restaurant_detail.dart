import 'package:flutter/material.dart';
import '../components/menu_card.dart';

class RestaurantDetailPage extends StatefulWidget {
  String pictureId;
  String city;
  String description;
  Map<String, dynamic> menus;
  String name;
  num rating;
  String type;
  RestaurantDetailPage({
    required this.pictureId,
    required this.city,
    required this.description,
    required this.menus,
    required this.name,
    required this.rating,
    required this.type,
  });
  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
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
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
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
                )
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.teal,
                          ),
                        ),
                        Text(
                          widget.type,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color.fromRGBO(138, 138, 138, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color.fromRGBO(254, 177, 27, 1),
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          widget.rating.toStringAsFixed(1),
                          style: TextStyle(
                            color: Color.fromRGBO(254, 177, 27, 1),
                            textBaseline: TextBaseline.ideographic,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                          ),
                          Text(
                            widget.city,
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SecondaryHeading(
                      text: 'DESCRIPTION',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        widget.description,
                        style: TextStyle(
                          height: 1.2,
                        ),
                      ),
                    ),
                    SecondaryHeading(
                      text: 'FOOD',
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 150.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.menus['foods'].length,
                        itemBuilder: (context, index) {
                          return MenuCard(
                            meal: widget.menus['foods'][index]['name'],
                            pictureId: widget.pictureId,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10.0),
                    SecondaryHeading(
                      text: 'DRINKS',
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 150.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.menus['drinks'].length,
                        itemBuilder: (context, index) {
                          return MenuCard(
                            meal: widget.menus['drinks'][index]['name'],
                            pictureId: widget.pictureId,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SecondaryHeading extends StatelessWidget {
  String text;
  SecondaryHeading({required this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        color: Colors.blueAccent,
      ),
    );
  }
}
