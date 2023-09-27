import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_season_provider.g.dart';

@riverpod
class VideoSeason extends _$VideoSeason {
  @override
  int build() {
    return 0;
  }

  void onSwitch(index) {
    state = index;
  }
}
