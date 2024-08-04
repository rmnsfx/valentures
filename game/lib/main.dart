import 'package:flame/flame.dart';
import 'package:flame/game.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:valentures/components/license.dart';
import 'package:valentures/valery_adventure.dart';

import 'components/menu.dart';
import 'components/pause_menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  runApp(
    RestartWidget(
      child: GameWidget<ValeryAdventure>.controlled(
        gameFactory: ValeryAdventure.new,
        overlayBuilderMap: {
          'Menu': (_, game) => Menu(game: game),
          'PauseMenu': (_, game) => PauseMenu(game: game),
          'License': (_, game) => License(game: game),
        },
        initialActiveOverlays: const ['Menu'],
      )
    )
  );
}

class RestartWidget extends StatefulWidget {
  RestartWidget({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  // ignore: library_private_types_in_public_api
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}