import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class SecondPage extends StatelessWidget{
  double bmi;
  SecondPage({required this.bmi,});
      @override
      Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.grey,
            appBar: AppBar(
              title: Text("Result", style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.black,
            ),

            body:
            Center(

            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      bmi == null ? "Enter Value" : "Your BMI is: ${bmi.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      )),
                  if (18.5 < bmi ) ...[
                    if (bmi < 24.9) ...[
                      Text("You are healthy.",
                        style: TextStyle(
                            color: Colors.green[900],
                            fontSize: 40
                        ),)
                    ]
                  ],
                  if (18.5 > bmi)...[
                    Text("You are underweight.",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 40
                      ),)
                  ],
                  if (bmi > 24.9) ...[
                    Text("You are overweight.",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 40)
                    )
                  ],
                  RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                  ),
        onRatingUpdate: (rating) {
        print(rating);
        },
        )

                ]
            )
            )
        );
      }

}



















