import 'dart:convert';

class Foods{
  final String name;
  final double rating;
  final String totalTime;
  final String images;

  Foods({
    required this.name, 
    required this.rating, 
    required this.totalTime,  
    required this.images
  });

  factory Foods.fromJson(Map<String, dynamic> json){
    return Foods(
      name: json['name'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String, 
      images: json['images'][0]['hostedLargeUrl'] as String
    );
  }
}