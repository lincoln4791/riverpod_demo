import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/features/products/item_provider.dart';

class ItemListScreen extends ConsumerStatefulWidget {
  const ItemListScreen({super.key});

  @override
  ConsumerState<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState
    extends ConsumerState<ItemListScreen> {

  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {

      ref.read(itemProvider.notifier).loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final itemsAsync = ref.watch(itemProvider);

    final notifier = ref.read(itemProvider.notifier);

    return Scaffold(

      appBar: AppBar(
        title: const Text('Products'),
      ),

      body: itemsAsync.when(

        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),

        error: (e, _) => Center(
          child: Text('Error: $e'),
        ),

        data: (items) {

          if (items.isEmpty) {
            return const Center(
              child: Text('No products found'),
            );
          }

          return Column(
            children: [

              // 🔍 SEARCH
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search products...',
                    prefixIcon: const Icon(Icons.search),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  onChanged: (value) {
                    ref
                        .read(itemProvider.notifier)
                        .search(value);
                  },
                ),
              ),

              Expanded(
                child: RefreshIndicator(

                  onRefresh: () async {
                    await ref
                        .read(itemProvider.notifier)
                        .refreshItems();
                  },

                  child: ListView.builder(

                    controller: _scrollController,

                    itemCount: items.length +
                        (notifier.hasMore ? 1 : 0),

                    itemBuilder: (context, index) {

                      if (index == items.length) {
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      final product = items[index];

                      return Card(

                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),

                        child: ListTile(

                          leading: Image.network(
                            product.thumbnail ?? '',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,

                            errorBuilder:
                                (_, __, ___) {
                              return const Icon(Icons.image);
                            },
                          ),

                          title: Text(
                            product.title ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          subtitle: Text(
                            '\$${product.price}',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}