import 'package:flutter/painting.dart';

/// Creates a new path that is drawn from the segments of `source`.
///
/// Dash intervals are controlled by the `dashArray` - see [CircularIntervalList]
/// for examples.
///
/// `dashOffset` specifies an initial starting point for the dashing.
///
/// Passing a `source` that is an empty path will return an empty path.
Path dashPath(
  Path source, {
  required CircularIntervalList<double> dashArray,
  DashOffset? dashOffset,
}) {
  assert(dashArray != null); // ignore: unnecessary_null_comparison

  final _dashOffset = dashOffset ?? const DashOffset.absolute(0);
  // TODO: Is there some way to determine how much of a path would be visible today?

  final dest = Path();
  for (final metric in source.computeMetrics()) {
    var distance = _dashOffset._calculate(metric.length);
    var draw = true;
    dashArray.reset();
    while (distance < metric.length) {
      final len = dashArray.next;
      if (draw) {
        dest.addPath(metric.extractPath(distance, distance + len), Offset.zero);
      }
      distance += len;
      draw = !draw;
    }
  }

  return dest;
}

enum _DashOffsetType { absolute, percentage }

/// Specifies the starting position of a dash array on a path, either as a
/// percentage or absolute value.
///
/// The internal value will be guaranteed to not be null.
class DashOffset {
  /// Create a DashOffset that will be measured as a percentage of the length
  /// of the segment being dashed.
  ///
  /// `percentage` will be clamped between 0.0 and 1.0.
  DashOffset.percentage(double percentage)
    : _rawVal = percentage.clamp(0.0, 1.0),
      _dashOffsetType = _DashOffsetType.percentage;

  /// Create a DashOffset that will be measured in terms of absolute pixels
  /// along the length of a [Path] segment.
  const DashOffset.absolute(double start)
    : _rawVal = start,
      _dashOffsetType = _DashOffsetType.absolute;

  final double _rawVal;
  final _DashOffsetType _dashOffsetType;

  double _calculate(double length) =>
      _dashOffsetType == _DashOffsetType.absolute ? _rawVal : length * _rawVal;
}

/// A circular array of dash offsets and lengths.
///
/// For example, the array `[5, 10]` would result in dashes 5 pixels long
/// followed by blank spaces 10 pixels long.  The array `[5, 10, 5]` would
/// result in a 5 pixel dash, a 10 pixel gap, a 5 pixel dash, a 5 pixel gap,
/// a 10 pixel dash, etc.
///
/// Note that this does not quite conform to an [Iterable<T>], because it does
/// not have a moveNext.
class CircularIntervalList<T> {
  CircularIntervalList(this._vals);

  final List<T> _vals;
  int _idx = 0;

  void reset() {
    _idx = 0;
  }

  T get next {
    if (_idx >= _vals.length) {
      _idx = 0;
    }
    return _vals[_idx++];
  }
}

class DashPathBorder extends Border {
  const DashPathBorder({
    required this.dashArray,
    super.top,
    super.left,
    super.right,
    super.bottom,
  });

  factory DashPathBorder.all({
    required CircularIntervalList<double> dashArray,
    BorderSide borderSide = const BorderSide(),
  }) => DashPathBorder(
    dashArray: dashArray,
    top: borderSide,
    right: borderSide,
    left: borderSide,
    bottom: borderSide,
  );

  final CircularIntervalList<double> dashArray;

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    if (isUniform) {
      switch (top.style) {
        case BorderStyle.none:
          return;
        case BorderStyle.solid:
          switch (shape) {
            case BoxShape.circle:
              assert(
                borderRadius == null,
                'A borderRadius can only be given for rectangular boxes.',
              );
              canvas.drawPath(
                dashPath(Path()..addOval(rect), dashArray: dashArray),
                top.toPaint(),
              );
            case BoxShape.rectangle:
              if (borderRadius != null) {
                final rrect = RRect.fromRectAndRadius(
                  rect,
                  borderRadius.topLeft,
                );
                canvas.drawPath(
                  dashPath(Path()..addRRect(rrect), dashArray: dashArray),
                  top.toPaint(),
                );
                return;
              }
              canvas.drawPath(
                dashPath(Path()..addRect(rect), dashArray: dashArray),
                top.toPaint(),
              );
          }
          return;
      }
    }

    assert(
      borderRadius == null,
      'A borderRadius can only be given for uniform borders.',
    );
    assert(
      shape == BoxShape.rectangle,
      'A border can only be drawn as a circle if it is uniform.',
    );

    // TODO(dnfield): implement when borders are not uniform.
  }
}
