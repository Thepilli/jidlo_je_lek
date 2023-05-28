// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

enum RelaxationType {
  afirmace_ranni,
  afirmace_zdravi,
  ambience_cafe,
  ambience_forest,
  ambience_ocean,
  ambience_storm,
  meditace_podvedomi,
  meditace_prani,
  meditace_vecerni
}

class RelaxationScreen extends StatefulWidget {
  const RelaxationScreen({super.key, required this.relaxationType});

  final RelaxationType relaxationType;

  @override
  State<RelaxationScreen> createState() => _RelaxationScreenState();
}

class _RelaxationScreenState extends State<RelaxationScreen> {
  final player = AssetsAudioPlayer();

  Duration songDuration = Duration.zero;
  Duration sliderPosition = Duration.zero;

  late String title;
  late String asset;
  String? description;
  late String? url;

  String labelFromMilliseconds(int time) {
    final int sHours = Duration(milliseconds: time).inHours;
    final int sMinutes = Duration(milliseconds: time).inMinutes;
    final int sSeconds = Duration(milliseconds: time).inSeconds;

    //final int rHours = sHours;
    final int rMinutes = sMinutes - (sHours * 60);
    final int rSeconds = sSeconds - (sMinutes * 60 + sHours * 60 * 60);

    return '${rMinutes < 10 ? '0' : ''}$rMinutes:${rSeconds < 10 ? '0' : ''}$rSeconds';
  }

  @override
  void initState() {
    super.initState();

    switch (widget.relaxationType) {
      case RelaxationType.afirmace_ranni:
        title = 'afirmace_ranni';
        asset = 'assets/audio/afirmace_ranni.mp3';
        description = 'Audionahrávku relaxace namluvili Odpověď uvnitř';
        url = 'https://www.odpoveduvnitr.cz/';
        break;
      case RelaxationType.afirmace_zdravi:
        title = 'afirmace_zdravi';
        asset = 'assets/audio/afirmace_zdravi.mp3';
        description = 'Audionahrávku relaxace namluvili Odpověď uvnitř';
        url = 'https://www.odpoveduvnitr.cz/';
        break;
      case RelaxationType.ambience_cafe:
        title = 'ambience_cafe';
        asset = 'assets/audio/ambience_cafe.mp3';
        description = 'Audionahrávku relaxace namluvili Odpověď uvnitř';
        url = 'https://www.odpoveduvnitr.cz/';
        break;
      case RelaxationType.ambience_forest:
        title = 'ambience_forest';
        asset = 'assets/audio/ambience_forest.mp3';
        description = 'Audionahrávku relaxace namluvili Odpověď uvnitř';
        url = 'https://www.odpoveduvnitr.cz/';
        break;
      case RelaxationType.ambience_ocean:
        title = 'ambience_ocean';
        asset = 'assets/audio/ambience_ocean.mp3';
        description = 'Audionahrávku relaxace namluvili Odpověď uvnitř';
        url = 'https://www.odpoveduvnitr.cz/';
        break;
      case RelaxationType.ambience_storm:
        title = 'ambience_storm';
        asset = 'assets/audio/ambience_storm.mp3';
        description = 'Audionahrávku relaxace namluvili Odpověď uvnitř';
        url = 'https://www.odpoveduvnitr.cz/';
        break;
      case RelaxationType.meditace_podvedomi:
        title = 'meditace_podvedomi';
        asset = 'assets/audio/meditace_podvedomi.mp3';
        description = 'Audionahrávku relaxace namluvili Odpověď uvnitř';
        url = 'https://www.odpoveduvnitr.cz/';
        break;
      case RelaxationType.meditace_prani:
        title = 'meditace_prani';
        asset = 'assets/audio/meditace_prani.mp3';
        description = 'Audionahrávku relaxace namluvili Odpověď uvnitř';
        url = 'https://www.odpoveduvnitr.cz/';
        break;
      case RelaxationType.meditace_vecerni:
        title = 'meditace_vecerni';
        asset = 'assets/audio/meditace_vecerni.mp3';
        description = 'Audionahrávku relaxace namluvili Odpověď uvnitř';
        url = 'https://www.odpoveduvnitr.cz/';
        break;
    }

    player.open(
      Audio(asset),
      autoStart: false,
    );

    player.current.listen((playingAudio) {
      if (playingAudio?.audio != null) {
        if (mounted) {
          setState(() {
            songDuration = playingAudio!.audio.duration;
          });
        }
      }
    });
    player.currentPosition.listen((currPosition) {
      if (mounted) {
        setState(() {
          sliderPosition = currPosition;
        });
      }
    });
  }

  @override
  void dispose() {
    player.stop();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        children: [
          if (description != null)
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    description!,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          Align(
            child: StreamBuilder(
              stream: player.isPlaying,
              builder: (context, asyncSnapshot) {
                final bool isPlaying = asyncSnapshot.data ?? false;
                return Semantics(
                  button: true,
                  child: GestureDetector(
                    onTap: () => player.playOrPause(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        color: Colors.pink,
                        width: 86,
                        height: 86,
                        child: Icon(
                          isPlaying
                              ? Icons.pause_rounded
                              : Icons.play_arrow_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 28.0, vertical: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SliderTheme(
                    data: const SliderThemeData(
                      trackHeight: 6,
                      inactiveTrackColor: Colors.green,
                      activeTrackColor: Colors.pinkAccent,
                      thumbColor: Colors.pink,
                    ),
                    child: Slider(
                      value: sliderPosition.inMilliseconds
                          .clamp(0, songDuration.inMilliseconds)
                          .toDouble(),
                      max: songDuration.inMilliseconds.toDouble(),
                      divisions: 100,
                      onChanged: (double value) {
                        if (mounted) {
                          setState(() {
                            sliderPosition = Duration(
                              milliseconds: value.toInt(),
                            );
                          });
                        }
                        player.seek(
                          Duration(
                            milliseconds: value.toInt(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          labelFromMilliseconds(sliderPosition.inMilliseconds),
                        ),
                        Text(
                          labelFromMilliseconds(songDuration.inMilliseconds),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
