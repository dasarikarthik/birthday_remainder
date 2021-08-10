import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:birthday_remainder/screens/add_wish.dart';
import 'package:birthday_remainder/models/wish_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:birthday_remainder/Widgets/wish_list.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:birthday_remainder/services/notification.dart';
import 'package:birthday_remainder/services/caller.dart';


class RemaindersScreen extends StatefulWidget {

  @override
  _RemaindersScreenState createState() => _RemaindersScreenState();
}

class _RemaindersScreenState extends State<RemaindersScreen> {


  SharedPreferences sharedPreferences;



  @override
  void initState() {
    loadSharedPreferencesAndData();
    NotificationService.initialize();
    // Provider.of<NotificationService>(context, listen: false).initialize();
    super.initState();
  }

  void loadSharedPreferencesAndData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Provider.of<WishData>(context,listen:false).loadData(sharedPreferences);
  }




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
          // Provider.of<WishData>(context,listen:false).search();
          print("called");
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


