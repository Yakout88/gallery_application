import 'package:flutter/material.dart';

import '../core/my_const.dart';
import '../models/image_model.dart';
import '../services/gallery_service.dart';

class PartOfPics extends StatelessWidget {
  const PartOfPics({
    super.key,
    required this.galleryService,
  });

  final GalleryService galleryService;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<ImageModel>>(
        future: galleryService.fetchGallery(MyConst.myToken),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        fit: BoxFit.cover,
                        snapshot.data![index].imageUrl,
                      ),
                    ));
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.purple[500],
              ),
            );
          }
        },
      ),
    );
  }
}
