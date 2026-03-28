import 'package:flutter/material.dart';
import 'package:item_flow/data/information.dart';
import 'package:item_flow/models/widget/item_card.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.informations});

  final List<Information> informations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: informations.length,
      itemBuilder: (ctx, index) => ItemCard(informations[index]),
    );
  }
}
