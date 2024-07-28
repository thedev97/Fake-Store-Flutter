import 'package:flutter/material.dart';
import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: FSFonts.semiBoldFonts20,
      textAlign: TextAlign.center,
    );
  }
}
