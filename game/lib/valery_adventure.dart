import 'dart:async';
import 'dart:developer';
// import 'dart:io';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/painting.dart';
import 'package:valentures/components/jump_button.dart';
import 'package:valentures/components/player.dart';
import 'package:valentures/components/level.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:device_info_plus/device_info_plus.dart';
// import 'components/utils.dart';

class ValeryAdventure extends FlameGame
    with
        HasKeyboardHandlerComponents,
        DragCallbacks,
        HasCollisionDetection,
        TapCallbacks {
  @override
  Color backgroundColor() => const Color(0xFF211F30);
  late CameraComponent cam;
  // late AudioPlayerComponent _audioPlayerComponent;
  Player player = Player(character: "");
  late JoystickComponent joystick;
  bool showControls = true;
  bool playSounds = true;
  double soundVolume = 0.8;
  List<String> levelNames = ['Level-01', 'Level-02', 'Level-03', 'Congrat'];
  // List<String> levelNames = ['Congrat'];
  int currentLevelIndex = 0;
  int score = 0;
  double permille = 0.0;
  int cash = 5000;
  bool musicOnOff = true;

  // @override
  // bool debugMode = true;

  @override
  FutureOr<void> onLoad() async {

    // Flame.images.clearCache();
    // Flame.assets.clearCache();

    FlameAudio.play('mixkit_start_1.wav', volume: 1.0);

    Flame.device.fullScreen();

    // Load all images into cache
    await images.loadAllImages();

    loadLevel();

    // if (kIsWeb) {
    //   log('platform is Web');
    // } else if (Platform.isAndroid || Platform.isIOS) {
      showControls = true;
      addJoystick();
      add(JumpButton());        
    //   log('platform is Mobile');
    // }

    // final String? localIP = await getLocalIpAddress();
    const String localIP = "192.168.0.1";
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
		AndroidDeviceInfo androidInfo;
		IosDeviceInfo iosInfo;
    bool mobileSendError = false;

    try {
			androidInfo = await deviceInfo.androidInfo;
      log('Running on ${androidInfo.manufacturer}, ${androidInfo.brand}, ${androidInfo.model}, $localIP');

			// sendRequest('${androidInfo.manufacturer}, ${androidInfo.brand}, ${androidInfo.model}, $localIP');
    } catch (error) {
      log('Get android device error: $error');
      mobileSendError = true;
    }

		try{
			iosInfo = await deviceInfo.iosInfo;
      log('Running on ${iosInfo.utsname.machine}');

			// sendRequest('${iosInfo.utsname.machine}, ${iosInfo.model}, ${iosInfo.name}, $localIP');
		} catch (error) {
      log('Get ios device error: $error');
      mobileSendError = true;
    }

    if(mobileSendError){
      try {

        log('Running on desktop $localIP');

        // sendRequest('desktop $localIP');
      } catch (error) {
        log('Get desktop device error: $error');
      }
    }

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (showControls) {
      updateJoystick();
    }
    super.update(dt);
  }

  void addJoystick() {
    joystick = JoystickComponent(
      priority: 100,
      knob: SpriteComponent(
          sprite: Sprite(
            images.fromCache('HUD/Knob.png'),
          ),
          priority: 50),
      background: SpriteComponent(
          sprite: Sprite(
            images.fromCache('HUD/Joystick.png'),
          ),
          priority: 50),
      margin: const EdgeInsets.only(left: 32, bottom: 32),
    );

    add(joystick);

    joystick.priority = 100;
  }

  void updateJoystick() {
    switch (joystick.direction) {
      case JoystickDirection.left:
      case JoystickDirection.upLeft:
      case JoystickDirection.downLeft:
        player.horizontalMovement = -1;
        break;
      case JoystickDirection.right:
      case JoystickDirection.upRight:
      case JoystickDirection.downRight:
        player.horizontalMovement = 1;
        break;
      default:
        player.horizontalMovement = 0;
        break;
    }
  }

  void loadNextLevel() {
    removeWhere((component) => component is Level);

    if (currentLevelIndex < levelNames.length - 1) {
      currentLevelIndex++;
      loadLevel();
    } else {
      // no more levels
      currentLevelIndex = 0;
      loadLevel();
    }
  }

  void loadLevel() async {
      /* Ждем выбор игрока в меню */
      await Future.doWhile(() => Future.delayed(const Duration(milliseconds: 100)).then((_) => player.character == ''));

      log('loadLevel character: ${player.character}');

      Level world = Level(
        player: player,
        levelName: levelNames[currentLevelIndex],
      );

      cam = CameraComponent.withFixedResolution(
        world: world,
        width: 640,
        height: 360,
      );

      cam.viewfinder.anchor = Anchor.topLeft;

      addAll([cam, world]);

      world.priority = 1;
      cam.priority = 1;
  }

  @override
  Future<void> onRemove() async {
    // Optional based on your game needs.
    removeAll(children);
    processLifecycleEvents();
    Flame.images.clearCache();
    Flame.assets.clearCache();
    // Any other code that you want to run when the game is removed.
    FlameAudio.bgm.stop();
  }
}
