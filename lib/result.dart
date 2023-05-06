import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  // static const routename = '/result';

  final String name;
  final String weight;
  final String height;
  final String gender;

  Result(
      {required this.name,
      required this.weight,
      required this.height,
      required this.gender});

  late var h = int.parse(height);
  late var hInM = h / 100;
  late var hString = hInM.toString();
  late var wgt = double.parse(weight);
  late var hgt = double.parse(hString);

  late var result = wgt / (hgt * hgt);

  String val(double result) {
    if (result < 18.5) {
      return 'Underweight';
    } else if (result >= 18.5 && result <= 24.9) {
      return 'Normal';
    } else if (result >= 25 && result <= 29.0) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  String advise(double result) {
    if (result < 18.5) {
      return 'Eating more frequently.Slowly begin to eat 5 to 6 smaller meals during the day.Exercise.';
    } else if (result >= 18.5 && result <= 24.9) {
      return 'You have a normal BMI. The only recommendation is to keep up with good eating, exercise, and restful sleep.';
    } else if (result >= 25 && result <= 29.0) {
      return 'Eat a balanced, calorie-controlled diet.Take up activities such as fast walking, jogging, swimming or tennis.';
    } else {
      return 'Eat healthy foods.Encourage eating slowly and only when hungry.Incorporate fun and exciting physical activity';
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculated Result',
          style: TextStyle(color: Colors.blueGrey),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Container(
          width: 400,
          height: 600,
          // decoration: BoxDecoration(border: Border.all()),
          margin: EdgeInsets.all(45),
          child: Column(
            children: [
              Text("BMI Score",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 17,
                      fontWeight: FontWeight.w500)),
              SizedBox(height: 50),
              Text(result.toStringAsFixed(2),
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 50,
                      fontWeight: FontWeight.w600)),
              SizedBox(height: 10),
              Text(val(result),
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              Container(
                // alignment: Alignment.center,
                margin: EdgeInsets.only(left: 70, right: 70, top: 60),
                // decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Name',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 17,
                                fontWeight: FontWeight.w500)),
                        Text(name)
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Gender',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 17,
                                fontWeight: FontWeight.w500)),
                        Text(gender)
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Height',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 17,
                                fontWeight: FontWeight.w500)),
                        Text(height)
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Weight',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 17,
                                fontWeight: FontWeight.w500)),
                        Text(weight)
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                // height: 100,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(236, 255, 220, 1),
                    border: Border.all(color: Colors.lightGreen, width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Note :',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                    Text(advise(result),
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 17,
                            fontWeight: FontWeight.w400))
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.lightGreen)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Go Back',
                          style: TextStyle(
                            fontSize: 18,
                          )))),

            ],
          )),
    );
  }
}
