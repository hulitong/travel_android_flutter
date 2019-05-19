import 'package:flutter/material.dart';
import 'navigator/bottom_navigator_bar_widget.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title:'Flutter bottomNavigationBar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: BottomNavigationBarWidget(),
    );
  }
}