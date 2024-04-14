import 'package:dio/dio.dart';

import '../models/image_model.dart';

class GalleryService {
  final Dio _dio = Dio();

  Future<List<ImageModel>> fetchGallery(String token) async {
    try {
      Response response = await _dio.get(
        'https://flutter.prominaagency.com/api/my-gallery',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      List<String> imageUrls =
          List<String>.from(response.data['data']['images']);
      return imageUrls
          .map((imageUrl) => ImageModel(imageUrl: imageUrl))
          .toList();
    } catch (error) {
      throw Exception('Failed to fetch gallery: $error');
    }
  }
}
