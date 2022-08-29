import 'package:flutter/material.dart';
import 'package:lesson3_api/screens_api/users/user_info.dart';

import '../../model/users.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key, required this.users}) : super(key: key);

  final List<Users> users;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => UserInfo(user: users[index])));
          },
          child: Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            elevation: 5,
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding: EdgeInsets.all(15),
              title: Text("${users[index].id}: ${users[index].name}"),
              trailing: Text("${users[index].email}"),
            ),
          ),
        ),
      )
    );
  }
}