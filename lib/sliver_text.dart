library sliver_text;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;

/// [SliverText] is a widget that displays a string of text in a sliver
///
///  without using [SliverToBoxAdapter] and [Text] widgets.
class SliverText extends SingleChildRenderObjectWidget {
  /// Creates a widget that displays a string of text in a sliver.
  const SliverText(
    this.text, {
    Key? key,
    this.style = const TextStyle(),
    this.overflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.start,
    this.direction = ui.TextDirection.ltr,
    this.maxLines,
  }) : super(
          key: key,
        );

  /// The text to display.
  final String text;

  /// The style to use for the text.
  final TextStyle style;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// The directionality of the text.
  final ui.TextDirection direction;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  final int? maxLines;

  /// How visual overflow should be handled.
  final TextOverflow overflow;

  /// Creates an render object of the [SliverTextAdapter] class
  ///
  ///  that is used by this widget.
  @override
  RenderObject createRenderObject(BuildContext context) {
    return SliverTextAdapter(
      text,
      style: style,
      textAlign: textAlign,
      direction: direction,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  /// Updates the [SliverTextAdapter] with the current values of the properties.
  @override
  void updateRenderObject(
      BuildContext context, covariant SliverTextAdapter renderObject) {
    /// Updates the [SliverTextAdapter] with the current values of the properties.
    renderObject.text = text;
    renderObject.style = style;
    renderObject.textAlign = textAlign;
    renderObject.direction = direction;
    renderObject.overflow = overflow;
    renderObject.maxLines = maxLines;

    /// Calls the [updateRenderObject] method on the superclass.
    super.updateRenderObject(context, renderObject);
  }
}

/// [SliverTextAdapter] is the [RenderSliverSingleBoxAdapter] that
///
/// [SliverText] uses to display text.
class SliverTextAdapter extends RenderSliverSingleBoxAdapter {
  /// Creates a [SliverTextAdapter] that displays text.
  SliverTextAdapter(
    String text, {
    TextStyle style = const TextStyle(),
    required TextOverflow overflow,
    TextAlign textAlign = TextAlign.start,
    int? maxLines,
    ui.TextDirection direction = ui.TextDirection.ltr,
  })  : _text = text,
        _style = style,
        _textAlign = textAlign,
        _overflow = overflow,
        _maxLines = maxLines,
        _direction = direction,
        super(
            child: RenderParagraph(
          TextSpan(text: text, style: style),
          textAlign: textAlign,
          textDirection: direction,
          overflow: overflow,
          maxLines: maxLines,
        ));

  /// The text to display.
  String _text;

  /// Getter for the [text] property.
  String get text => _text;

  /// Setter for the [text] property.
  set text(String value) {
    if (_text == value) return;
    _text = value;
    updateChild();
    markNeedsLayout();
  }

  /// How the text should be aligned horizontally.
  TextAlign _textAlign;

  /// Getter for the [textAlign] property.
  TextAlign get textAlign => _textAlign;

  /// Setter for the [textAlign] property.
  set textAlign(TextAlign value) {
    if (_textAlign == value) return;
    _textAlign = value;
    updateChild();
    markNeedsLayout();
  }

  /// The directionality of the text.
  ui.TextDirection _direction;

  /// Getter for the [direction] property.
  ui.TextDirection get direction => _direction;

  /// Setter for the [direction] property.
  set direction(ui.TextDirection value) {
    if (_direction == value) return;
    _direction = value;
    updateChild();
    markNeedsLayout();
  }

  /// The style to use for the text.
  TextStyle _style;

  /// Getter for the [style] property.
  TextStyle get style => _style;

  /// Setter for the [style] property.
  set style(TextStyle value) {
    if (_style == value) return;
    _style = value;
    updateChild();
    markNeedsLayout();
  }

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  int? _maxLines;

  /// Getter for the [maxLines] property.
  int? get maxLines => _maxLines;

  /// Setter for the [maxLines] property.
  set maxLines(int? value) {
    if (_maxLines == value) return;
    _maxLines = value;
    updateChild();
    markNeedsLayout();
  }

  /// How visual overflow should be handled.
  TextOverflow _overflow;

  /// Getter for the [overflow] property.
  TextOverflow get overflow => _overflow;

  /// Setter for the [overflow] property.
  set overflow(TextOverflow value) {
    if (_overflow == value) return;
    _overflow = value;
    updateChild();
    markNeedsLayout();
  }

  /// Updates the child [RenderParagraph] with the current values of the properties.
  void updateChild() {
    child = RenderParagraph(
      TextSpan(text: text, style: style),
      textAlign: textAlign,
      textDirection: direction,
      overflow: overflow,
      maxLines: maxLines,
    );
  }

  /// Lays out the child [RenderParagraph] and sets
  ///
  /// the [SliverGeometry] for the [SliverTextAdapter].
  @override
  void performLayout() {
    if (child == null) {
      geometry = SliverGeometry.zero;
      return;
    }
    final SliverConstraints constraints = this.constraints;

    /// Lays out the child [RenderParagraph].
    child!.layout(constraints.asBoxConstraints(), parentUsesSize: true);
    final double childExtent;

    /// Calculates the [SliverGeometry.scrollExtent] for the [RenderSliverSingleBoxAdapter].
    switch (constraints.axis) {
      case Axis.horizontal:
        childExtent = child!.size.width;
      case Axis.vertical:
        childExtent = child!.size.height;
    }

    /// Calculates the [SliverGeometry.paintExtent] for the [RenderSliverSingleBoxAdapter].
    final double paintedChildSize =
        calculatePaintOffset(constraints, from: 0.0, to: childExtent);

    /// Calculates the [SliverGeometry.cacheExtent] for the [RenderSliverSingleBoxAdapter].
    final double cacheExtent =
        calculateCacheOffset(constraints, from: 0.0, to: childExtent);

    /// Sets the [SliverGeometry] for the [RenderSliverSingleBoxAdapter].
    geometry = SliverGeometry(
      scrollExtent: childExtent,
      paintExtent: paintedChildSize,
      maxPaintExtent: paintedChildSize,
      cacheExtent: cacheExtent,
      hitTestExtent: paintedChildSize,
      hasVisualOverflow: childExtent > constraints.remainingPaintExtent ||
          constraints.scrollOffset > 0.0,
    );

    /// Sets the [SliverGeometry] for the [RenderSliverSingleBoxAdapter].
    setChildParentData(child!, constraints, geometry!);
  }
}
