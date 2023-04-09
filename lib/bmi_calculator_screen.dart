import 'package:flutter/material.dart';
import 'package:stacionar_app/deprecated_pages/meal_plan_screen.dart';
import 'package:stacionar_app/widgets/table.dart';

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
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            const Text(
              'Vyplnte svoji vysku a vahu:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _heightController,
                    decoration: const InputDecoration(
                      labelText: 'Vyska (cm)',
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
                      labelText: 'Vaha (kg)',
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
              child: const Text('Spocitat BMI'),
            ),
            SizedBox(height: 20),
            Text(
              'Vase hodnota BMI je ${_bmi.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 18),
            ),
            Table_Widget()
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
      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      _bmi = bmi;
    });
  }
}
