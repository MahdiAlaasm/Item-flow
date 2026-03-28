import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:item_flow/data/information.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key, required this.onAddItems});
  final void Function(Information item) onAddItems;

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  late final _titleControllar = TextEditingController();
  final _quantityControllar = TextEditingController();
  final _priceControllar = TextEditingController();
  DateTime? _selectedDate;

  void _presentDatePicer() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 10, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitItems() {
    final enteredQuantity = double.tryParse(_quantityControllar.text);
    final invalidQuantity = enteredQuantity == null || enteredQuantity <= 0;
    final enteredPrice = double.tryParse(_priceControllar.text);
    final invalidPrice = enteredPrice == null || enteredPrice < 0;

    if (_titleControllar.text.trim().isEmpty ||
        invalidPrice ||
        invalidQuantity ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text(
            'Plase make sure the valid title and uantity, Price, Date was entered. ',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddItems(
      Information(
        name: _titleControllar.text,
        quantity: int.parse(_quantityControllar.text),
        price: double.parse(_priceControllar.text),
        dateTime: _selectedDate!,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleControllar.dispose();
    _quantityControllar.dispose();
    _priceControllar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 30),
          child: Row(
            children: [
              Container(
                height: 49,
                width: 62,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 2, 146, 154),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
              SizedBox(width: 25),
              Text(
                'Add New Item',
                style: GoogleFonts.cascadiaMono(fontSize: 20),
              ),
            ],
          ),
        ),
        SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.only(left: 55),
          child: Row(
            children: [
              Icon(Icons.inventory_2),
              SizedBox(width: 10),
              Text('Item name', style: GoogleFonts.cascadiaMono(fontSize: 16)),
            ],
          ),
        ),
        SizedBox(height: 17),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 226, 224, 224),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          height: 53,
          width: 450,
          child: TextField(
            controller: _titleControllar,
            decoration: InputDecoration(
              hintText: 'Enter the name',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
        SizedBox(height: 35),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: Row(
                    children: [
                      Icon(Icons.tag),
                      SizedBox(width: 10),
                      Text(
                        'Quantity',
                        style: GoogleFonts.cascadiaMono(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 226, 224, 224),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    height: 53,
                    width: 170,
                    child: TextField(
                      controller: _quantityControllar,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        hintText: '0',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 10),
                      Text(
                        'Price',
                        style: GoogleFonts.cascadiaMono(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 226, 224, 224),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    height: 53,
                    width: 170,
                    child: TextField(
                      controller: _priceControllar,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: InputDecoration(
                        prefixText: '\$ ',
                        hintText: '0.00',
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 35),
        Padding(
          padding: const EdgeInsets.only(left: 55),
          child: Row(
            children: [
              Icon(Icons.date_range),
              SizedBox(width: 10),
              Text('Date', style: GoogleFonts.cascadiaMono(fontSize: 16)),
            ],
          ),
        ),
        SizedBox(height: 17),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 226, 224, 224),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          height: 53,
          width: 450,
          child: TextField(
            onTap: _presentDatePicer,
            decoration: InputDecoration(
              hintText: _selectedDate == null
                  ? 'mm / dd / yy'
                  : format.format(_selectedDate!),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
        SizedBox(height: 50),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 2, 146, 154),
            padding: EdgeInsets.symmetric(horizontal: 125, vertical: 17),
            iconSize: 30,
            elevation: 5,
          ),
          onPressed: _submitItems,
          icon: Icon(Icons.add, color: Colors.white),
          label: Text(
            'Add to inventory',
            style: GoogleFonts.cascadiaMono(color: Colors.white, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
//_selectedDate ==null ?'Add to inventory' :format.format(_selectedDate!),