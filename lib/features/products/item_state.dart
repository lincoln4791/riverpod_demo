import 'package:riverpod_demo/features/products/item.dart';
import 'package:riverpod_demo/features/products/item_model.dart';

class ItemState {
  final List<ItemModel> allProducts;
  final List<ItemModel> visibleProducts;
  final bool isLoading;
  final bool hasMore;

  ItemState({
    required this.allProducts,
    required this.visibleProducts,
    required this.isLoading,
    required this.hasMore,
  });

  factory ItemState.initial() {
    return ItemState(
      allProducts: [],
      visibleProducts: [],
      isLoading: false,
      hasMore: true,
    );
  }

  ItemState copyWith({
    List<ItemModel>? allProducts,
    List<ItemModel>? visibleProducts,
    bool? isLoading,
    bool? hasMore,
  }) {
    return ItemState(
      allProducts: allProducts ?? this.allProducts,
      visibleProducts: visibleProducts ?? this.visibleProducts,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}