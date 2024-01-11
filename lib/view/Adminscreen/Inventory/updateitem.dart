import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateInventory extends StatefulWidget {
  const UpdateInventory({Key? key}) : super(key: key);

  @override
  State<UpdateInventory> createState() => _UpdateInventoryState();
}

class _UpdateInventoryState extends State<UpdateInventory> {
  final CollectionReference menu =
      FirebaseFirestore.instance.collection('hotel');

  TextEditingController menuController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  void updateMenu(docId) async {
    final data = {
      'Inventoryitem': menuController.text,
      'quantity': quantityController.text,
    };

    final docSnapshot = await menu.doc(docId).get();
    if (docSnapshot.exists) {
      await menu.doc(docId).update(data).then((value) => Navigator.pop(context));
    } else {
      print('Document does not exist. Cannot update.');
      // Handle the situation when the document does not exist, e.g., show an error message.
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    menuController.text = args['Inventoryitem'];
    quantityController.text = args['quantity'];
    final docId = args['id'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 227, 107, 32),
        title: Text("Update Inventory"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: menuController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Inventoryitem"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Quantity"),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                updateMenu(docId);
              },
              child: Text(
                "Update",
                style: TextStyle(fontSize: 15),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(200, 50)),
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 227, 107, 32),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
