// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CoffeeTitle extends StatelessWidget {
  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrice;

  CoffeeTitle({
    required this.coffeeImagePath,
    required this.coffeeName,
    required this.coffeePrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25),
      child: Container(
        padding: EdgeInsets.all(20),
        width: 200,
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Coffee image
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(coffeeImagePath)),

            // coffee name
            // ignore: prefer_const_constructors
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 8.0),
              child: Column(
                children: [
                  Text(
                    coffeeName,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'with Almond milk',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$' + coffeePrice),
                  Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(Icons.add)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
