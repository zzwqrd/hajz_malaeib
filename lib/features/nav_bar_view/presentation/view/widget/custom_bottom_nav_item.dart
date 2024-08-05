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
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5.5),
      child: Image(
        image: AssetImage(icon),
        width: 25.w,
        fit: BoxFit.cover,
      ),
    ),
    activeIcon: Container(
      decoration: BoxDecoration(
        // color: isActive ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(0),
      ),
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5.5),
      child: Image(
        image: AssetImage(iconActive),
        width: 25.w,
        fit: BoxFit.cover,
      ),
    ),
  );
}
