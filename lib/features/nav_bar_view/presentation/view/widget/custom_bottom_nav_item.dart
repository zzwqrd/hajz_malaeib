import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

BottomNavigationBarItem buildBottomNavigationBarItem({
  required String label,
  required String icon,
  required String iconActive,
  required bool isActive,
}) {
  return BottomNavigationBarItem(
    label: label,
    icon: Container(
      decoration: BoxDecoration(
        // color: isActive ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6.8),
      child: Image(
        image: AssetImage(icon),
        width: 20.w,
      ),
    ),
    activeIcon: Container(
      decoration: BoxDecoration(
        // color: Colors.blue,
        borderRadius: BorderRadius.circular(0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 6.8),
      child: Image(
        image: AssetImage(iconActive),
        width: 20.w,
      ),
    ),
  );
}
