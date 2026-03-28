import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:item_flow/data/information.dart';

class ItemCardInfo extends StatelessWidget {
  const ItemCardInfo(this.info, {super.key});

  final Information info;

  @override
  Widget build(BuildContext context) {
    final double totalPrice = info.price * info.quantity;
    return Container(
      width: double.infinity,
      height: 85,
      color: Color.fromARGB(255, 248, 248, 248),
      child: Padding(
        padding: const EdgeInsets.only(left: 45, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 50,
          children: [
            Column(
              children: [
                Text(
                  'Qty',
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 5),
                Text(
                  (info.quantity).toString(),
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(color: Colors.grey, width: 1, height: 50),
            Column(
              children: [
                Text(
                  'Price',
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 5),
                Text(
                  '\$${(info.price).toString()}',
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(color: Colors.grey, width: 1, height: 50),
            Column(
              children: [
                Text(
                  'Total',
                  style: GoogleFonts.inter(fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 5),
                Text(
                  '\$${(totalPrice).toStringAsFixed(2)}',
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
