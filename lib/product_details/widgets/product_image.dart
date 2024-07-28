import 'package:fake_store_v1/shared/widgets/fs_image_view.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return FSImageView(imagePath: imageUrl);
  }
}
