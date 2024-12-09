import 'package:flutter/material.dart';
import 'package:listview_class/common/my_card.dart';


class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 1; i < 10; i++) ...{
                MyCard(
                  title: 'Card $i',
                  color: i % 2 == 0 ? Colors.blue : Colors.amber,
                )
              }
            ],
          ),
        ),
      ),
    );
  }
}