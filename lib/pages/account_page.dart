import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Account page, By the way gaand fatt gai Navigation ki ma chodte chodte', style: TextStyle(
          fontSize: 25,
        ),),
      ),
    );
  }
}
