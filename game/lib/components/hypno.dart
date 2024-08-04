import 'dart:async';

import 'package:flame/components.dart';
// import 'package:flame/events.dart';
// import 'package:flame_audio/flame_audio.dart';
import 'package:valentures/valery_adventure.dart';

class Hypno extends SpriteAnimationComponent with 
  HasGameRef<ValeryAdventure> {
  
  Hypno();

  @override
  FutureOr<void> onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('Other/hypno_sprite.png'),
      SpriteAnimationData.sequenced(
        amount: 16,
        stepTime: 0.05,
        textureSize: Vector2(400, 300),
      ),
    );
    position = Vector2( game.size.x / 9, game.size.y / 12 );
    priority = 100;
    
    return super.onLoad();
  }

  // @override
  // void onTapDown(TapDownEvent event) {
  //   super.onTapDown(event);
  // }

  // @override
  // void onTapUp(TapUpEvent event) {
  //   super.onTapUp(event);
  // }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
