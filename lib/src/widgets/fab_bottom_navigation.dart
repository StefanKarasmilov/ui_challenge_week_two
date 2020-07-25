import 'package:flutter/material.dart';


class FABBottomAppBarItem {

  FABBottomAppBarItem({this.iconData});
  IconData iconData;
  // String text;

}

class FABBottomAppBar extends StatefulWidget {

  FABBottomAppBar({
    @required this.items, 
    this.onTabSelected,
    this.color = Colors.grey,
    this.selectedColor = Colors.white,
    this.height = 60,
    this.iconSize = 24
  });

  final List<FABBottomAppBarItem> items;
  final ValueChanged<int> onTabSelected;
  final Color color;
  final Color selectedColor;
  final double height;
  final double iconSize;


  @override
  _FABBottomAppBarState createState() => _FABBottomAppBarState();
}

class _FABBottomAppBarState extends State<FABBottomAppBar> {

  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    
    List<Widget> items = List.generate(widget.items.length, (index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      notchMargin: 5,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items
      ),
    );

  }

  Widget _buildMiddleTabItem() {

    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize,),
            Text(
              '',
              style: TextStyle(color: widget.color),
            )
          ],
        ),
      )
    );

  }

  Widget _buildTabItem({
    FABBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {

    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              children: <Widget>[
                _selectedIndex == index ? Divider(
                  thickness: 2,
                  color: color,
                  indent: 10,
                  endIndent: 10,
                  height: 2,
                ) : Container(),
                SizedBox(height: 10,),
                Container(
                  child: Icon(item.iconData, color: color, size: widget.iconSize),
                ),
              ],
            )
          ),
        ),
      ) 
    );

  }

}