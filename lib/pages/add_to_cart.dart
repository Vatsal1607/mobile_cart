import 'package:flutter/material.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Cart is empty currently PENCHO', style: TextStyle(
          fontSize: 25,
        ),),
      ),
    );
  }
}
