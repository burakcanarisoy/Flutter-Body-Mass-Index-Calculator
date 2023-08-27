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
        primarySwatch: Colors.red,
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // Function to calculate BMI
  double calculateBMI(double weight, double height) {
    return weight / (height * height);
  }

  // Variable to store the BMI result
  String bmiResult = '';
  // Text editing controllers for the height and weight input fields
  final TextEditingController boyController = TextEditingController();
  final TextEditingController kiloController = TextEditingController();
  // Function to reset the page and clear the input fields
  void resetPage() {
    boyController.clear();
    kiloController.clear();
    setState(() {
      bmiResult = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Body Mass Index Calculator',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: resetPage,
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/health.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50.0),
                // Input field for height
                TextField(
                    controller: boyController,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Enter your height (m): ',
                        filled: true,
                        fillColor: Colors.white)),
                const SizedBox(height: 50.0),
                // Input field for weight
                TextField(
                    controller: kiloController,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'Enter your weight (kg): ',
                        filled: true,
                        fillColor: Colors.white)),
                const SizedBox(height: 50.0),
                SizedBox(
                  width: 200.0,
                  height: 60.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      // Calculate BMI when the button is pressed
                      double bmi = calculateBMI(
                          double.parse(kiloController.text),
                          double.parse(boyController.text));
                      String result = bmi.toStringAsFixed(2);

                      setState(() {
                        // Determine BMI category based on the calculated BMI

                        if (bmi < 18.5) {
                          bmiResult = 'Your BMI is $result - Underweight';
                        } else if (bmi < 25) {
                          bmiResult = 'Your BMI is $result - Normal Weight';
                        } else if (bmi < 30) {
                          bmiResult = 'Your BMI is $result - Overweight';
                        } else if (bmi < 35) {
                          bmiResult = 'Your BMI is $result - Obesity Class I';
                        } else if (bmi < 40) {
                          bmiResult = 'Your BMI is $result - Obesity Class II';
                        } else {
                          bmiResult = 'Your BMI is $result - Obesity Class III';
                        }
                      });
                    },
                    child: const Text(
                      'Click to calculate your BMI!',
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                // Display the BMI result
                Text(
                  bmiResult,
                  style: const TextStyle(
                      fontSize: 27.0,
                      color: Colors.black,
                      backgroundColor: Colors.green),
                ),
              ],
            ),
          ),
        ));
  }
}
