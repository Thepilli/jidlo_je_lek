// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/relaxation/relaxation_list.dart';
import 'package:stacionar_app/widgets/contrained_container.dart';

class RelaxationScreen extends StatefulWidget {
  const RelaxationScreen({
    Key? key,
    required this.relaxationType,
    required this.tileTitle,
    required this.description,
    required this.title,
    required this.track,
    required this.tileAsset,
    required this.background,
  }) : super(key: key);

  final String relaxationType;
  final String tileTitle;
  final String description;
  final String title;
  final String track;
  final String tileAsset;
  final String background;

  @override
  State<RelaxationScreen> createState() => _RelaxationScreenState();
}

class _RelaxationScreenState extends State<RelaxationScreen> {
  final player = AssetsAudioPlayer();

  Duration songDuration = Duration.zero;
  Duration sliderPosition = Duration.zero;

  String labelFromMilliseconds(int time) {
    final int sHours = Duration(milliseconds: time).inHours;
    final int sMinutes = Duration(milliseconds: time).inMinutes;
    final int sSeconds = Duration(milliseconds: time).inSeconds;

    final int rMinutes = sMinutes - (sHours * 60);
    final int rSeconds = sSeconds - (sMinutes * 60 + sHours * 60 * 60);

    return '${rMinutes < 10 ? '0' : ''}$rMinutes:${rSeconds < 10 ? '0' : ''}$rSeconds';
  }

  @override
  void initState() {
    super.initState();

    RelaxationTypes relaxation = relaxationType.firstWhere(
      (type) => type.relaxationType == widget.relaxationType,
    );

    player.open(
      Audio(relaxation.asset),
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
    RelaxationTypes relaxation = relaxationType.firstWhere(
      (type) => type.relaxationType == widget.relaxationType,
    );

    return SafeArea(
      child: Scaffold(
        floatingActionButton: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: FloatingActionButton(
              foregroundColor: Colors.white,
              backgroundColor: Colors.greenAccent.withOpacity(0.3),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        body: ConstrainedContainer(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(relaxation.background),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 28.0,
                          right: 28.0,
                          top: 115,
                        ),
                        child: Text(
                          relaxation.title,
                          style: relaxation.background == 'assets/audio/afirmace.png'
                              ? Theme.of(context).textTheme.headlineMedium
                              : Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 28.0,
                          right: 28.0,
                          top: 10,
                        ),
                        child: Text(
                          relaxation.description,
                          style: relaxation.background == 'assets/audio/afirmace.png'
                              ? Theme.of(context).textTheme.headlineSmall
                              : Theme.of(context).textTheme.titleSmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, bottom: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(244, 233, 215, 0.7),
                            ),
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
                                    value: sliderPosition.inMilliseconds.clamp(0, songDuration.inMilliseconds).toDouble(),
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
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0, bottom: 20),
                          child: StreamBuilder(
                            stream: player.isPlaying,
                            builder: (context, asyncSnapshot) {
                              final bool isPlaying = asyncSnapshot.data ?? false;
                              return GestureDetector(
                                onTap: () => player.playOrPause(),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Container(
                                    color: Colors.pink,
                                    width: 65,
                                    height: 65,
                                    child: Icon(
                                      isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
