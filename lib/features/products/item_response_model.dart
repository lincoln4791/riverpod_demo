import 'package:riverpod_demo/features/products/item_model.dart';

class ItemResponseModel {
  List<ItemModel>? products;
  int? total;
  int? skip;
  int? limit;

  ItemResponseModel({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  ItemResponseModel.fromJson(Map<String, dynamic> json) {
    products = json['products'] != null
        ? (json['products'] as List)
            .map((e) => ItemModel.fromJson(e))
            .toList()
        : [];

    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    return {
      'products': products?.map((e) => e.toJson()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}