import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var wtController = TextEditingController();
  var htController = TextEditingController();
  var result = 0.0;
  var msg='';

  void calculate() {
    if (wtController.text.isEmpty || htController.text.isEmpty) {
      return;
    }

    double height = double.parse(htController.text.toString());
    double weight = double.parse(wtController.text.toString());

    result = (weight / (height * height)).toDouble();

    if(result>=18.5 && result <25 ){
      msg='You are Healthy, Keep it up!';
    }
    else if (result < 18.5) {
      msg='You are Under Weight!';
    }
    else if (result >= 25 && result <30) {
      msg='You are Over Weight!';
    }
    else{
      msg='You are Obese,Take Care!';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
        ),
        backgroundColor: const Color.fromARGB(255, 156, 192, 222),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 360,
                child: InputDesign('Enter your weight in KGs', wtController,
                    Icon(Icons.line_weight)),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                  width: 360,
                  child: InputDesign('Enter your height in meter', htController,
                      Icon(Icons.height))),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      elevation: 11,
                      shadowColor: const Color.fromARGB(255, 120, 144, 163)),
                  onPressed: () {
                    calculate();
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                    ),
                  )),
              SizedBox(
                height: 15,
              ),
              Text(
                '$msg\n${result.toStringAsPrecision(3)}',
                style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InputDesign extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Icon prefixIcon;

  InputDesign(this.hintText, this.controller, this.prefixIcon);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.numberWithOptions(),
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixIconColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 156, 192, 222),
              )),
          label: Text(hintText),
          labelStyle: TextStyle(color: Colors.grey)),
    );
  }
}
