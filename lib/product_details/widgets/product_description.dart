import 'package:flutter/material.dart';
import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: FSFonts.regularFonts16,
      textAlign: TextAlign.center,
    );
  }
}
