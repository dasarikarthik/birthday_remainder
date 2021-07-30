import 'package:birthday_remainder/screens/add_wish.dart';
import 'package:birthday_remainder/models/wish_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:birthday_remainder/Widgets/wish_list.dart';
import 'package:birthday_remainder/models/wish.dart';
import 'package:provider/provider.dart';
import 'package:birthday_remainder/main.dart';

class RemaindersScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(
          '${Provider.of<WishData>(context).wishs.length} wishs',
        ),
        backgroundColor: Color(0xff39A2DB),
        title: Text("Birthday Wisher"),
        centerTitle: true,
      ),
      backgroundColor: Color(0xffA2DBFA),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          //Write code here
          Navigator.push(context, MaterialPageRoute(builder: (context) =>AddWishPage(),
          ));
        },
      ),
      body:Container(
        padding: EdgeInsets.all(5.0),
        child:WishList(),
      ),
    );
  }
}


