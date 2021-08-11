import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:birthday_remainder/models/wish.dart';
import 'package:shared_preferences/shared_preferences.dart';



class WishData extends ChangeNotifier{
  SharedPreferences sp;
  List<Wish> _wishs=[
    Wish(name: "Thanks for installing our APP",date: DateTime.now()),

  ];
  UnmodifiableListView<Wish> get wishs{
    return UnmodifiableListView(_wishs);
  }


  void addWish(String newWishName,DateTime date){
  final wish = Wish(name:newWishName, date: date);
  _wishs.add(wish);
  notifyListeners();
  saveData();
  }
  void deleteWish(Wish wish){
    _wishs.remove(wish);
    notifyListeners();
    saveData();
  }
  void dummy(){}

  void saveData(){
    List<String> spList=_wishs.map((wish)=>jsonEncode(wish.toMap())).toList();
    sp.setStringList("wishs", spList);
    print(spList);

  }
  void loadData(SharedPreferences sharedPreferences){
    sp=sharedPreferences;
    List<String> spList=sharedPreferences.getStringList('wishs');
    if(spList != null) {
      _wishs = spList.map((wish) => Wish.fromMap(jsonDecode(wish))).toList();
    }
    notifyListeners();
  }
  void search() {

  }
}