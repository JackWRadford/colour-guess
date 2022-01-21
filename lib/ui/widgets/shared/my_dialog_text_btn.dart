import 'package:flutter/material.dart';
import 'package:colour_guess/ui/shared/app_text_styles.dart';
import 'package:colour_guess/ui/shared/app_ui_sizes.dart';

///used for dialogs that require actions
class MyDialogTextBtn extends StatelessWidget {
  final String text;
  final Function() onTap;

  const MyDialogTextBtn({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 140,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: const EdgeInsets.all(
            mediumPadding,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(mediumRadius),
            ),
            color: Colors.black,
          ),
          child: Center(
            child: Text(
              text,
              style: textHeadline.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
