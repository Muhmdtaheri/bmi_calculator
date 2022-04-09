import 'package:bmi_calculator/widgets/background_shape_left.dart';
import 'package:bmi_calculator/widgets/background_shape_right.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  double resultBMI = 0;
  String resultText = '';
  double widthGreen = 100.0;
  double widthRed = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          ' تو محاسبه کن BMI',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: darkBackground,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130.0,
                  child: TextField(
                    controller: weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'وزن',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130.0,
                  child: TextField(
                    controller: heightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'قد',
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            InkWell(
              onTap: () {
                final weight = double.parse(weightController.text);
                final height = double.parse(heightController.text);

                setState(() {
                  resultBMI = weight / (height * height);
                  if (resultBMI > 25) {
                    resultText = 'شما اضافه وزن دارید';
                    widthRed = 250;
                    widthGreen = 50;
                  } else if (resultBMI >= 18.5 && resultBMI <= 25) {
                    resultText = 'وزن شما ایده آل است';
                    widthRed = 50;
                    widthGreen = 250;
                  } else {
                    resultText = 'شما کمبود وزن دارید';
                    widthRed = 150;
                    widthGreen = 50;
                  }
                });
              },
              child: Text(
                ' ! محاسبه کن',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              '${resultBMI.toStringAsFixed(2)}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 70,
              ),
            ),
            Text(
              '$resultText',
              style: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 80.0,
            ),
            LeftShape(
              width: widthGreen,
            ),
            SizedBox(
              height: 15.0,
            ),
            RightShape(
              width: widthRed,
            )
          ],
        ),
      ),
    );
  }
}
