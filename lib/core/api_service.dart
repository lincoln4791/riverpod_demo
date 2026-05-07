import 'package:dio/dio.dart';
import 'package:riverpod_demo/features/products/item_response_model.dart';

class ApiService {

  final Dio dio;

  ApiService(this.dio);

  // 🔥 Normal product fetch
  Future<ItemResponseModel> fetchProducts({
    required int limit,
    required int skip,
  }) async {

    final response = await dio.get(
      'https://dummyjson.com/products',
      queryParameters: {
        'limit': limit,
        'skip': skip,
      },
    );

    return ItemResponseModel.fromJson(response.data);
  }

  // 🔍 Search products
  Future<ItemResponseModel> searchProducts({
    required String query,
    required int limit,
    required int skip,
  }) async {

    final response = await dio.get(
      'https://dummyjson.com/products/search',
      queryParameters: {
        'q': query,
        'limit': limit,
        'skip': skip,
      },
    );

    return ItemResponseModel.fromJson(response.data);
  }
}