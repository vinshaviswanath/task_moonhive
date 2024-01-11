import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moonhive_task/view/Adminscreen/Inventory/additem.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  final CollectionReference hotel =
      FirebaseFirestore.instance.collection('hotel');
  void deleteitem(docId) {
    hotel.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 227, 107, 32),
        title: Text("Inventory details"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Addinventory(),
          ));
        },
        backgroundColor: Color.fromARGB(255, 227, 107, 32),
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
        stream: hotel.orderBy('item').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot hotelSnap = snapshot.data.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 192, 190, 190),
                            blurRadius: 10,
                            spreadRadius: 15,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            hotelSnap['item'],
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            hotelSnap['amount'].toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/Updateinventory',
                                    arguments: {
                                      'item': hotelSnap['item'],
                                      'amount': hotelSnap['amount'].toString(),
                                      'id': hotelSnap.id,
                                    });
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.green,
                              )),
                          IconButton(
                              onPressed: () {
                                deleteitem(hotelSnap.id);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
