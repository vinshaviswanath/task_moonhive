import 'package:flutter/material.dart';
import 'package:moonhive_task/view/Chefscreen/Incomingorder/Reporting/Reporting.dart';

class Chef extends StatefulWidget {
  const Chef({super.key});

  @override
  State<Chef> createState() => _ChefState();
}

class _ChefState extends State<Chef> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 227, 107, 32),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            height: height * 0.20,
            width: width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.sort,
                        color: Colors.white,
                        size: 35,
                      ),
                      SizedBox(width: 300),
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 35,
                      )
                    ],
                  ),
                ),
                Text(
                  "Today Orders",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            child: GestureDetector(
              child: Container(
                height: 50,
                width: 300,
                child: Center(
                    child: Text(
                  "Show orders",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 227, 107, 32),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Order()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
