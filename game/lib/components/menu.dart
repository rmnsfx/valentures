
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../valery_adventure.dart';
import 'level.dart';


class Menu extends StatelessWidget {
  // Reference to parent game.
  final ValeryAdventure game;

  const Menu({super.key, required this.game});


  @override
  Widget build(BuildContext context) {
    // const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
    const whiteTextColor = Color.fromRGBO(255, 255, 255, 1.0);
    const yellowTextColor = Color.fromRGBO(234, 211, 0, 1);

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
              Radius.circular(0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'VALENTURES',
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 40,
                  fontFamily: "PressStart2P",
                ),
              ),
              const Text(
                '"в клуб и обратно..."',
                style: TextStyle(
                  color: yellowTextColor,
                  fontSize: 20,
                  fontFamily: "PressStart2P",
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: 200,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      game.overlays.remove('Menu');
                      FlameAudio.play('mixkit_disappear.wav', volume: 1.0);
                      addBackgroundMusic(game);
                      game.player.character = "Valery";
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Валера',
                      style: TextStyle(
                        fontSize: 25.0,
                        color:Color(0xFF211F30),
                        fontFamily: "PressStart2P",
                      ),
                    ),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: 200,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      game.overlays.remove('Menu');
                      FlameAudio.play('mixkit_disappear.wav', volume: 1.0);
                      addBackgroundMusic(game);
                      game.player.character = "Kolya";
                      
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Колян',
                      style: TextStyle(
                        fontSize: 25.0,
                        color:Color(0xFF211F30),
                        fontFamily: "PressStart2P",
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: 200,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      game.overlays.remove('Menu');
                      FlameAudio.play('mixkit_disappear.wav', volume: 1.0);
                      addBackgroundMusic(game);
                      game.player.character = "Alexey";
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Лёха',
                      style: TextStyle(
                        fontSize: 25.0,
                        color:Color(0xFF211F30),
                        fontFamily: "PressStart2P",
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              const Text(
'''Используй Джойстик или Стрелки для передвижений. Space bar (пробел) для прыжков.
Собери как можно больше вещей и избегай противников.''',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: whiteTextColor,
                  fontSize: 14,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Возрастное ограничение 18+. ',
                      style: TextStyle(color: Colors.blue),
                    ),
                    TextSpan(
                      text: 'Пользовательское соглашение',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () { 
                          // game.overlays.remove('Menu'); 
                          game.overlays.add('License'); 
                          
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
