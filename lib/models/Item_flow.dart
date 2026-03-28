import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:item_flow/data/information.dart';
import 'package:item_flow/models/container_body.dart';
import 'package:item_flow/models/item_list.dart';

class Itemflow extends StatefulWidget {
  const Itemflow({super.key});
  @override
  State<Itemflow> createState() => _ItemflowState();
}

class _ItemflowState extends State<Itemflow> {
  List<Information> items = [
    Information(
      name: 'Laptop',
      quantity: 5,
      price: 1200,
      dateTime: DateTime.now(),
    ),
    Information(
      name: 'Chair',
      quantity: 12,
      price: 350,
      dateTime: DateTime.now(),
    ),
  ];

  void addItem(Information item) {
    setState(() {
      items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            ContainerBody(items: items, onAddItems: addItem),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 280,
              children: [
                Text(
                  'Your items',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(124, 255, 255, 255),
                  child: Text(
                    items.length.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            Expanded(child: ItemList(informations: items)),
          ],
        ),
      ),
    );
  }
}
