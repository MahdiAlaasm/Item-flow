import 'package:flutter/material.dart';
import 'package:item_flow/data/information.dart';
import 'package:item_flow/models/widget/item_card.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
    required this.informations,
    required this.onDeleteItem,
  });

  final List<Information> informations;
  final void Function(Information) onDeleteItem;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: informations.length,
      itemBuilder: (ctx, index) {
        final item = informations[index];
        return ItemCard(info: item, onDelete: () => onDeleteItem(item));
      },
    );
  }
}
//ItemCard(informations[index])