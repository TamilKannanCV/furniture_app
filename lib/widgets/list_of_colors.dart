import 'package:flutter/material.dart';
import 'package:furniture_app/widgets/color_dots.dart';

class ColorsList extends StatelessWidget {
  const ColorsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          ColorDot(
            fillColor: Color(0xFF80989A),
            isSelected: true,
          ),
          ColorDot(
            fillColor: Color(0xFFFF5200),
          ),
          ColorDot(
            fillColor: Color(0xFF035AA6),
          ),
        ],
      ),
    );
  }
}
