class Seller {
  int? id;
  String? name;
  String? email;
  String? image;
  String? address;
  String? description;
  Seller({
    this.id,
    this.name,
    this.email,
    this.image,
    this.address,
    this.description,
  });

  Seller.fromJson(Map<dynamic, dynamic> json) {
    id = int.parse(json['id']);
    email = json['email'];
    name = json['name'];
    image = json['image'];
    address = json['address'];
    description = json['description'];
  }
}
