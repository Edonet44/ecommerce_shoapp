import 'package:flutter/material.dart';

class BottomNavigationbar extends StatelessWidget {
  const BottomNavigationbar({super.key, this.onTap, this.icon});

  final void Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 36,
        width: 36,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
