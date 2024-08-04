
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../valery_adventure.dart';

class License extends StatelessWidget {
  // Reference to parent game.
  final ValeryAdventure game;

  const License({super.key, required this.game});
  
  @override
  Widget build(BuildContext context) {
    // const blackTextColor = Color.fromRGBO(0, 0, 0, 1.0);
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
          child: FutureBuilder<String>(
            future: loadAsset(),
            initialData: "Loading text..",
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  scrollDirection: Axis.vertical,
                  child: Column (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ 
                      Text(
                        snapshot.data.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          // fontWeight: FontWeight.bold,
                          // fontStyle: FontStyle.italic,
                          color: Colors.white,
                          // letterSpacing: 8,
                          // wordSpacing: 20,
                        ),
                      ),
                      TextButton(
                        style: const ButtonStyle(
                          // foregroundColor: whiteTextColor,
                        ),
                        onPressed: () { 
                          game.overlays.remove('License');
                        },
                        child: const Text('Принимаю'),
                      )
                    ],
                  ) 
                );
            },
          )
        ),
      ),
    );
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/txt/license.txt');
  }

}
