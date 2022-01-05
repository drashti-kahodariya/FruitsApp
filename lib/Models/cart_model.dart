class CartModel {
  String? fruitName;
  String? price;
  String? qty;
  String? image, id;

  CartModel({this.fruitName, this.price, this.qty, this.image, this.id});

  CartModel.fromJson(Map<String, dynamic> json) {
    fruitName = json['fruitName'];
    price = json['price'];
    qty = json['qty'].toString();
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fruitName'] = this.fruitName;
    data['price'] = this.price;
    data['qty'] = this.qty;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}
