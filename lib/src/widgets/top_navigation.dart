import 'package:flutter/material.dart';


class TopNavigation extends StatefulWidget {
  @override
  _TopNavigationState createState() => _TopNavigationState();
}

class _TopNavigationState extends State<TopNavigation> {

  final List<String> rooms = ['LIVING ROOM', 'KITCHEN', 'DRAWING ROOM', 'DINNER ROOM', 'REST ROOM'];
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 40,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: rooms.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {

          return SizedBox(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedItem = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: index == _selectedItem ? Text(rooms[index], style: TextStyle(color: Colors.white),)
                                  : Text(rooms[index], style: TextStyle(color: Colors.grey),),
                  decoration: index == _selectedItem ? BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 2,
                        color: Colors.amber
                      )
                    )
                  ) : BoxDecoration(),
                ),
              ),
            ),
          );

        } 
      ),
    );

  }

}