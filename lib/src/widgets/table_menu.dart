import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';


class TableMenu extends StatefulWidget {
  @override
  _TableMenuState createState() => _TableMenuState();
}

class _TableMenuState extends State<TableMenu> {

  bool _turnOn = false;

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(12),
          width: double.infinity,
          child: Table(
            children: [
              TableRow(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: _roundedButton(
                      Colors.blue, 
                      AssetImage('assets/icons/house/aire.png'),
                      'Air Conditioner',
                      'Voltas RF140'
                    )
                  ), 
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: _roundedButton(
                      Colors.amber, 
                      AssetImage('assets/icons/house/tv.png'),
                      'Smart TV',
                      'Samsung EX55 4k'
                    )
                  ), 
                ]
              ),
              TableRow(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: _roundedButton(
                      Colors.green, 
                      AssetImage('assets/icons/house/light.png'),
                      'Light Blub',
                      'Philips Hue2'
                    )
                  ), 
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: _roundedButton(
                      Colors.purpleAccent, 
                      AssetImage('assets/icons/house/wash.png'),
                      'Washing Machine',
                      'Bosch 7kg 5475'
                    )
                  ), 
                ]
              ),
              TableRow(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    child: _roundedButton(
                      Colors.deepOrange,
                      AssetImage('assets/icons/house/refrigerator.png'),
                      'Refrigerator',
                      'Whirlpool WR190'
                    )
                  ), 
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: _roundedButton(
                      Colors.lightBlue, 
                      AssetImage('assets/icons/house/router.png'),
                      'Router',
                      'TP - Link 078'
                    )
                  ), 
                ]
              ),
            ],
          ),
        ),
      ) 
    );

  }

  Widget _roundedButton(Color color, AssetImage icon, String text1, String text2) {

    return ClipRRect(
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ImageIcon(
              icon,
              size: 35,
            ),
            Text(text1, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
            Text(text2),
            _switch()
          ],
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30)
        ),
      ),
    );

  }

  Widget _switch() {

    return Container(
      height: 34,
      child: LiteRollingSwitch(
        colorOn: Colors.lightGreen,
        colorOff: Colors.black26,
        iconOn: Icons.done,
        iconOff: Icons.remove_circle_outline,
        textSize: 16,
        value: _turnOn,
        onChanged: (value) {
          _turnOn = value;
        },
      ),
    );

  }

}