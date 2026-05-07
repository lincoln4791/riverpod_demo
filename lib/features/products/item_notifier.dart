import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/features/products/item_model.dart';

import '../../core/dio_provider.dart';

class ItemNotifier extends AutoDisposeAsyncNotifier<List<ItemModel>> {

  static const int pageSize = 15;

  int _skip = 0;

  bool _hasMore = true;
  bool _isLoadingMore = false;
  String _query = '';

  Timer? _debounce;


  @override
  Future<List<ItemModel>> build() async {
    ref.onDispose(() {
      _debounce?.cancel();
    });
    return _fetchProducts();
  }

  Future<List<ItemModel>> _fetchProducts() async {

    final api = ref.read(apiServiceProvider);

    final response = _query.isEmpty

        ? await api.fetchProducts(
      limit: pageSize,
      skip: _skip,
    )

        : await api.searchProducts(
      query: _query,
      limit: pageSize,
      skip: _skip,
    );

    final items = response.products ?? [];

    _hasMore = items.length == pageSize;

    _skip += pageSize;

    return items;
  }

  Future<void> loadMore() async {

    if (_isLoadingMore || !_hasMore) {
      return;
    }

    _isLoadingMore = true;

    try {

      final currentItems = state.value ?? [];

      final newItems = await _fetchProducts();

      state = AsyncData([
        ...currentItems,
        ...newItems,
      ]);

    } catch (e, st) {

      state = AsyncError(e, st);

    }

    _isLoadingMore = false;
  }

  void search(String query) {

    _debounce?.cancel();

    _debounce = Timer(
      const Duration(milliseconds: 500),
          () async {

        _query = query;

        // 🔥 Reset pagination
        _skip = 0;
        _hasMore = true;

        try {

          final items = await _fetchProducts();

          state = AsyncData(items);

        } catch (e, st) {

          state = AsyncError(e, st);
        }
      },
    );
  }

  Future<void> refreshItems() async {

    _skip = 0;
    _hasMore = true;

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return _fetchProducts();
    });
  }

  bool get hasMore => _hasMore;
}
