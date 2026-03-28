import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:item_flow/data/information.dart';
import 'package:item_flow/models/widget/item_card_info.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.info, required this.onDelete});

  final Information info;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    void confirmDeleting() {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Delete Item '),
          content: Text('Confirm Deleting ${info.name}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('Cancle'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
                onDelete();
              },
              child: Text('Delete'),
            ),
          ],
        ),
      );
    }

    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Colors.white,

      child: SizedBox(
        height: 200,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Row(
                children: [
                  Container(
                    height: 44,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 2, 164, 153),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        info.name[0],
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        info.name,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        info.formattedDate,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit_square)),
                  IconButton(
                    onPressed: confirmDeleting,
                    icon: Icon(Icons.delete_rounded),
                  ),
                ],
              ),
            ),
            ItemCardInfo(info),
          ],
        ),
      ),
    );
  }
}
