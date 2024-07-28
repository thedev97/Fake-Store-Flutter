import 'package:fake_store_v1/shared/utils/styles/font_styles.dart';
import 'package:flutter/material.dart';

class QuantityItem extends StatelessWidget {
  const QuantityItem({
    super.key,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  final int quantity;
  final void Function() onIncrease;
  final void Function() onDecrease;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildActionButton(
          icon: Icons.add,
          onPressed: onIncrease,
        ),
        const SizedBox(width: 5),
        Text(
          quantity.toString(),
          style: FSFonts.regularFonts20,
        ),
        const SizedBox(width: 5),
        _buildActionButton(
          icon: Icons.remove,
          onPressed: onDecrease,
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.white,
            offset: Offset(1.0, 1.0),
            blurRadius: 1.0,
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon),
        color: Colors.white,
        iconSize: 16,
        onPressed: onPressed,
      ),
    );
  }
}
