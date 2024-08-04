import 'package:flame/components.dart';

import '../valery_adventure.dart';

class Permille extends TextComponent with HasGameRef<ValeryAdventure> {
  late String permille;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    permille = game.permille.toString();
    text = "PER MILLE: $permille";
    position = Vector2(game.size.x / 4, 35);
    scale = Vector2(0.5, 0.5);
  } 

  @override
  void update(double dt) {
    super.update(dt);
    permille = game.permille.toString();
    text = "PER MILLE: $permille";
  }
}

