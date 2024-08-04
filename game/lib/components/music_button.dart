import 'dart:async';
import 'dart:developer';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:valentures/components/score.dart';

import '../valery_adventure.dart';

class MusicButton extends TextComponent with HasGameRef<ValeryAdventure>, TapCallbacks{
  

  @override
  FutureOr<void> onLoad() {
    
    if(game.musicOnOff) {
      text = "МУЗ: ВКЛ";
    } else {
      text = "МУЗ: ВЫКЛ";
    }
    
    position = Vector2(240, verticalPositionY);
    scale = Vector2(0.5, 0.5);

    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    log('onTapDown');
  }

  @override
  void onTapUp(TapUpEvent event) {
    
    game.musicOnOff = !game.musicOnOff;

    super.onTapUp(event);
    // log('MUSIC BUTTON onTapUp');

    if(game.musicOnOff) {
      text = "МУЗ: ВКЛ";
      FlameAudio.bgm.resume();
    } else {
      text = "МУЗ: ВЫКЛ";
      FlameAudio.bgm.stop();
    }
    
  }
}
