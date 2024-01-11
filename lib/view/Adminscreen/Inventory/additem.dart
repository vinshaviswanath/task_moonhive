import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Addinventory extends StatefulWidget {
  const Addinventory({super.key});

  @override
  State<Addinventory> createState() => _AddinventoryState();
}

class _AddinventoryState extends State<Addinventory> {
  final CollectionReference hotel =
      FirebaseFirestore.instance.collection('hotel');

      TextEditingController ItemName=TextEditingController();
      TextEditingController Amount=TextEditingController();

  void additem() {
    final data = {
      'item': ItemName.text,
      'amount': Amount.text,
    };
    hotel.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 227, 107, 32),
        title: Text("Add Items"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: ItemName,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text("Item")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: Amount,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Amount"),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  additem();
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
