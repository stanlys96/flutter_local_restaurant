import 'dart:convert';

class Restaurant {
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late num rating;
  late String type;
  late Map<String, dynamic> menus;
  Restaurant({
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.type,
    required this.menus,
  });

  Restaurant.fromJson(Map<String, dynamic> restaurant) {
    name = restaurant['name'];
    description = restaurant['description'];
    pictureId = restaurant['pictureId'];
    city = restaurant['city'];
    rating = restaurant['rating'];
    type = restaurant['type'];
    menus = restaurant['menus'];
  }
}

List<Restaurant> parseRestaurants(String? json) {
  if (json == null) {
    return [];
  }
  final Map parsed = jsonDecode(json);
  return parsed['restaurants']
      .map<Restaurant>((json) => Restaurant.fromJson(json))
      .toList();
}
