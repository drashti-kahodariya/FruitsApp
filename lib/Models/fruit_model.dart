class FruitModel {
  List<Fruits>? data;

  FruitModel({this.data});

  FruitModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Fruits>[];
      json['data'].forEach((v) {
        data!.add(new Fruits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fruits {
  String? fruitName;
  String? image;
  String? price;
  String? star,id;

  Fruits({this.fruitName, this.image, this.price, this.star, this.id});

  Fruits.fromJson(Map<String, dynamic> json) {
    fruitName = json['fruitName'];
    image = json['image'];
    price = json['price'];
    star = json['star'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fruitName'] = this.fruitName;
    data['image'] = this.image;
    data['price'] = this.price;
    data['star'] = this.star;
    data['id'] = this.id;
    return data;
  }
}
