import 'package:flutter/material.dart';
import './result.dart';

const List<String> list = <String>['Male', 'Female', 'Other'];

void main() {
  runApp(MaterialApp(
    home: bmi(),
    initialRoute: '/',
    // routes: {'/result': (context) => Result()},
  ));
}

class bmi extends StatefulWidget {
  const bmi({Key? key}) : super(key: key);

  @override
  State<bmi> createState() => _bmiState();
}

class _bmiState extends State<bmi> {
  String dropdownValue = list.first;

  final nameController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final genderController = TextEditingController();

  final weightFocus = FocusNode();
  final heightFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BMI',
                      style: TextStyle(
                          fontSize: 38,
                          color: Colors.blue,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      'Calculator',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ))),
        body: Column(
          children: [
            Form(
                child: Expanded(
                    child: ListView(
              padding: EdgeInsets.only(top: 150, left: 20, right: 20),
              children: [
                TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter your name',
                      // hintText: 'Enter a message',
                      suffixIcon: IconButton(
                        onPressed: nameController.clear,
                        icon: Icon(Icons.clear),
                      ),
                    ),
                    controller: nameController,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(weightFocus);
                    }),
                SizedBox(height: 50),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Weight (in kg) ',
                    suffixIcon: IconButton(
                      onPressed: weightController.clear,
                      icon: Icon(Icons.clear),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  focusNode: weightFocus,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(heightFocus);
                  },
                ),
                SizedBox(height: 50),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Height (in cm)',
                    suffixIcon: IconButton(
                      onPressed: heightController.clear,
                      icon: Icon(Icons.clear),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  focusNode: heightFocus,
                ),
                SizedBox(height: 50),
                Container(
                    child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )),
                SizedBox(height: 50),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      child: Text('Calculate'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Result(
                                  name: nameController.text.toString(),
                                  weight: weightController.text.toString(),
                                  height: heightController.text.toString(),
                                  gender: dropdownValue.toString())),
                        );
                      }),
                )
              ],
            )))
          ],
        ));
  }
}
