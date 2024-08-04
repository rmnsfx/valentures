import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../valery_adventure.dart';

double verticalPositionY = 29;

class Score extends TextComponent with HasGameRef<ValeryAdventure> {
  late String score;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    score = game.score.toString();
    text = "АЛКОИНЫ: $score";
    position = Vector2(55, verticalPositionY);
    scale = Vector2(0.5, 0.5);
  } 

  @override
  void update(double dt) {
    super.update(dt);
    score = game.score.toString();
    text = "АЛКОИНЫ: $score";
  }
}

class Cash extends TextComponent with HasGameRef<ValeryAdventure> {
  late String cash;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    cash = game.cash.toString();
    text = "CASH: $cash";
    position = Vector2(15, 15);
    scale = Vector2(0.5, 0.5);
  } 

  @override
  void update(double dt) {
    super.update(dt);
    cash = game.cash.toString();
    text = "CASH: $cash";
  }
}

class LevelLabel extends TextComponent with HasGameRef<ValeryAdventure> {
  late int level;
  late String levelLabel;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    level = game.currentLevelIndex + 1;
    levelLabel = level.toString();
    text = "УРОВЕНЬ: $levelLabel";
    position = Vector2(150, verticalPositionY);
    scale = Vector2(0.5, 0.5);
  } 

  @override
  void update(double dt) {
    super.update(dt);

    level = game.currentLevelIndex + 1;
    if(level < 4) {
      levelLabel = level.toString();
      text = "УРОВЕНЬ: $levelLabel";
    }
    else{
      // text = "ПОЗДРАВЛЯЕМ!!!!\nMALOY ВЫЙГРАЛ!";
      //position = Vector2(150, 150);
      //scale = Vector2(1.5, 1.5);
    }
  }
}