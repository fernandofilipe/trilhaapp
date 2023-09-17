import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/example_four_page.dart';
import 'package:trilhaapp/pages/example_one_page.dart';
import 'package:trilhaapp/pages/example_three_page.dart';
import 'package:trilhaapp/pages/example_two_page.dart';
import 'package:trilhaapp/pages/task_page.dart';
import 'package:trilhaapp/shared/widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int pagePosition = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Main Page"),
        ),
        drawer: const CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (pos) {
                  setState(() {
                    pagePosition = pos;
                  });
                },
                children: const [
                  ExampleOnePage(),
                  ExampleTwoPage(),
                  ExampleThreePage(),
                  ExampleFourPage(),
                  TaskPage(),
                ],
              ),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  _pageController.jumpToPage(value);
                },
                currentIndex: pagePosition,
                items: const [
                  BottomNavigationBarItem(
                    label: "Page One",
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: "Page Two",
                    icon: Icon(Icons.filter_list),
                  ),
                  BottomNavigationBarItem(
                    label: "Page Three",
                    icon: Icon(Icons.list),
                  ),
                  BottomNavigationBarItem(
                    label: "Page Four",
                    icon: Icon(Icons.image_search),
                  ),
                  BottomNavigationBarItem(
                    label: "Tasks",
                    icon: Icon(Icons.task_outlined),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}
