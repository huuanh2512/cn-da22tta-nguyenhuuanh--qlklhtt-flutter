import 'package:flutter/material.dart';

/// Thay thế NeuText thiếu trong neubrutalism_ui, dùng typography đậm cho tiêu đề.
class NeuText extends StatelessWidget {
  const NeuText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final baseStyle = theme.textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.w800,
      letterSpacing: -0.5,
    );
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: maxLines == null ? TextOverflow.visible : TextOverflow.ellipsis,
      style: baseStyle?.merge(style) ?? style,
    );
  }
}
