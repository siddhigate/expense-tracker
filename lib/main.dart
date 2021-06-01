import 'package:expensetracker/Pages/HomePage.dart';
import 'package:expensetracker/Pages/LoginPage.dart';
import 'package:expensetracker/Pages/ProfilePage.dart';
import 'package:expensetracker/SQliteDatabase/loggedin.dart';
import 'package:flutter/material.dart';

import 'Pages/OnboardingPage.dart';


void main() {
   
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  Login l = new Login();

  @override
  Widget build(BuildContext context) {
    
    if(l.isLogin==true){
        return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: ProfilePage(),
      
    );
    }else{

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: OnboardingPage(),
              
      
    );
    }
  }
}
