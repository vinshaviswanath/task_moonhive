
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moonhive_task/view/Adminscreen/Menu/addmenu.dart';


class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final CollectionReference menu =
      FirebaseFirestore.instance.collection('menu');
  void deleteitem(docId) {
    menu.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 227, 107, 32),
        title: Text("Menu details"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Addmenu(),
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
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/Updatemenu',
                                    arguments: {
                                      'menuitem': menuSnap['menuitem'],
                                      'quantity': menuSnap['quantity'].toString(),
                                      'id': menuSnap.id,
                                    });
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.green,
                              )),
                          IconButton(
                              onPressed: () {
                                deleteitem(menuSnap.id);
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
