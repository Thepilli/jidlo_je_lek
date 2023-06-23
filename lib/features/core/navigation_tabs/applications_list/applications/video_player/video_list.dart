import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacionar_app/constants/colors.dart';
import 'package:stacionar_app/features/core/navigation_tabs/applications_list/applications/video_player/video_screen.dart';
import 'package:toggle_switch/toggle_switch.dart';

class VideoTypes {
  const VideoTypes({
    required this.title,
    required this.season,
    required this.thumbnail,
    required this.video,
  });

  final String title;
  final String season;
  final String thumbnail;
  final String video;
}

List videoType = [
  const VideoTypes(
    title: 'How to Befriend a Ghost with Scaredy Cat Pusheen',
    season: '1',
    thumbnail: 'assets/video/How_to_Befriend_a_Ghost_with_Scaredy_Cat_Pusheen.jpg',
    video: 'assets/video/How_to_Befriend_a_Ghost_with_Scaredy_Cat_Pusheen.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: How To Tell If Your Cat is a Scaredy Cat',
    season: '1',
    thumbnail: 'assets/video/Pusheen_How_To_Tell_If_Your_Cat_is_a_Scaredy_Cat.jpg',
    video: 'assets/video/Pusheen_How_To_Tell_If_Your_Cat_is_a_Scaredy_Cat.mp4',
  ),
  const VideoTypes(
    title: 'Observing The Rare Mermaid Pusheenicorn',
    season: '1',
    thumbnail: 'assets/video/Observing_The_Rare_Mermaid_Pusheenicorn.jpg',
    video: 'assets/video/Observing_The_Rare_Mermaid_Pusheenicorn.mp4',
  ),
  const VideoTypes(
    title: 'Pusheenicorn Hairstyles',
    season: '1',
    thumbnail: 'assets/video/Pusheenicorn_Hairstyles.jpg',
    video: 'assets/video/Pusheenicorn_Hairstyles.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: Ghost Perks With Boosheen the Ghost',
    season: '1',
    thumbnail: 'assets/video/Pusheen_Ghost_Perks_With_Boosheen_the_Ghost.jpg',
    video: 'assets/video/Pusheen_Ghost_Perks_With_Boosheen_the_Ghost.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: The 4 Types of Mermaid Cats',
    season: '1',
    thumbnail: 'assets/video/Pusheen_The_4_Types_of_Mermaid_Cats.jpg',
    video: 'assets/video/Pusheen_The_4_Types_of_Mermaid_Cats.mp4',
  ),
  const VideoTypes(
    title: 'Dragonsheen\'s BBQ Techniques',
    season: '1',
    thumbnail: 'assets/video/Dragonsheen_s_BBQ_Techniques.jpg',
    video: 'assets/video/Dragonsheen_s_BBQ_Techniques.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: How to Contact Aliens',
    season: '1',
    thumbnail: 'assets/video/Pusheen_How_to_Contact_Aliens.jpg',
    video: 'assets/video/Pusheen_How_to_Contact_Aliens.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: Pusheenosaurus',
    season: '1',
    thumbnail: 'assets/video/Pusheen_Pusheenosaurus.jpg',
    video: 'assets/video/Pusheen_Pusheenosaurus.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: Staying Warm With Dragonsheen',
    season: '1',
    thumbnail: 'assets/video/Pusheen_Staying_Warm_With_Dragonsheen.jpg',
    video: 'assets/video/Pusheen_Staying_Warm_With_Dragonsheen.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: How to Tell if Your Cat is an Alien',
    season: '1',
    thumbnail: 'assets/video/Pusheen_How_to_Tell_if_Your_Cat_is_an_Alien.jpg',
    video: 'assets/video/Pusheen_How_to_Tell_if_Your_Cat_is_an_Alien.mp4',
  ),
  const VideoTypes(
    title: 'Pugsheen: How to Achieve Your Goals',
    season: '1',
    thumbnail: 'assets/video/Pugsheen_How_to_Achieve_Your_Goals.jpg',
    video: 'assets/video/Pugsheen_How_to_Achieve_Your_Goals.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: How to Tell if Your Cat is a Vampurr',
    season: '1',
    thumbnail: 'assets/video/Pusheen_How_to_Tell_if_Your_Cat_is_a_Vampurr.jpg',
    video: 'assets/video/Pusheen_How_to_Tell_if_Your_Cat_is_a_Vampurr.mp4',
  ),
  const VideoTypes(
    title: 'Pusheenicorn\'s Motivational Tips',
    season: '1',
    thumbnail: 'assets/video/Pusheenicorn_s_Motivational_Tips.jpg',
    video: 'assets/video/Pusheenicorn_s_Motivational_Tips.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: Pusheenicorn\'s Beauty Tips',
    season: '1',
    thumbnail: 'assets/video/Pusheen_Pusheenicorn_s_Beauty_Tips.jpg',
    video: 'assets/video/Pusheen_Pusheenicorn_s_Beauty_Tips.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: Dinosheens\' Survival Guide',
    season: '1',
    thumbnail: 'assets/video/Pusheen_Dinosheens_Survival_Guide.jpg',
    video: 'assets/video/Pusheen_Dinosheens_Survival_Guide.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: Pawsitive Affirmations with Super Pusheenicorn',
    season: '1',
    thumbnail: 'assets/video/Pusheen_Pawsitive_Affirmations_with_Super_Pusheenicorn.jpg',
    video: 'assets/video/Pusheen_Pawsitive_Affirmations_with_Super_Pusheenicorn.mp4',
  ),
  const VideoTypes(
    title: 'Pastel Pusheens',
    season: '1',
    thumbnail: 'assets/video/Pastel_Pusheens.jpg',
    video: 'assets/video/Pastel_Pusheens.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: Your cat may be a dragon if...',
    season: '1',
    thumbnail: 'assets/video/Pusheen_Your_cat_may_be_a_dragon_if....jpg',
    video: 'assets/video/Pusheen_Your_cat_may_be_a_dragon_if....mp4',
  ),
  const VideoTypes(
    title: 'Happy Birthday Pusheen',
    season: '2',
    thumbnail: 'assets/video/Happy_Birthday_Pusheen.jpg',
    video: 'assets/video/Happy_Birthday_Pusheen.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen Breads A Documentary',
    season: '2',
    thumbnail: 'assets/video/Pusheen_Breads_A_Documentary.jpg',
    video: 'assets/video/Pusheen_Breads_A_Documentary.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen s Guide to Ordering Online',
    season: '2',
    thumbnail: 'assets/video/Pusheen_s_Guide_to_Ordering_Online.jpg',
    video: 'assets/video/Pusheen_s_Guide_to_Ordering_Online.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen s Pumpkin Patch',
    season: '2',
    thumbnail: 'assets/video/Pusheen_s_Pumpkin_Patch.jpg',
    video: 'assets/video/Pusheen_s_Pumpkin_Patch.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen s Reading List for Thine Cat',
    season: '2',
    thumbnail: 'assets/video/Pusheen_s_Reading_List_for_Thine_Cat.jpg',
    video: 'assets/video/Pusheen_s_Reading_List_for_Thine_Cat.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen Boosheen s Haunted Manor',
    season: '2',
    thumbnail: 'assets/video/Pusheen_Boosheen_s_Haunted_Manor.jpg',
    video: 'assets/video/Pusheen_Boosheen_s_Haunted_Manor.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen Gaming with Your Cat',
    season: '2',
    thumbnail: 'assets/video/Pusheen_Gaming_with_Your_Cat.jpg',
    video: 'assets/video/Pusheen_Gaming_with_Your_Cat.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen Meowgical Girl',
    season: '2',
    thumbnail: 'assets/video/Pusheen_Meowgical_Girl.jpg',
    video: 'assets/video/Pusheen_Meowgical_Girl.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen Nightmare on Kitty Lane',
    season: '2',
    thumbnail: 'assets/video/Pusheen_Nightmare_on_Kitty_Lane.jpg',
    video: 'assets/video/Pusheen_Nightmare_on_Kitty_Lane.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen Pip s Present',
    season: '2',
    thumbnail: 'assets/video/Pusheen_Pip_s_Present.jpg',
    video: 'assets/video/Pusheen_Pip_s_Present.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen Player 2',
    season: '2',
    thumbnail: 'assets/video/Pusheen_Player_2.jpg',
    video: 'assets/video/Pusheen_Player_2.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen Trick or Treat',
    season: '2',
    thumbnail: 'assets/video/Pusheen_Trick_or_Treat.jpg',
    video: 'assets/video/Pusheen_Trick_or_Treat.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen Voyage to Planet Koo-Kee',
    season: '2',
    thumbnail: 'assets/video/Pusheen_Voyage_to_Planet_Koo-Kee.jpg',
    video: 'assets/video/Pusheen_Voyage_to_Planet_Koo-Kee.mp4',
  ),
];

class VideoList extends StatefulWidget {
  const VideoList({
    super.key,
  });

  @override
  State<VideoList> createState() => _VideoListState();
}

String selectedSeason = '1';

class _VideoListState extends State<VideoList> {
  @override
  Widget build(BuildContext context) {
    var isDark = Get.isDarkMode;
    var iconColor = isDark ? jPrimaryDarkColor : jPrimaryLightColor;
    var containerBorderColor = isDark ? jPrimaryDarkContainerColor : jPrimaryLightContainerColor;
    var scaffoldColor = isDark ? jScafoldDarkColor : jScafoldLightColor;
    List filteredVideoType = videoType.where((video) => video.season == selectedSeason).toList();

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: iconColor),
          elevation: 0,
          centerTitle: true,
          backgroundColor: scaffoldColor,
          title: Text(
            "Příběhy Pušínka",
            style: Theme.of(context).textTheme.displayLarge,
          )),
      body: SafeArea(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(color: scaffoldColor),
            padding: const EdgeInsets.all(8.0),
            child: Text('Vyber si video, které tě nejvíce zaujme',
                textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineLarge),
          ),
          Container(
            decoration: BoxDecoration(color: scaffoldColor),
            padding: const EdgeInsets.all(8.0),
            child: ToggleSwitch(
              minWidth: 200.0,
              initialLabelIndex: selectedSeason == '1' ? 0 : 1, // Set the initial selected season index
              cornerRadius: 20.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: const ['Sezona 1', 'Sezona 2'],
              activeBgColors: const [
                [Colors.teal],
                [Colors.teal]
              ],
              onToggle: (index) {
                setState(() {
                  if (index == 0) {
                    selectedSeason = '1';
                  } else {
                    selectedSeason = '2';
                  }
                  filteredVideoType = videoType.where((video) => video.season == selectedSeason).toList();
                });
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                itemCount: filteredVideoType.length,
                itemBuilder: (context, index) {
                  VideoTypes video = filteredVideoType[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: containerBorderColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: iconColor,
                      ),
                      child: ListTile(
                        minLeadingWidth: 130,
                        title: Text(video.title),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
                              builder: (context) => VideoScreen(
                                title: video.title,
                                season: video.season,
                                thumbnail: video.thumbnail,
                                video: video.video,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
