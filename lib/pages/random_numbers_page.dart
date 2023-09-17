import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class RandomNumbersPage extends StatefulWidget {
  const RandomNumbersPage({super.key});

  @override
  State<RandomNumbersPage> createState() => _RandomNumbersPageState();
}

class _RandomNumbersPageState extends State<RandomNumbersPage> {
  int generatedNumber = 0;
  int clicksNumber = 0;
  late Box storage;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    if (Hive.isBoxOpen('box_random_numbers')) {
      storage = Hive.box('box_random_numbers');
    } else {
      storage = await Hive.openBox('box_random_numbers');
    }
    generatedNumber = storage.get('generated_number') ?? 0;
    clicksNumber = storage.get('total_clicks') ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gerador de número aleatórios"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            generatedNumber.toString(),
            style: const TextStyle(fontSize: 35),
          )),
          Center(
              child: Text(
            clicksNumber.toString(),
            style: const TextStyle(fontSize: 35),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var random = Random();
            setState(() {
              generatedNumber = random.nextInt(1000);
              clicksNumber++;
            });
            storage.put('generated_number', generatedNumber);
            storage.put('total_clicks', clicksNumber);
          },
          child: const Icon(
            Icons.add,
          )),
    );
  }
}
