import 'package:flutter/material.dart';

class MoveButton extends StatelessWidget {
  const MoveButton({super.key, required this.onTap, required this.icon});
  final IconData? icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        backgroundColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
