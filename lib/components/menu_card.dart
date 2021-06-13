import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  String meal;
  String pictureId;
  MenuCard({
    required this.meal,
    required this.pictureId,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(243, 243, 243, 1),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              pictureId,
              width: 120.0,
              height: 90.0,
            ),
            Text(
              meal,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              'IDR 15.000,00',
              style: TextStyle(
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
