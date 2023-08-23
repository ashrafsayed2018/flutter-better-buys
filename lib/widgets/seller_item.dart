import 'package:better_buys/models/seller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SellerItem extends StatelessWidget {
  final Seller seller;
  final Color backgroundColor;
  const SellerItem({
    Key? key,
    required this.seller,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      height: 200,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 25),
                child: Text(
                  seller.name!,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 12),
                    child: Text(
                      seller.address!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  )),
              Container(
                width: 70,
                margin: const EdgeInsets.only(left: 30, top: 5),
                child: Text(
                  "no rating",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Image.network(
                width: 100,
                height: double.infinity,
                "http://10.0.2.2/better_buys/assets/${seller.image!}"),
          )
        ],
      ),
    );
  }
}
