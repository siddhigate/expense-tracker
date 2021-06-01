import 'package:expensetracker/Pages/AddExpensePage.dart';
import 'package:expensetracker/Pages/HomePage.dart';
import 'package:expensetracker/Pages/ProfilePage.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    //final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
 body: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: TabBar(
              
              tabs: [
                Tab(icon: Icon(Icons.home_outlined,color:Colors.lightBlueAccent)),
               Tab(icon: Icon(Icons.add,color: Colors.lightBlueAccent,)),
                Tab(icon: Icon(Icons.person_outline_outlined,color:Colors.lightBlueAccent)),
              ],
            ),
            
           // title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              
             HomePage(),
             AddExpensePage(),
              ProfilePage()
            ],
          ),
  //          floatingActionButton:
  //     FloatingActionButton(
  //       heroTag: "btn1",
  //       child: Icon(Icons.add), onPressed: () {
  //       //HomePage(),
  //     }),
  // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        ),
      ),
    );

  //  );
  }
}
  
  
      