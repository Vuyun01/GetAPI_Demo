import 'dart:convert';

class Users{
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final Address address;

  Users({
    required this.id, 
    required this.name, 
    required this.username, 
    required this.email, 
    required this.phone,
    required this.address
  });

  factory Users.fromJson(Map<String, dynamic> json){
    return Users(
      id: json["id"], 
      name: json["name"], 
      username: json["username"], 
      email: json["email"], 
      phone: json["phone"], 
      address: Address.fromJson(json['address']),
    );
  }
}
class Address{
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  Address({
    required this.street, 
    required this.suite, 
    required this.city, 
    required this.zipcode
  });

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
      street: json['street'], 
      suite: json['suite'], 
      city: json['city'],
      zipcode: json['zipcode'], 
    );
  }
}