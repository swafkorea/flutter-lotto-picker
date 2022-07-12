import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final int maxCount;
  const SettingsScreen({
    Key? key,
    required this.maxCount,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxCount = 5;

  @override
  void initState() {
    super.initState();
    maxCount = widget.maxCount.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(children: [
          Expanded(
            child: Center(
              child: Text(
                '${maxCount.toInt()}',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Slider(
            value: maxCount,
            min: 1,
            max: 10,
            onChanged: (value) {
              setState(() {
                maxCount = value;
              });
            },
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                Navigator.of(context).pop(maxCount.toInt());
              },
            ),
          )
        ]),
      ),
    );
  }
}
