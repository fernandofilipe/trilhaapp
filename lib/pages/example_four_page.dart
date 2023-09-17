import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/app_images.dart';
import 'package:trilhaapp/shared/widgets/gauge.dart';

class ExampleFourPage extends StatefulWidget {
  const ExampleFourPage({super.key});

  @override
  State<ExampleFourPage> createState() => _ExampleFourPageState();
}

class _ExampleFourPageState extends State<ExampleFourPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 2,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Card(
                elevation: 8,
                child: Image.asset(AppImages.paisagem1),
              ),
              Card(
                elevation: 8,
                child: Image.asset(AppImages.paisagem2),
              ),
              Card(
                elevation: 8,
                child: Image.asset(AppImages.paisagem3),
              ),
            ],
          ),
        ),
        const Expanded(
          flex: 2,
          child: Card(child: Gauge()),
        ),
        Expanded(flex: 2, child: Container())
      ]),
    );
  }
}
