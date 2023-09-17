import 'package:flutter/cupertino.dart';
import 'package:himali_bhada_pasal/utils/dimensions.dart';

class AppIconClass extends StatelessWidget {
  IconData icon;
  Color iconColor;
  Color backgroundColor;
  double size;
  final double iconSize;

  AppIconClass({
    super.key,
    required this.icon,
    this.iconColor=const Color(0xFF756d54),
    this.backgroundColor=const Color(0xFFfcf4e4),
    this.iconSize=16,
    this.size=40
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
    );
  }
}
