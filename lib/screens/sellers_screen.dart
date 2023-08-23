import 'package:better_buys/models/seller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "../widgets/seller_item.dart";

class SellersScreen extends StatefulWidget {
  static const routeName = "/sellers-screen";
  const SellersScreen({Key? key}) : super(key: key);

  @override
  State<SellersScreen> createState() => _SellersScreenState();
}

class _SellersScreenState extends State<SellersScreen> {
  List<Color> sellerItemBackgroundColor = [];

  @override
  void initState() {
    sellerItemBackgroundColor.add(const Color(0xffe6e3ec));
    sellerItemBackgroundColor.add(const Color.fromARGB(255, 213, 231, 213));
    sellerItemBackgroundColor.add(const Color(0xffe4edf4));
    sellerItemBackgroundColor.add(const Color(0xffe4dad4));
    // sellerItemBackgroundColor.addAll([Color(0xffe6e3ec)]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Seller> sellers =
        ModalRoute.of(context)!.settings.arguments as List<Seller>;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // the header
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Better buys",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff4e8489),
                          fontSize: 23,
                        )),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              // list of sellers
              Column(
                children: sellers.map(
                  (seller) {
                    return SellerItem(
                      seller: seller,
                      backgroundColor: sellerItemBackgroundColor[
                          sellers.indexOf(seller) % 4],
                    );
                  },
                ).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
