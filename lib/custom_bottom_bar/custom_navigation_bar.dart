import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  final Function(int) currentSelectedItem;
  CustomNavigationBar({required this.currentSelectedItem});
  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_rounded),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedItem,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      onTap: (int currItem) {
        setState(() {
          selectedItem = currItem;
          widget.currentSelectedItem(currItem);
        });
      },
    );
  }
}
