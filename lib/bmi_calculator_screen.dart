import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your height and weight:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _heightController,
                    decoration: const InputDecoration(
                      labelText: 'Height (cm)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 20),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _weightController,
                    decoration: const InputDecoration(
                      labelText: 'Weight (kg)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBmi,
              child: const Text('Calculate BMI'),
            ),
            SizedBox(height: 20),
            Text(
              'Your BMI is ${_bmi.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateBmi() {
    final height =
        double.parse(_heightController.text) / 100; // convert cm to m
    final weight = double.parse(_weightController.text);
    final bmi = weight / (height * height);
    setState(() {
      _bmi = bmi;
    });
  }
}
