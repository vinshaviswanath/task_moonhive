import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moonhive_task/view/Adminscreen/Inventory/item.dart';
import 'package:moonhive_task/view/Adminscreen/Menu/menu.dart';
import 'package:moonhive_task/view/Adminscreen/order/order.dart';
import 'package:moonhive_task/view/Chefscreen/Incomingorder/Reporting/Reporting.dart';
import 'package:moonhive_task/view/Loginscreen/Registerscreen.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'हिंदी', 'locale': Locale('hi', 'US')},
  ];
  Updatelanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  buildDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text("Choose langauge"),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, Index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[Index]['name']),
                        onTap: () {
                          print(locale[Index]['name']);
                          Updatelanguage(locale[Index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, Index) {
                    return Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

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
                  "dashboard".tr,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Column(
            children: [
              GestureDetector(
                child: Container(
                  height: 60,
                  width: 300,
                  child: Center(
                      child: Text(
                    "subthree".tr,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 227, 107, 32),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Menu()));
                },
              ),
              SizedBox(height: 30),
              GestureDetector(
                child: Container(
                  height: 60,
                  width: 300,
                  child: Center(
                      child: Text(
                    "subtwo".tr,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 227, 107, 32),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Inventory()));
                },
              ),
              SizedBox(height: 30),
              GestureDetector(
                child: Container(
                  height: 60,
                  width: 300,
                  child: Center(
                      child: Text(
                    "subone".tr,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 227, 107, 32),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Assignorder()));
                },
              ),
              SizedBox(height: 30),
              GestureDetector(
                child: Container(
                  height: 60,
                  width: 300,
                  child: Center(
                      child: Text(
                    "subfive".tr,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 227, 107, 32),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Order()));
                },
              ),
              SizedBox(height: 80),
              GestureDetector(
                child: Container(
                  height: 25,
                  width: 200,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.language,
                          color: Colors.green,
                        ),
                        Text(
                          "subfour".tr,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 58, 147, 63),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  buildDialog(context);
                },
              ),
              SizedBox(height: 30),
              GestureDetector(
                child: Container(
                  height: 25,
                  width: 200,
                  child: Center(
                    child: Text(
                      "subsix".tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 58, 147, 63),
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
