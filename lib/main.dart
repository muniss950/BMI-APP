import 'dart:math';
import 'package:flutter/material.dart';
import 'package:first_app/Second_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 175;
  int weight = 75;
  double bmi = 24.5;


  void add() {
    setState(() {
      weight++;
    });
  }

  void minus() {
    setState(() {
      if (weight != 0) weight--;
    });
  }
  void BMI(){
    setState(() {
      bmi = (weight / pow(height / 100, 2));

    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(

        title: Text("BMI Calculator",
        style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      body:
        Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 500,
            color: Colors.grey,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      side: BorderSide(width: 2, color: Colors.black),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Enter your weight in kgs:  ',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  ElevatedButton(   // for decrement in mass
                    child:
                    Text("-".toUpperCase(), style: TextStyle(fontSize: 25)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(15)),
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.black)))),
                    onPressed: minus,
                  ),
                  Text('$weight',
                      style: TextStyle(fontSize: 60.0, color: Colors.black)),
                  ElevatedButton(    //for increment in mass
                    child:
                    Text("+".toUpperCase(), style: TextStyle(fontSize: 25)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(15)),
                        foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                        shape:
                        MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.black)))),
                    onPressed: add,
                  )
                ]),
          ),
          Container(    // height button with slider
              height: 90,
              width: 500,
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height in cms : ${height.round()}",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                  Slider(
                      value: height,
                      min: 140,
                      max: 240,
                      activeColor: Colors.black,
                      inactiveColor: Colors.black12,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                          print(height);
                        });
                      })
                ],
              )),




          TextButton(              // calculate button
            child: Text(
                "Calculate"),
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.all(15)),
                foregroundColor:
                MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.black),
                shape:
                MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.grey)))


            ),

              onPressed: () {BMI();
                Navigator.push(context,MaterialPageRoute(builder: (BuildContext) {return SecondPage(bmi:bmi,);} ),);
                  },
          ),
          SizedBox(height: 15),


        ],
      )
        )



    );
  }
}
