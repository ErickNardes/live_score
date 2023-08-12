// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatefulWidget {
  final String assetName;
  final Color color;
  final double size;

  const SvgIcon({
    super.key,
    required this.assetName,
    required this.color,
    this.size = 24,
  });

  @override
  State<SvgIcon> createState() => _SvgIconState();
}

class _SvgIconState extends State<SvgIcon> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      widget.assetName,
      color: widget.color,
      height: widget.size,
      width: widget.size,
    );
  }
}
