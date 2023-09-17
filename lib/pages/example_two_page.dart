import 'package:flutter/material.dart';
import 'package:trilhaapp/shared/app_images.dart';

class ExampleTwoPage extends StatefulWidget {
  const ExampleTwoPage({super.key});

  @override
  State<ExampleTwoPage> createState() => _ExampleTwoPageState();
}

class _ExampleTwoPageState extends State<ExampleTwoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppImages.user1,
          height: 50,
        ),
        Image.asset(
          AppImages.user2,
          height: 50,
        ),
        Image.asset(
          AppImages.user3,
          height: 50,
        ),
        Image.asset(
          AppImages.paisagem1,
          width: double.infinity,
        ),
        Image.asset(
          AppImages.paisagem2,
          width: double.infinity,
        ),
        Image.asset(
          AppImages.paisagem3,
          height: 50,
        ),
      ],
    );
  }
}
