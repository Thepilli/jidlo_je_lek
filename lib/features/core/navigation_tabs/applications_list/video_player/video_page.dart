import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/video_player/video_detail.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/video_player/video_season_provider.dart';
import 'package:stacionar_app/models/video.dart';
import 'package:stacionar_app/shared/extensions/build_context.dart';
import 'package:toggle_switch/toggle_switch.dart';

class VideoPage extends ConsumerWidget {
  const VideoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedSeason = ref.watch(videoSeasonProvider);
    List<VideoModel> videos = videoList.where((element) => element.season == selectedSeason).toList();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: ToggleSwitch(
                minWidth: context.sizeWidth / 4,
                fontSize: 10,
                initialLabelIndex: selectedSeason, // Set the initial selected season index
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                totalSwitches: 2,

                labels: const ['Sezona 1', 'Sezona 2'],
                activeBgColors: [
                  [context.primary],
                  [context.primary]
                ],
                onToggle: (index) {
                  ref.read(videoSeasonProvider.notifier).onSwitch(index);
                },
              ),
            ),
          ),
          SliverList.builder(
            itemCount: videos.length,
            itemBuilder: (context, index) {
              VideoModel video = videos[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    tileColor: context.primary.withOpacity(.6),
                    title: Text(video.title, style: context.textTheme.bodyLarge),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        video.thumbnail,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoDetail(
                            video: video,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
