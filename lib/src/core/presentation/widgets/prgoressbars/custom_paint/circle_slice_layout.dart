import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/core/presentation/widgets/prgoressbars/custom_paint/slice.dart';
import 'package:flutter_boilerplate_code/src/core/presentation/widgets/prgoressbars/custom_paint/slice_clipper.dart';
import 'package:flutter_boilerplate_code/src/core/presentation/widgets/prgoressbars/custom_paint/slice_layout_delegate.dart';

class CircleSliceLayout extends StatelessWidget {
  final CircleSlice slice;
  final Widget child;

  const CircleSliceLayout({
    super.key,
    required this.slice,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: slice.radius,
      height: slice.radius,
      child: ClipPath(
        clipper: CircleSliceClipper(slice.angle),
        child: CustomMultiChildLayout(
          delegate: CircleSliceLayoutDelegate(slice.angle),
          children: [
            LayoutId(
              id: SliceSlot.slice,
              child: slice,
            ),
            LayoutId(
              id: SliceSlot.child,
              child: Center(
                child: child,
              ),
            ),

          ],
        ),
      ),
    );
  }
}