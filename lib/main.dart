import 'package:flutter/material.dart';
import 'package:birthday_remainder/screens/remainder_screen.dart';
import 'package:provider/provider.dart';
import 'package:birthday_remainder/models/wish_data.dart';
import 'package:birthday_remainder/services/caller.dart';
import 'package:workmanager/workmanager.dart';
const myTask = "syncWithTheBackEnd";
void callbackDispatcher(){
  Workmanager.executeTask((taskName, inputData) async {
    //show the notification
    // NotificationService.instantNofitication("ThankYou","ThankYou for installing our App");
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

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>WishData(),
      // builder: (context)=> WishData(),
      child: MaterialApp(
        home: RemaindersScreen(),
      ),
        );


  }

}
