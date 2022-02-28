import 'package:flutter/material.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //  appBar: new AppBar(
      //    title: new Text("Home"),

      //  ),
       body: new Center(child: new Text("home page")
       ),
    );
  }
}