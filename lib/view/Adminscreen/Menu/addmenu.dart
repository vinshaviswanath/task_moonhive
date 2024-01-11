import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Addmenu extends StatefulWidget {
  const Addmenu({super.key});

  @override
  State<Addmenu> createState() => _AddmenuState();
}

class _AddmenuState extends State<Addmenu> {
  final CollectionReference menu =
      FirebaseFirestore.instance.collection('menu');

  TextEditingController MenuItem = TextEditingController();
  TextEditingController Quantity = TextEditingController();

  void addmenu() {
    final data = {
      'menuitem': MenuItem.text,
      'quantity': Quantity.text,
    };
    menu.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 227, 107, 32),
        title: Text("Add Menu"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: MenuItem,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Menu")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: Quantity,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Quantity"),
                ),
              ),
            ),
            SizedBox(height: 100),
            ElevatedButton(
                onPressed: () {
                  addmenu();
                  Navigator.pop(context);
                },
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 15),
                ),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 227, 107, 32))))
          ],
        ),
      ),
    );
  }
}
