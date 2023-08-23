import "dart:convert";

import "package:better_buys/models/seller.dart";
import "package:http/http.dart" as http;

class ServerHandler {
  final String baseUrl = "http://10.0.2.2/better_buys/api";

  Future<List<Seller>> getSellers() async {
    try {
      List<Seller> sellers = [];

      http.Response response = await http.get(Uri.parse("$baseUrl/seller/all"));
      // ignore: avoid_print

      dynamic decodedData = json.decode(response.body);
      List sellersList = decodedData['sellers'];

      for (Map seller in sellersList) {
        sellers.add(Seller.fromJson(seller));
      }
      return sellers;
    } catch (e) {
      // ignore: avoid_print
      print("server error ${e.toString()}");
      rethrow;
    }
  }
}
