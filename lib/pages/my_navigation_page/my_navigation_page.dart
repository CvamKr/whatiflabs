import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:whatiflabs/pages/tasks_page/tasks_page.dart';
import 'package:whatiflabs/services/string_const.dart';

import '../../services/widgets/my_text.dart';
import '../all_chats_page/all_chats_page.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    ChatsPage(),
    TasksPage(),
    Center(
      child: Text('Ticket Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _widgetOptions),
      bottomNavigationBar: BottomNavigationBar(

          // backgroundColor: Colors.grey,

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: navItem(Icons.chat, "Chats", 0, badgeCount: 2), label: ""
                // backgroundColor: Colors.green
                ),
            BottomNavigationBarItem(
                icon: navItem(Icons.check_circle_outline, "Tasks", 1,
                    badgeCount: 3),
                label: ""

                // backgroundColor: Colors.grey,
                ),
            BottomNavigationBarItem(
                icon: navItem(Icons.airplane_ticket, "Tickets", 2), label: ""

                // backgroundColor: Colors.blue,
                ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: colorPrimary,
          selectedIconTheme: IconThemeData(color: colorPrimary),
          // iconSize: 40,
          // selectedFontSize: 16,
          // unselectedFontSize: 12,

          onTap: _onItemTapped,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          // sele

          elevation: 12),
    );
  }

  Widget navItem(IconData icon, String label, currentIndex, {badgeCount = 0}) {
    return Container(
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          badgeCount == 0
              ? Icon(icon)
              : Badge(
                  toAnimate: false,
                  // shape: BadgeShape.circle,
                  child: Icon(icon),
                  badgeColor: _selectedIndex == currentIndex
                      ? colorPrimary
                      : Colors.grey,
                  position: BadgePosition.topEnd(top: -13, end: -3),
                  borderRadius: BorderRadius.circular(8),
                  badgeContent:
                      myText(txt: badgeCount.toString(), color: Colors.white),
                ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Stack(
          //     children: [
          //       Icon(icon),
          //       Positioned(
          //           top: -1,
          //           right: 2,
          //           child: Container(
          //               height: 13,
          //               width: 13,
          //               decoration: BoxDecoration(
          //                 color: colorPrimary,
          //                 shape: BoxShape.circle,
          //               ),
          //               child: Center(
          //                   child: myText(txt: "2", color: Colors.white)))),
          //     ],
          //   ),
          // ),
          SizedBox(
            width: 5,
          ),
          // Text("chi")
          myText(
              txt: label,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color:
                  _selectedIndex == currentIndex ? colorPrimary : Colors.grey)
        ],
      ),
    );
  }
}
