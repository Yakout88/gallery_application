import 'dart:io';
import 'package:dio/dio.dart';
import 'package:k/core/my_const.dart';

import '../models/respones_model.dart';

class ImageUploadService {
  static final Dio _dio = Dio();

  static Future<ApiResponse> uploadImage(File imageFile) async {
    try {
      FormData formData = FormData.fromMap({
        'img':
            await MultipartFile.fromFile(imageFile.path, filename: 'image.jpg'),
      });

      Response response = await _dio.post(
        'https://flutter.prominaagency.com/api/upload',
        data: formData,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $MyConst.token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return ApiResponse.fromJson(
            {"success": true, "message": "Image uploaded successfully"});
      } else {
        return ApiResponse.fromJson({
          "success": false,
          "message":
              "Failed to upload image. Error code: ${response.statusCode}"
        });
      }
    } catch (e) {
      return ApiResponse.fromJson({
        "success": false,
        "message": "Error uploading image: ${e.toString()}"
      });
    }
  }
}
