import 'package:flutter/material.dart';
import 'package:minto/tablebooking.dart';
import 'package:minto/tableselection.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  static const List<String> _menuItems = [
    'Coffee',
    'Tea',
    'Cake',
    'Cupcake',
    'Shawarma',
    'Egg samosa',
    'Veg-samosa',
    'Sandwich',
    'Burger',
    'Vada',
    'Drinks',
    'Meals',
    'Biryani',
    'Lime',
    'Mandhi',
    'Curry',
    'Chinese'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _menuItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Row(
              children: [
                Expanded(
                  child: Text(_menuItems[index]),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              OrderConfirmationScreen(item: _menuItems[index])),
                    );
                  },
                  child: const Text('Select'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({Key? key, required this.item})
      : super(key: key);

  final String item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Confirmation'),
        backgroundColor: const Color(0xFFE1B812),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Confirm order for $item?'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Select another item'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Tablebooking()),
                    );
                  },
                  child: const Text('Confirm'),

                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
