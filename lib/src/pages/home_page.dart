import 'package:flutter/material.dart';
import 'package:table_menu/src/widgets/fab_bottom_navigation.dart';
import 'package:table_menu/src/widgets/table_menu.dart';
import 'package:table_menu/src/widgets/top_navigation.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _appBar(),
            TopNavigation(),
            TableMenu()
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _floatingButton(),
      bottomNavigationBar: _bottomNavigation(),
    );

  }

  Widget _bottomNavigation() {

    return FABBottomAppBar(
      onTabSelected: _onTabSelected,
      items: [
        FABBottomAppBarItem(iconData: Icons.home),
        FABBottomAppBarItem(iconData: Icons.calendar_today),
        FABBottomAppBarItem(iconData: Icons.equalizer),
        FABBottomAppBarItem(iconData: Icons.more_horiz),
      ]
    );

  }

  void _onTabSelected(int index) {

    print('$index');
  }

  Widget _floatingButton() {

    return FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add, color: Colors.white,),
      elevation: 2.0,
      backgroundColor: Colors.pink,
    );

  }

  Widget _appBar() {

    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Icon(Icons.ac_unit, size:30),
          SizedBox(width: 5,),
          Text(
            '25°C',
            style: TextStyle(fontSize: 30),
          ),
          Expanded(child: Container()),
          Icon(Icons.add_alert, size: 30,)
        ],
      ),
    );

  }

}