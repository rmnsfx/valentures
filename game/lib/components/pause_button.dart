import 'dart:async';
import 'dart:developer';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_audio/flame_audio.dart';

import '../valery_adventure.dart';

class PauseButton extends SpriteComponent with HasGameRef<ValeryAdventure>, TapCallbacks{
  
  @override
  final ValeryAdventure game;

  PauseButton(this.game);

  @override
  FutureOr<void> onLoad() {
    sprite = Sprite(game.images.fromCache('Menu/Buttons/Settings.png'));
    position = Vector2(560, 25);
    scale = Vector2(1, 1);
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    game.player.hasPaused = true;
    super.onTapDown(event);
    log('onTapDown');
  }

  @override
  void onTapUp(TapUpEvent event) {
    game.player.hasPaused = false;
    super.onTapUp(event);
    log('onTapUp');

    // game.overlays.remove('PauseButton');
    game.pauseEngine();
    FlameAudio.bgm.pause();
    game.overlays.add('PauseMenu');
  }
}
