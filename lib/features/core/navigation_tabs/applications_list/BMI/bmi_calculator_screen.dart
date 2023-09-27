import 'package:flutter/material.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/BMI/bmi_gauge_arrow_component.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';
import 'package:stacionar_app/shared/widgets/contrained_container.dart';
import 'package:stacionar_app/shared/widgets/disclaimer_text_widget.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmi = 0.00;
  String disclaimer =
      'Prosím berte na vědomí, že zdravotní, výživová či léčebná tvrzení jsou v rámci legislativy EU výrazně omezena. Při tvorbě článků smíme vycházet pouze ze schválených tvrzení, která uvádí platná legislativa.';
  String bmiDescription =
      'Body Mass Index neboli index tělesné hmotnosti (BMI) vyjadřuje vztah mezi tělesnou hmotností a tělesnou výškou. Nezohledňuje nic jiného a pouze naznačuje, jak jste na tom z hlediska těchto dvou parametrů';
  String bmiDescription2 =
      'U konkrétního jednotlivce je BMI příliš jednoduchým prostředkem, který ignoruje velké množství důležitých faktorů';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Vyplňte svoji výšku a váhu :',
          style: context.textTheme.bodyLarge,
        ),
      ),
      body: ConstrainedContainer(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      child: TextField(
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        style: context.textTheme.bodyMedium,
                        controller: _heightController,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelStyle: context.textTheme.bodySmall?.apply(fontSizeFactor: 1.2),
                          labelText: 'Výška (cm)',
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        style: context.textTheme.bodyMedium,
                        controller: _weightController,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          labelStyle: context.textTheme.bodySmall?.apply(fontSizeFactor: 1.2),
                          labelText: 'Váha(kg)',
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 20),
                  ),
                  onPressed: _calculateBmi,
                  child: Text(
                    'Spočítat BMI',
                    style: context.textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image(
                        image: _bmi == 0
                            ? const AssetImage('assets/icons/empty.png')
                            : _bmi < 18.50
                                ? const AssetImage('assets/icons/bmi_neutral.png')
                                : _bmi >= 18.50 && _bmi <= 24.9
                                    ? const AssetImage('assets/icons/bmi_good.png')
                                    : _bmi >= 25.0 && _bmi <= 29.9
                                        ? const AssetImage('assets/icons/bmi_bad.png')
                                        : const AssetImage('assets/icons/bmi_sad.png'),
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Expanded(
                      flex: 3,
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
                            'Vaše hodnota BMI je \n${_bmi.toStringAsFixed(1)}',
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            _bmi == 0
                                ? ''
                                : _bmi < 18.5
                                    ? 'Ješte kousek'
                                    : _bmi >= 18.5 && _bmi <= 24.9
                                        ? 'Paráda'
                                        : _bmi >= 25.0 && _bmi <= 29.9
                                            ? 'Co s tim?'
                                            : 'Pozor!',
                            textAlign: TextAlign.center,
                            style: context.textTheme.bodyLarge?.copyWith(color: _bmi == 0.0 ? Colors.transparent : Colors.black)),
                      ),
                    ),
                  ],
                ),
                BmiGaugeArrowAnimation(
                  value: _bmi,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            context: context,
            builder: (context) {
              return SizedBox(
                height: 350,
                child: Column(
                  children: [
                    DisclaimerText(disclaimer: 'Co je BMI? \n$bmiDescription\n$bmiDescription2\n$disclaimer'),
                  ],
                ),
              );
            },
          );
        },
        label: Text(
          'Co je BMI?',
          style: context.textTheme.bodyMedium,
        ),
        icon: const Icon(Icons.info),
      ),
    );
  }

  void _calculateBmi() {
    final height = _parseDouble(_heightController.text) / 100; // convert cm to m
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
    return double.parse(
      value.replaceAll(',', '.'),
    );
  }
}
