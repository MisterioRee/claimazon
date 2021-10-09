class Product {
  String? title;
  int? price;
  String? sku;
  String? author;
  String? description;
  String? thumbnail;
  String? image;
  String? currency;
  int? itemsInStock;
  int? rating;
  String? productId;
  var tags = List<Tags>.empty(growable: true);
  var reviews = List<Reviews>.empty(growable: true);
  var recommendations = List<int>.empty(growable: true);
  Product(
      {this.title,
      this.price,
      this.sku,
      this.author,
      this.description,
      this.thumbnail,
      this.image,
      this.currency,
      this.itemsInStock,
      this.rating,
      required this.recommendations,
      this.productId,
      required this.tags,
      required this.reviews});

  Product.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    price = json['price'];
    sku = json['sku'];
    author = json['author'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    image = json['image'];
    currency = json['currency'];
    itemsInStock = json['itemsInStock'];
    rating = json['rating'];
    recommendations = json['recommendations'].cast<int>();
    productId = json['product_id'];
    if (json['tags'] != null) {
      tags = new List<Tags>.empty(growable: true);
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = new List<Reviews>.empty(growable: true);
      json['reviews'].forEach((v) {
        reviews.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['price'] = this.price;
    data['sku'] = this.sku;
    data['author'] = this.author;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    data['image'] = this.image;
    data['currency'] = this.currency;
    data['itemsInStock'] = this.itemsInStock;
    data['rating'] = this.rating;
    data['recommendations'] = this.recommendations;
    data['product_id'] = this.productId;
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tags {
  String? name;
  String? id;
  String? productId;

  Tags({this.name, this.id, this.productId});

  Tags.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['productId'] = this.productId;
    return data;
  }
}

class Reviews {
  String? message;
  int? rating;
  String? id;
  String? productId;

  Reviews({this.message, this.rating, this.id, this.productId});

  Reviews.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    rating = json['rating'];
    id = json['id'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['rating'] = this.rating;
    data['id'] = this.id;
    data['productId'] = this.productId;
    return data;
  }
}
