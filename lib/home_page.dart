// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:coffee_app/util/coffee_tile.dart';
import 'package:coffee_app/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class HOmePage extends StatefulWidget {
  const HOmePage({Key? key}) : super(key: key);

  @override
  State<HOmePage> createState() => _HOmePageState();
}

class _HOmePageState extends State<HOmePage> {
  // list of coffee types
  final List coffeeType = [
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];

  // user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      // this for loop makes every selection false
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        // ignore: prefer_const_constructors
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        // ignore: prefer_const_constructors
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        // ignore: prefer_const_constructors
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '',
        ),
      ]),
      body: Column(
        children: [
          // find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'find the best coffee for you',
              style: GoogleFonts.bebasNeue(
                fontSize: 56.0,
              ),
            ),
          ),

          SizedBox(height: 25),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee..',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),

          SizedBox(height: 25),
          // horizontal listview of caffee types
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),

          // horizontal listview of coffee tiles
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTitle(
                coffeeImagePath: 'lib/images/llatto.png',
                coffeeName: 'Latte',
                coffeePrice: '4.20',
              ),
              CoffeeTitle(
                coffeeImagePath: 'lib/images/cappuccino.png',
                coffeeName: 'Cappucino',
                coffeePrice: '5.20',
              ),
              CoffeeTitle(
                coffeeImagePath: 'lib/images/lattoo.png',
                coffeeName: 'Milk coffee',
                coffeePrice: '4.10',
              ),
            ],
          )),
        ],
      ),
    );
  }
}
