import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Assignorder extends StatefulWidget {
  const Assignorder({super.key});

  @override
  State<Assignorder> createState() => _AssignorderState();
}

class _AssignorderState extends State<Assignorder> {
  final CollectionReference menu =
      FirebaseFirestore.instance.collection('menu');

  List<bool?> isCheckedList = List.generate(10, (index) => false);

  void deleteitem(docId) {
    menu.doc(docId).delete();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 227, 107, 32),
        title: Text("Assigned orders to chef.."),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
        stream: menu.orderBy('menuitem').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot menuSnap = snapshot.data.docs[index];
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
                            menuSnap['menuitem'],
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            menuSnap['quantity'].toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          Checkbox(
                            value: isCheckedList[index],
                            activeColor: Colors.black,
                            onChanged: (newBool) {
                              setState(() {
                                isCheckedList[index] = newBool;
                              });
                            },
                          ),
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
