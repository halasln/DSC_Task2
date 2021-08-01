import 'package:dsc_bmi/function/bmicalcul.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultPage extends StatefulWidget {
  ResultPage(this.result, this.msg, this.desc);
  String result;
  String msg;
  String desc;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool selected = false;
  Color c = Color(0xff575269);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(
            color: Color(0xff565168),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: AnimatedContainer(
                padding: selected ? EdgeInsets.all(40.0) : EdgeInsets.all(10.0),
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      BmiCalcul(115, 173).getMsg(
                        double.parse(widget.result),
                      ),
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      widget.result,
                      style: TextStyle(
                        color: c,
                        fontSize: 66.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'BMI range :',
                      style: TextStyle(
                        color: Color(0xff848c9b),
                        fontSize: 22.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      BmiCalcul(115, 173).getDescripition(
                        double.parse(widget.result),
                      ),
                      style: TextStyle(
                        color: c,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff673ab7),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              margin: EdgeInsets.all(10.0),
              width: double.infinity,
              height: 60.0,
              child: Center(
                child: Text(
                  'RE-CALCULATE YOUR BMI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
