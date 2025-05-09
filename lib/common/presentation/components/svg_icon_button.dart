import 'package:flutter/material.dart';

import 'svg_icon.dart';

/// Custom SVG Widget for that renders an SVG picture from an [AssetBundle] and allows tap gestures.
class SvgIconButton extends StatelessWidget {
  const SvgIconButton(this.path, {super.key, this.color, required this.onTap});
  final String path;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: SvgIcon(
          path,
          color: color,
        ));
  }
}
