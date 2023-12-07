import 'package:flutter/material.dart';

class Expand extends StatefulWidget {
  const Expand({Key? key}) : super(key: key);

  @override
  State<Expand> createState() => _ExpandState();
}

class _ExpandState extends State<Expand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 2,
                child:Container(
                  color: Colors.purple,
                )
            ),
            Expanded(
              flex: 1,
                child:Container(
                  color: Colors.blue,
                )
            ),
          ],
        ),
      ),
    );
  }
}
