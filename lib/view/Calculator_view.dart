import 'package:flutter/material.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView.count(
          padding: const EdgeInsets.all(8),
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: [
            for (int i = 1; i <= 10; i++) ...{
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.black),
                  child: Text('$i', style: const TextStyle(fontSize: 50)),
                ),
              )
            }
          ],
        ),
      ),
    );
  }
}