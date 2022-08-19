import 'package:coffee/utility/coffeetile.dart';
import 'package:coffee/utility/coffeetype.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types
  final List coffeeTypes = [
    //[coffee type , isSelected]
    ['Cappuccino', true],
    ['Latte', false],
    ['Milk Coffee', false],
    ['Black Coffee', false]
  ];

  //user tapped on coffee types

  void coffeeTypeSelected(index) {
    setState(() {
      for (int i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = false;
      }
      coffeeTypes[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
      ]),
      body: Column(
        children: [
          // find the best coffee for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text('Find the best coffee for you',
                style: GoogleFonts.bebasNeue(fontSize: 56)),
          ),
          // search bar
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                ),
                hintText: 'Find your Coffee.....',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),

          // horizontal listview of coffee types
          Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeTypes.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                        typecoffee: coffeeTypes[index][0],
                        isSelected: coffeeTypes[index][1],
                        onTap: () {
                          coffeeTypeSelected(index);
                        });
                  })),
          //horizontal listview of coffee tiles

          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CoffeeTile(
                imagePath: 'assets/images/capucino.jpg',
                coffeename: 'Cappuccino',
                coffeetypee: 'With Almond',
                price: '\$4.00',
              ),
              CoffeeTile(
                imagePath: 'assets/images/latte.jpg',
                coffeename: 'Latte',
                coffeetypee: 'With Dry Fruits',
                price: '\$7.00',
              ),
              CoffeeTile(
                imagePath: 'assets/images/milkcoffee.jpg',
                coffeename: 'Milk Coffee',
                coffeetypee: 'With Cardamon',
                price: '\$3.00',
              ),
              CoffeeTile(
                imagePath: 'assets/images/capucino.jpg',
                coffeename: 'Cappuccino',
                coffeetypee: 'With Almond',
                price: '\$4.00',
              ),
              CoffeeTile(
                imagePath: 'assets/images/latte.jpg',
                coffeename: 'Latte',
                coffeetypee: 'With Dry Fruits',
                price: '\$7.00',
              ),
              CoffeeTile(
                imagePath: 'assets/images/milkcoffee.jpg',
                coffeename: 'Milk Coffee',
                coffeetypee: 'With Cardamon',
                price: '\$3.00',
              ),
            ],
          ))
        ],
      ),
    );
  }
}
