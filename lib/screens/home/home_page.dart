import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../custom_bottom_bar/custom_navigation_bar.dart';
import 'item_list.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/passArguments';

  final Function(User?) onSignOut;
  HomePage({required this.onSignOut});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    widget.onSignOut(null);
  }

  int currentItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: currentItem == 1 ? Text('プロフィール') : Text('ホーム'),
        elevation: 0,
      ),
      body: currentItem == 1
          ? Profile(
              logout: logout,
            )
          : ItemList(),
      bottomNavigationBar: CustomNavigationBar(
        currentSelectedItem: (value) {
          setState(() {
            currentItem = value;
          });
        },
      ),
    );
  }
}
