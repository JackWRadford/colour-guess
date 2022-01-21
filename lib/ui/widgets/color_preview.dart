import 'package:colour_guess/ui/shared/app_text_styles.dart';
import 'package:colour_guess/ui/shared/app_ui_sizes.dart';
import 'package:colour_guess/ui/shared/app_ui_spacing.dart';
import 'package:flutter/material.dart';

///preview for color and guessed color
///includes rgb value and color
class ColorPreview extends StatelessWidget {
  final String label;
  final int r;
  final int g;
  final int b;
  final Color color;

  const ColorPreview({
    Key? key,
    required this.label,
    required this.r,
    required this.g,
    required this.b,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: textFootnote,
            ),
            Text(
              '($r,$g,$b)',
              style: textFootnote,
            )
          ],
        ),
        UIHelper.verticalSpaceSmall(),
        Card(
          margin: const EdgeInsets.all(0),
          color: color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(smallRadius)),
          ),
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [],
            ),
          ),
        ),
      ],
    );
  }
}
