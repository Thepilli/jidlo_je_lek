import 'package:flutter/material.dart';
import 'package:stacionar_app/utils/app_theme.dart';
import 'package:stacionar_app/deprecated_pages/meal_plan_screen.dart';
import 'package:stacionar_app/utils/mytextstyles.dart';
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
              style: CustomTheme.display1,
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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: _bmi == 0
                    ? Colors.transparent
                    : _bmi < 18.5
                        ? Colors.blue[300]
                        : _bmi >= 18.5 && _bmi <= 24.9
                            ? Colors.green[300]
                            : _bmi >= 25.0 && _bmi <= 29.9
                                ? Colors.orange[300]
                                : Colors.red[300],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Vase hodnota BMI je ${_bmi.toStringAsFixed(1)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: _bmi == 0.0 ? Colors.transparent : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Mějte s pomocí přehledných tabulek povědomí o své hodnotě BMI',
              style: MyTextStyles.bodyText1,
              textAlign: TextAlign.center,
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
