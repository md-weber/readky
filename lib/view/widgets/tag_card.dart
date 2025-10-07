import 'package:flutter/material.dart';

class TagCard extends StatelessWidget {
  const TagCard({
    super.key,
    required this.tagName,
  });
  final String tagName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        tagName,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }
}
