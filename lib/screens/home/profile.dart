import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final Function logout;
  Profile({required this.logout});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          logout();
        },
        child: Text(
          'ログアウト',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
