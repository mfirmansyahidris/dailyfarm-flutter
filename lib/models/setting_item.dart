import 'package:flutter/material.dart';

class SettingItem{
  final bool isSelected;
  final IconData? icon;
  final String label;
  final VoidCallback? onClick;

  SettingItem({required this.label, this.icon, this.isSelected = false, this.onClick});
}