// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:elegen_notipay/page/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bkash/flutter_bkash.dart';

class Payment extends StatefulWidget {
  Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool isLoading = false;

  Future<void> paymentCheckout(double amount) async {
    final flutterBkash = FlutterBkash();

    /// Goto BkashPayment page & pass the params
    try {
      /// call pay method to pay without agreement as parameter pass the context, amount, merchantInvoiceNumber
      final result = await flutterBkash.pay(
        context: context,
        // need the context as BuildContext
        amount: amount,
        // need it double type
        merchantInvoiceNumber: "tranId",
      );

      /// if the payment is success then show the log
      print(result.toString());

      /// if the payment is success then show the snack-bar
      _showSnackbar("(Success) tranId: ${result.trxId}");
    } on BkashFailure catch (e, st) {
      /// if something went wrong then show the log
      print(e.message);
      print(st);

      /// if something went wrong then show the snack-bar
      _showSnackbar(e.message);
    } catch (e, st) {
      /// if something went wrong then show the log
      print(e);
      print(st);

      /// if something went wrong then show the snack-bar
      _showSnackbar("Something went wrong");
    }
    setState(() {
      isLoading = false;
    });
    return;
  }

  /// show snack-bar with message
  void _showSnackbar(String message) => ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buy package"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      //   package cards
                      packageCard(
                        Icon(Icons.star),
                        'Silver',
                        200,
                        'এই পেকেজটি ক্রয় করলে আপনি ৩ মাসের জন্য আমাদের প্রিমিয়াম সার্ভিসগুলোর ভিডিও সেকশন এর অ্যাক্সেস পাবেন',
                        3,
                        () {
                          setState(() {
                            isLoading = true;
                          });
                          paymentCheckout(200);
                        },
                      ),
                      packageCard(
                        Icon(Icons.pages_outlined),
                        'Gold',
                        700,
                        'এই পেকেজটি ক্রয় করলে আপনি ৯ মাসের জন্য আমাদের প্রিমিয়াম সার্ভিসগুলোর ভিডিও ও PDF সেকশন এর অ্যাক্সেস পাবেন',
                        9,
                        () {
                          setState(() {
                            isLoading = true;
                          });
                          paymentCheckout(700);
                        },
                      ),
                      packageCard(
                        Icon(Icons.diamond),
                        'Diamond',
                        1500,
                        'এই পেকেজটি ক্রয় করলে আপনি ২ বছরের জন্য আমাদের প্রিমিয়াম সকল সার্ভিস এর অ্যাক্সেস পাবেন',
                        24,
                        () {
                          setState(() {
                            isLoading = true;
                          });
                          paymentCheckout(1500);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
