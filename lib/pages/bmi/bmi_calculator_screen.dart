import 'package:flutter/material.dart';
import 'package:stacionar_app/utils/app_theme.dart';

import 'package:stacionar_app/pages/bmi/bmi_gauge_arrow_component.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmi = 0.00;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'Vyplňte svoji výšku a váhu :',
              style: CustomTheme.h4,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: TextField(
                      controller: _heightController,
                      decoration: const InputDecoration(
                        labelText: 'Výška (cm)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true)),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 100,
                  child: TextField(
                      controller: _weightController,
                      decoration: const InputDecoration(
                        labelText: 'Váha (kg)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBmi,
              child: const Text('Spočítat BMI'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: _bmi == 0
                      ? const AssetImage('assets/icons/empty.png')
                      : _bmi < 18.50
                          ? const AssetImage('assets/icons/bmi_neutral.png')
                          : _bmi >= 18.50 && _bmi <= 24.9
                              ? const AssetImage('assets/icons/bmi_good.png')
                              : _bmi >= 25.0 && _bmi <= 29.9
                                  ? const AssetImage('assets/icons/bmi_bad.png')
                                  : const AssetImage(
                                      'assets/icons/bmi_sad.png'),
                  width: 100,
                  height: 100,
                ),
                Expanded(
                  child: Container(
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
                      child: Text(
                        textAlign: TextAlign.center,
                        'Vaše hodnota BMI je \n${_bmi.toStringAsFixed(1)}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color:
                              _bmi == 0.0 ? Colors.transparent : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      _bmi == 0
                          ? ''
                          : _bmi < 18.5
                              ? 'Ješte \nkousek'
                              : _bmi >= 18.5 && _bmi <= 24.9
                                  ? 'Paráda'
                                  : _bmi >= 25.0 && _bmi <= 29.9
                                      ? 'Co \ns tim?'
                                      : 'Pozor!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: _bmi == 0.0 ? Colors.transparent : Colors.black,
                      )),
                ),
              ],
            ),
            // const SizedBox(height: 40),
            // const Text(
            //   'Mějte s pomocí přehledných tabulek povědomí o své hodnotě BMI',
            //   style: MyTextStyles.bodyText1,
            //   textAlign: TextAlign.center,
            // ),
            GaugeArrowAnimation(
              value: _bmi,
            ),
          ],
        ),
      ),
    );
  }

  void _calculateBmi() {
    final height =
        _parseDouble(_heightController.text) / 100; // convert cm to m
    final weight = _parseDouble(_weightController.text);
    final bmi = weight / (height * height);
    setState(() {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      _bmi = bmi.toString() == 'NaN' ? 0.0 : bmi;
    });
  }

  double _parseDouble(String value) {
    // replace any commas with periods, then parse the string to a double
    return double.parse(value.replaceAll(',', '.'));
  }
}
