import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Card(
          color: Colors.blueGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child:Text("I am inside a card",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),) ,
          )

        ),
      )),
    );
  }
}