import 'package:bmi_app/constants/app_constants.dart';
import 'package:bmi_app/widgets/left_bar.dart';
import 'package:bmi_app/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _heightcontroller = TextEditingController();
  final TextEditingController _weightcontroller = TextEditingController();
  double _bmiResult = 0;
  String _textResult = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 130,
                child: TextField(
                  controller: _heightcontroller,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                      fontSize: 38),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 38)),
                ),
              ),
              SizedBox(
                width: 130,
                child: TextField(
                  controller: _weightcontroller,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                      fontSize: 38),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 38)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              double _h = double.parse(_heightcontroller.text);
              double _w = double.parse(_weightcontroller.text);
              setState(() {
                _bmiResult = (_w / (_h * _h));
                if (_bmiResult > 30) {
                  _textResult = 'You\'re obese';
                } else if (_bmiResult >= 25 && _bmiResult <= 30) {
                  _textResult = 'You\'re overweight';
                } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                  _textResult = 'You have normal weight';
                } else {
                  _textResult = 'You\'re underweight';
                }
              });
            },
            style: ElevatedButton.styleFrom(
              primary: accentHexColor,
              onPrimary: mainHexColor,
            ),
            child: const Text('Calculate', style: TextStyle(fontSize: 22)),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Value pair required: m,kg or inches,lbs',
            style: TextStyle(
              fontSize: 14,
              color: accentHexColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            _bmiResult.toStringAsFixed(2),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: accentHexColor,
                fontSize: 90),
          ),
          const SizedBox(
            height: 50,
          ),
          Visibility(
            visible: _textResult.isNotEmpty,
            child: Text(
              _textResult,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: accentHexColor,
                  fontSize: 32),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const RightBar(barWidth: 40),
          const SizedBox(
            height: 20,
          ),
          const RightBar(barWidth: 70),
          const SizedBox(
            height: 20,
          ),
          const RightBar(barWidth: 40),
          const SizedBox(
            height: 40,
          ),
          const LeftBar(barWidth: 70),
          const SizedBox(
            height: 40,
          ),
          const LeftBar(barWidth: 70),
        ]),
      ),
    );
  }
}
