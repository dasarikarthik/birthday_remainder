import 'dart:convert';

import 'package:birthday_remainder/services/notification.dart';
import 'package:flutter/material.dart';
import 'package:birthday_remainder/screens/remainder_screen.dart';
import 'package:provider/provider.dart';
import 'package:birthday_remainder/models/wish_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:birthday_remainder/models/wish.dart';
import 'package:workmanager/workmanager.dart';
const myTask = "syncWithTheBackEnd";

void  callbackDispatcher(){
Workmanager.executeTask((taskName, inputData) async {
  final prefs=await SharedPreferences.getInstance();
//show the notification
// NotificationService.instantNofitication("ThankYou","ThankYou for installing our App");
// Provider.of<WishData>(,listen:false).search();
  WishData().loadData(prefs);

  List<String> spList=prefs.getStringList('wishs');
  List<Wish> wishes;
  if(spList != null) {
    wishes = spList.map((wish) => Wish.fromMap(jsonDecode(wish))).toList();
  }
  wishes.forEach((wish) {
    if(wish.date.month==DateTime.now().month){
      if(wish.date.day==DateTime.now().day){
        NotificationService().instantNofitication(wish.name,"Today is ${wish.name} birthday, make their birthday memorable");
      }
      else if(wish.date.day==DateTime.now().day+1) {
        NotificationService().instantNofitication(wish.name,"Tomorrow is ${wish.name} birthday, make their birthday memorable");

      }
    }
    else{

    }
  });

return Future.value(true);

});
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager.initialize(callbackDispatcher);
  await Workmanager.registerPeriodicTask(
    "2",
    // use the same task name used in callbackDispatcher function for identifying the task
    // Each task must have a unique name if you want to add multiple tasks;
    myTask,
    // When no frequency is provided the default 15 minutes is set.
    // Minimum frequency is 15 min.
    // Android will automatically change your frequency to 15 min if you have configured a lower frequency than 15 minutes.
    frequency: Duration(minutes: 15), // change duration according to your needs
  );
  runApp(MyApp());

}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>WishData(),
      // builder: (context)=> WishData(),
      child: MaterialApp(
        home: RemaindersScreen() ,
      ),
        );


  }
}
