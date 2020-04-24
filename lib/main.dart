import 'dart:convert';

import 'package:flutter/material.dart';

import 'API.dart';
import 'UserPage.dart';
import 'models/User.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
    build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget{
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State{
  var users = new List<User>();

  _getUsers(){
    API.getUsers().then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose(){
    super.dispose();
  }

  @override
  build(context){
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (Context, index){
          return ListTile(
            leading: Image.asset('assets/avatar.png',),
              title: Text(users[index].name),
            subtitle: Text(users[index].email),

            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UserPage(
                  post:users[index],
                )
              )
            ),
          );
        },
      ),
    );
  }
}




