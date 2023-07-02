// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:elegen_notipay/page/payment.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotiPay'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5))),
                  child: Text(
                    'Welcome to NotiPay',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                      "এই অ্যাপে 'flutter_bkash' পেমেন্ট গেটওয়ে ব্যবহার করে একটি পেমেন্ট সিস্টেমের ডেমো তৈরী করা হয়েছে। পেমেন্ট গেটওয়ে এর ফিচারগুলো দেখতে নিচের 'Buy Package' বাটনে ক্লিক করুন।"),
                ),
                Divider(),
                ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Payment())),
                    child: Text('Buy Package')),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
