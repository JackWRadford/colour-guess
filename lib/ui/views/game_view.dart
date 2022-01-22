import 'package:colour_guess/core/enums/rgb.dart';
import 'package:colour_guess/core/viewModels/game_view_model.dart';
import 'package:colour_guess/ui/shared/app_text_styles.dart';
import 'package:colour_guess/ui/shared/app_ui_sizes.dart';
import 'package:colour_guess/ui/shared/app_ui_spacing.dart';
import 'package:colour_guess/ui/widgets/color_slider.dart';
import 'package:colour_guess/ui/widgets/results_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///main game view
class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _gameModel = Provider.of<GameModel>(context);
    Color _color = Provider.of<GameModel>(context).color;
    // int _guessNum = Provider.of<GameModel>(context).guessNum;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {},
        //     icon: const Icon(CupertinoIcons.chart_bar_circle_fill)),
        title: const Text(
          'GUESS THE COLOUR',
          style: textHeadline,
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: const Icon(CupertinoIcons.bolt_circle_fill))
        // ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            //color card
            Expanded(
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(mediumRadius)),
                  // side: BorderSide(color: Colors.black, width: 3),
                ),
                margin: const EdgeInsets.symmetric(horizontal: mediumPadding),
                color: _color,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [],
                    )
                  ],
                ),
              ),
            ),

            UIHelper.verticalSpaceMedium(),

            //current selected RGB value
            Padding(
              padding: const EdgeInsets.only(right: mediumPadding),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '(${_gameModel.uR},${_gameModel.uG},${_gameModel.uB})',
                    style: textFootnote,
                  ),
                ],
              ),
            ),

            //RGB sliders
            ColorSlider(value: _gameModel.uR, rgb: RGB.red),
            ColorSlider(value: _gameModel.uG, rgb: RGB.green),
            ColorSlider(value: _gameModel.uB, rgb: RGB.blue),

            UIHelper.verticalSpaceMedium(),

            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // const SizedBox(
                //   width: 50,
                // ),
                //main button
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    await Provider.of<GameModel>(context, listen: false)
                        .calcBestScore();
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => const ResultsDialog(),
                    );
                  },
                  child: Card(
                    color: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(mediumRadius)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: mediumPadding, horizontal: largePadding),
                      child: Text(
                        'SUBMIT',
                        style: textHeadline.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                // //guess number
                // SizedBox(
                //   width: 50,
                //   child: Text(
                //     '$_guessNum / 3',
                //     style: textSubhead,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
