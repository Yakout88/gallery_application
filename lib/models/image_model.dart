class ImageModel {
  final String imageUrl;

  ImageModel({required this.imageUrl});

  factory ImageModel.fromJson(String json) {
    return ImageModel(
      imageUrl: json,
    );
  }
}