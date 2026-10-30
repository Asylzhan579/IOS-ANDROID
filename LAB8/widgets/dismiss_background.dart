import 'package:flutter/material.dart';

class DismissBackground extends StatelessWidget {
  const DismissBackground({super.key, this.borderRadius = BorderRadius.zero});

  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: borderRadius,
      ),
      child: const Icon(Icons.delete, color: Colors.white, size: 30),
    );
  }
}
