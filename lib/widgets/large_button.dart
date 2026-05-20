import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? color;
  final IconData? icon;

  const LargeButton({
    required this.label,
    required this.onPressed,
    this.color,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon != null ? Icon(icon, size: 28) : SizedBox.shrink(),
      label: Text(label, style: TextStyle(fontSize: 20)),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 56),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
