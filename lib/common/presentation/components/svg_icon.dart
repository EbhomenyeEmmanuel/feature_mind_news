import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Custom SVG Widget for that renders an SVG picture from an [AssetBundle] .
class SvgIcon extends StatelessWidget {
  const SvgIcon(this.svg, {super.key, this.width, this.height, this.color});
  final String svg;
  final double? width;
  final double? height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/svg/$svg.svg',
        width: width, height: height, color: color);
  }
}
