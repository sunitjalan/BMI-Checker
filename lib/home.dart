import 'package:flutter/services.dart';
import 'left_bar.dart';
import 'right_bar.dart';
import 'app_constants.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0.0;
  String _textResult ="";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Checker",
          style: TextStyle(
            color: accentColor,
            fontWeight: FontWeight.w400,
            fontSize: 30,

          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainColor,
      body: SingleChildScrollView(
        child: Column(
          children:[
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black54,
                      width: 3,
                    ),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _heightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w400,
                      color: accentColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height(m)",
                      hintStyle: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ), //Height
                Container(
                  width: 130,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black54,
                      width: 3,
                    ),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w400,
                      color: accentColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight(kg)",
                      hintStyle: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.8),

                      ),
                    ),
                  ),
                ) //Weight
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: (){
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult= _w / (_h * _h);
                  if(_bmiResult > 25){
                    _textResult= "Overweight";
                  }
                  else if(_bmiResult >= 18.5 && _bmiResult<=25){
                    _textResult= "Normal";
                  }
                  else{
                    _textResult = "Underweight";
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black54,
                    width: 8,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
              ), //Calculate
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 100,
                  color: accentColor,
                ),
              ),
            ), //Result
            const SizedBox(
              height: 20,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
              child: Text(
                _textResult,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: accentColor,
                ),
              ),
            ), //TextResult
            ),
            const SizedBox(height: 10,),
            const LeftBar(barWidth: 40),
            const SizedBox(height: 5,),
            const LeftBar(barWidth: 70),
            const SizedBox(height: 5,),
            const LeftBar(barWidth: 30),
            const SizedBox(height: 10,),
            const RightBar(barWidth: 60),
            const SizedBox(height: 10,),
            const RightBar(barWidth: 100),
            const SizedBox(height: 10,),
            const RightBar(barWidth: 40),
          ],
        ),
      ),
    );
  }
}