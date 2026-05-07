class ItemModel {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? thumbnail;
  List<String>? images;

  ItemModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.thumbnail,
    this.images,
  });

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];

    price = (json['price'] as num?)?.toDouble();
    discountPercentage =
        (json['discountPercentage'] as num?)?.toDouble();

    rating = (json['rating'] as num?)?.toDouble();

    stock = json['stock'];
    brand = json['brand'];
    thumbnail = json['thumbnail'];

    images = json['images'] != null
        ? List<String>.from(json['images'])
        : [];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'thumbnail': thumbnail,
      'images': images,
    };
  }
}