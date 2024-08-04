
import 'dart:io';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:valentures/main.dart';

import '../valery_adventure.dart';


class PauseMenu extends StatelessWidget {
  // Reference to parent game.
  final ValeryAdventure game;

  const PauseMenu({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
    // const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);
    // const yellowTextColor = Color.fromRGBO(234, 211, 0, 1);

    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color(0xFF211F30),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const SizedBox(height: 40),
              SizedBox(
                width: 300,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {
                    game.overlays.remove('PauseMenu');
                    game.resumeEngine();
                    if(game.musicOnOff) FlameAudio.bgm.resume();
                    // game.removeAll(game.children);
                    // game.overlays.add('Menu');
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Играть',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: blackTextColor,
                      fontFamily: "PressStart2P",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 300,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {
                    FlameAudio.bgm.stop();
                    game.overlays.remove('PauseMenu');
                    game.onRemove();
                    RestartWidget.restartApp(context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Меню',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: blackTextColor,
                      fontFamily: "PressStart2P",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 300,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {
                    if (Platform.isAndroid) {
                        SystemNavigator.pop();
                    } else if (Platform.isIOS) {
                        exit(0);
                    }
                    else{
                      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    }   
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Выход',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: blackTextColor,
                      fontFamily: "PressStart2P",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}