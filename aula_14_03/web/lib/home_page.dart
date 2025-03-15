import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: deviceWidth,
        child: Row(
          children: [
            Container(color: Colors.amber, width: deviceWidth * 0.2),
            Container(),
          ],
        ),
      ),
    );
  }
}
