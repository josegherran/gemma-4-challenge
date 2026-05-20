import 'package:flutter/material.dart';

class ColorBlock extends StatelessWidget {
  final Color color;
  final String label;
  final String? subtitle;

  const ColorBlock({
    required this.color,
    required this.label,
    this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  subtitle!,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
