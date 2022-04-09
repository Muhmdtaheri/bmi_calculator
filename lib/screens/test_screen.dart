import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class TapTest extends StatefulWidget {
  const TapTest({Key? key}) : super(key: key);

  @override
  State<TapTest> createState() => _TapTestState();
}

class _TapTestState extends State<TapTest> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text(
                  '$counter',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter = counter + 1;
                    });
                  },
                  child: Text('increase'),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      counter = counter - 1;
                    });
                  },
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Text('decrease'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
