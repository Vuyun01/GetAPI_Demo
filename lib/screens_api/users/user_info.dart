import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../model/users.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key, required this.user}) : super(key: key);
  final Users user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 60),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: size.height * 0.6, width: size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(2, 8),
                blurRadius: 15,
              ),
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${user.name}", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              Text("(${user.username})", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              Row(
                children: [
                  const Icon(Icons.email, color: Colors.grey),
                  const SizedBox(width: 10,),
                  Text("${user.email}", style: const TextStyle(fontSize: 15),),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.phone, color: Colors.grey),
                  const SizedBox(width: 10,),
                  Text("${user.phone}", style: const TextStyle(fontSize: 15),),
                ],
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(text: "Street:  ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: "${user.address.street}",),
                  ]
                )
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(text: "Suite:  ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: "${user.address.suite}",),
                  ]
                )
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(text: "City:  ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: "${user.address.city}",),
                  ]
                )
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  children: [
                    TextSpan(text: "Zipcode:  ", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: "${user.address.zipcode}",),
                  ]
                )
              ),
            ],
            
          ),
        ),
      ),
    );
  }
}