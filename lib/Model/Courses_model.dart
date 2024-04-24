// To parse this JSON data, do
//
//     final courseResponse = courseResponseFromJson(jsonString);

import 'dart:convert';

List<CourseResponse> courseResponseFromJson(String str) => List<CourseResponse>.from(json.decode(str).map((x) => CourseResponse.fromJson(x)));

String courseResponseToJson(List<CourseResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseResponse {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  CourseResponse({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  factory CourseResponse.fromJson(Map<String, dynamic> json) => CourseResponse(
    id: json["id"],
    title: json["title"],
    price: json["price"].toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating!.toJson(),
  };
}

class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"].toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}
