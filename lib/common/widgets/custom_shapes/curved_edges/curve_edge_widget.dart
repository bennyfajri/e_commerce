import 'package:flutter/material.dart';

import 'curve_edges.dart';

class CurveEdgesWidget extends StatelessWidget {
  const CurveEdgesWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: child,
    );
  }
}