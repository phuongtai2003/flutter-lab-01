import 'package:flutter/material.dart';
import 'package:units_converter/units_converter.dart';

class Exercise04 extends StatelessWidget {
  const Exercise04({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercise 04',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
        ),
        useMaterial3: false,
      ),
      home: const Exercise04App(),
    );
  }
}

class Exercise04App extends StatefulWidget {
  const Exercise04App({
    super.key,
  });

  @override
  State<Exercise04App> createState() => _Exercise04AppAppState();
}

class _Exercise04AppAppState extends State<Exercise04App> {
  final numberBaseController = TextEditingController();
  String binaryText = 'Binary';
  String hexadecimalText = 'Hexadecimal';
  String octalText = 'Octal';

  @override
  void initState() {
    numberBaseController.addListener(() {
      if (numberBaseController.text.isEmpty) {
        print(numberBaseController.text.isEmpty);
        setState(() {
          binaryText = 'Binary';
          hexadecimalText = 'Hexadecimal';
          octalText = 'Octal';
        });
        return;
      }
      setState(() {
        binaryText =
            '${numberBaseController.text.convertFromTo(NUMERAL_SYSTEMS.decimal, NUMERAL_SYSTEMS.binary)}';
        hexadecimalText =
            '${numberBaseController.text.convertFromTo(NUMERAL_SYSTEMS.decimal, NUMERAL_SYSTEMS.hexadecimal)}';
        octalText =
            '${numberBaseController.text.convertFromTo(NUMERAL_SYSTEMS.decimal, NUMERAL_SYSTEMS.octal)}';
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    numberBaseController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          title: const Text(
            'Number Base Converter',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: numberBaseController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Decimal',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                binaryText,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                hexadecimalText,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                octalText,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
