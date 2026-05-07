import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/features/products/item.dart';
import 'package:riverpod_demo/features/products/item_model.dart';

import 'item_notifier.dart';
import 'item_state.dart';

/*
final itemProvider =
StateNotifierProvider<ItemNotifier, ItemState>((ref) {
  return ItemNotifier();
});*/

/*final itemProvider =
AsyncNotifierProvider<ItemNotifier, List<Item>>(
  ItemNotifier.new,
);*/


/*
final itemProvider =
AsyncNotifierProvider.autoDispose<ItemNotifier, List<Item>>(
  ItemNotifier.new,
);*/


final itemProvider =
AsyncNotifierProvider.autoDispose<ItemNotifier, List<ItemModel>>(
  ItemNotifier.new,
);


