import 'package:colour_guess/core/viewModels/game_view_model.dart';
import 'package:colour_guess/ui/shared/app_text_styles.dart';
import 'package:colour_guess/ui/shared/app_ui_sizes.dart';
import 'package:colour_guess/ui/shared/app_ui_spacing.dart';
import 'package:colour_guess/ui/widgets/color_preview.dart';
import 'package:colour_guess/ui/widgets/shared/my_dialog_text_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///shows the game results
class ResultsDialog extends StatelessWidget {
  const ResultsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _gameModel = Provider.of<GameModel>(context);
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(mediumRadius)),
      ),
      title: const Text(
        'RESULT',
        style: textHeadline,
        textAlign: TextAlign.center,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          UIHelper.verticalSpaceSmall(),
          ColorPreview(
            label: 'Original',
            r: _gameModel.r,
            g: _gameModel.g,
            b: _gameModel.b,
            color: _gameModel.color,
          ),
          UIHelper.verticalSpaceMedium(),
          ColorPreview(
            label: 'Guess',
            r: _gameModel.uR,
            g: _gameModel.uG,
            b: _gameModel.uB,
            color: _gameModel.getColor(),
          ),
          UIHelper.verticalSpaceMedium(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Difference',
                style: textFootnote,
              ),
              Text(
                _gameModel.getDifference().toString(),
                style: textHeadline,
              ),
            ],
          ),
          UIHelper.verticalSpaceMedium(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Best',
                style: textFootnote,
              ),
              Text(
                _gameModel.bestScore.toString(),
                style: textHeadline,
              ),
            ],
          ),
          UIHelper.verticalSpaceMedium(),
          MyDialogTextBtn(
              text: 'Play Again',
              onTap: () {
                Provider.of<GameModel>(context, listen: false).newColor();
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }
}
