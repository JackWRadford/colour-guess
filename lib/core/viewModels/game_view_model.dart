import 'dart:math';
import 'package:colour_guess/core/enums/rgb.dart';
import 'package:colour_guess/core/enums/view_state.dart';
import 'package:colour_guess/core/locator.dart';
import 'package:colour_guess/core/viewModels/base_model.dart';
import 'package:colour_guess/core/services/shared_pref_service.dart';
import 'package:flutter/material.dart';

///viewModel for main game view
class GameModel extends BaseModel {
  ///inject shared preferences service
  final SharedPrefService _prefService = locator<SharedPrefService>();

  ///current color rgb
  int r = 0;
  int g = 0;
  int b = 0;
  Color color = Colors.black;

  ///user's color guess
  int uR = 0;
  int uG = 0;
  int uB = 0;

  ///user guess number
  int guessNum = 1;

  ///random number genrator
  final Random _random = Random();

  ///best score
  int bestScore = 1000;

  ///constructor
  GameModel() {
    _genColor();
  }

  ///reset guess value
  void _resetGuess() {
    uR = 0;
    uG = 0;
    uB = 0;
  }

  ///get best score
  Future<void> calcBestScore() async {
    await _setPlayedToday();
    int currentBest = await _prefService.getBest();
    int score = getDifference();
    if (score < currentBest) {
      _prefService.setBest(score);
      bestScore = score;
    } else {
      bestScore = currentBest;
    }
  }

  ///calculate difference between guess and color
  int getDifference() {
    return ((r - uR).abs() + (g - uG).abs() + (b - uB).abs());
  }

  ///get guess color
  Color getColor() {
    return Color.fromARGB(255, uR, uG, uB);
  }

  ///update rgb value
  void updateRGB(RGB rgb, int value) {
    setState(ViewState.busy);
    switch (rgb) {
      case RGB.red:
        uR = value;
        break;
      case RGB.green:
        uG = value;
        break;
      case RGB.blue:
        uB = value;
        break;
      default:
    }
    setState(ViewState.idle);
  }

  ///generate new color and notify listeners
  void newColor() {
    setState(ViewState.busy);
    _resetGuess();
    _genColor();
    setState(ViewState.idle);
  }

  ///generate random color
  void _genColor() {
    int _getRand() => _random.nextInt(256);
    r = _getRand();
    g = _getRand();
    b = _getRand();
    color = Color.fromARGB(255, r, g, b);
  }

  ///set played today
  Future<void> _setPlayedToday() async {
    await _prefService.setPlayedToday();
  }

  ///get played today
  Future<bool> getPlayedToday() async {
    return await _prefService.getPlayedToday();
  }
}
