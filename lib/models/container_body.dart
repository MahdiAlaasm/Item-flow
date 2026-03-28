import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:item_flow/data/information.dart';
import 'package:item_flow/models/widget/new_item.dart';

class ContainerBody extends StatefulWidget {
  const ContainerBody({
    super.key,
    required this.items,
    required this.onAddItems,
  });
  final List<Information> items;
  final void Function(Information item) onAddItems;

  @override
  State<ContainerBody> createState() => _ContainerBodyState();
}

class _ContainerBodyState extends State<ContainerBody> {
  void addNewItem() {
    showBottomSheet(
      context: context,
      builder: (ctx) => NewItem(onAddItems: widget.onAddItems),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 282,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 2, 164, 153),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Inventory',
                  style: GoogleFonts.cabin(color: Colors.white, fontSize: 40),
                ),
                SizedBox(width: 170),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(111, 255, 255, 255),
                  ),
                  onPressed: addNewItem,
                  icon: Icon(Icons.add, color: Colors.white),
                  label: Text(
                    'New',
                    style: GoogleFonts.cabin(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 315),
            child: Text(
              'Track your items',
              style: GoogleFonts.cabin(color: Colors.white, fontSize: 15),
            ),
          ),
          SizedBox(height: 35),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 80,
            children: [
              Container(
                height: 109,
                width: 152,
                decoration: BoxDecoration(
                  color: Color.fromARGB(125, 255, 255, 255),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.inventory_2,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Items',
                            style: GoogleFonts.cabin(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        widget.items.length.toString(),
                        style: GoogleFonts.aDLaMDisplay(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 109,
                width: 152,
                decoration: BoxDecoration(
                  color: Color.fromARGB(125, 255, 255, 255),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.attach_money,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Total',
                            style: GoogleFonts.cabin(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        '\$${widget.items.fold(0.0, (sum, item) => sum + (item.price * item.quantity)).toString()}',
                        style: GoogleFonts.aDLaMDisplay(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
