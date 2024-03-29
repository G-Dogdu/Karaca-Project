import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:karaca_katalog/Item/item.dart';
import 'package:karaca_katalog/screens/result_page.dart';
import '../reusable_widgets/reusable_widget.dart';

CurrentItem item = CurrentItem(Text(""), "", Text(""), "", Text(""));

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _productTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/karaca_logo.png"),
                const SizedBox(
                  height: 40,
                ),
                reusableTextField("Enter Product ID", Icons.table_bar_outlined,
                    false, _productTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseButton(context, "Search", () {
                  if (_productTextController.text.isEmpty) {
                    customAlert(context, "Search value cannot be empty");
                  } else {
                    item.setId(_productTextController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResultPage()));
                  }
                }),
                const SizedBox(
                  height: 20,
                ),
                barcodeText(),
                const SizedBox(
                  height: 150,
                ),
                firebaseButton(context, "Log Out", () {
                  FirebaseAuth.instance
                      .signOut()
                      .then((value) => Navigator.pop(context));
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getProductID() {
    return _productTextController.text;
  }

  Row barcodeText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Or Scan a Barcode! => ",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            scanBarcode();
          },
          child: const Text(
            "Scan Now",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Future scanBarcode() async {
    String? scanResult;

    try {
      scanResult = (await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", false, ScanMode.BARCODE));
    } on PlatformException {
      customAlert(context, "Barcode Error");
    }
    if (mounted) {
      if (scanResult == "-1") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SearchScreen()));
      } else {
        item.setSku(scanResult!);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ResultPage()));
      }
    }
  }
}
