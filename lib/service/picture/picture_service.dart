import 'package:dio/dio.dart';

class PictureService {
  final Dio dio;

  static const String _baseUrl = 'https://picsum.photos/v2/list';

  PictureService(this.dio) {
    dio.options.baseUrl = _baseUrl;
  }

  Future<List<dynamic>> getPictures({int limit = 20, int page = 1}) async {
    try {
      final response = await dio.get(
        _baseUrl,
        queryParameters: {'limit': limit, 'page': page},
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to fetch picture list');
      }
    } catch (e) {
      throw Exception('Error fetching pictures: $e');
    }
  }
}
