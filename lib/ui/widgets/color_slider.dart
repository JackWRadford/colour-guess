import 'package:colour_guess/core/enums/rgb.dart';
import 'package:colour_guess/core/viewModels/game_view_model.dart';
import 'package:colour_guess/ui/shared/app_text_styles.dart';
import 'package:colour_guess/ui/shared/app_ui_sizes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///slider for RGB values
class ColorSlider extends StatelessWidget {
  final int value;
  final RGB rgb;

  const ColorSlider({
    Key? key,
    required this.value,
    required this.rgb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: mediumPadding),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            _getLabel(rgb),
            style: textSubhead,
          ),
          Expanded(
            child: Slider(
              value: value.toDouble(),
              max: 255,
              onChanged: (newValue) {
                Provider.of<GameModel>(context, listen: false)
                    .updateRGB(rgb, newValue.toInt());
              },
            ),
          ),
        ],
      ),
    );
  }
}

String _getLabel(RGB rgb) {
  switch (rgb) {
    case RGB.red:
      return 'R';
    case RGB.green:
      return 'G';
    case RGB.blue:
      return 'B';
    default:
      return 'R';
  }
}
