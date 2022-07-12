import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lotto_picker/screens/settings.screen.dart';

import 'package:lotto_picker/shared/widgets/number-bundle.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<int>> package = [];
  int maxCount = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Lotto Picker'),
                IconButton(
                  onPressed: onGotoSettings,
                  icon: const Icon(Icons.settings),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: package
                    .map(
                      (e) => NumberBundle(numbers: e),
                    )
                    .toList(),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: generateBundle,
                child: const Text('Pick!'),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<int> generateSet() {
    final rand = Random();
    final numberSet = <int>{};

    while (numberSet.length < 6) {
      final number = rand.nextInt(45) + 1;
      numberSet.add(number);
    }

    final list = numberSet.toList();
    list.sort();

    return list;
  }

  void generateBundle() {
    final numbers = <List<int>>{};

    while (numbers.length < maxCount) {
      final list = generateSet();
      numbers.add(list);
    }

    setState(() {
      package = numbers.toList();
    });
  }

  void onGotoSettings() async {
    final changedMax = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SettingsScreen(maxCount: maxCount),
      ),
    );

    if (changedMax != null) {
      setState(() {
        maxCount = changedMax;
      });
      generateBundle();
    }
  }
}
