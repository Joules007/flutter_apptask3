import 'package:flutter/material.dart';
import 'package:flutterapptask3/models/User.dart';


class UserPage extends StatelessWidget{
  final User post;

  UserPage({@required this.post});

  @override
  Widget build(BuildContext context){
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
          radius: 70.0,
          child: Image.asset('assets/avatar.png',),
        ),
      );
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
            logo,
            SizedBox(height: 50.0),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    title: Text("ID"),
                    subtitle: Text("${post.id}"),
                  ),
                  ListTile(
                    title: Text("Name"),
                    subtitle: Text(post.name),
                  ),
                  ListTile(
                    title: Text("Username"),
                    subtitle: Text("${post.username}"),
                  ),
                  ListTile(
                    title: Text("Email"),
                    subtitle: Text(post.email),
                  ),
                  ListTile(
                    title: Text("ID"),
                    subtitle: Text("${post.phone}"),
                      ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ),
      );
  }
}