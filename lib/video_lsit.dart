import 'package:flutter/material.dart';

import 'video_screen.dart';

class VideoTypes {
  const VideoTypes({
    required this.title,
    required this.url,
    required this.thumbnail,
    required this.video,
  });

  final String title;
  final String url;
  final String thumbnail;
  final String video;
}

List videoType = [
  const VideoTypes(
    title: 'How to Befriend a Ghost with Scaredy Cat Pusheen',
    url: 'https://youtu.be/pq2fiD0kqmc',
    thumbnail:
        'assets/video/How_to_Befriend_a_Ghost_with_Scaredy_Cat_Pusheen.jpg',
    video: 'assets/video/How_to_Befriend_a_Ghost_with_Scaredy_Cat_Pusheen.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: How To Tell If Your Cat is a Scaredy Cat',
    url: 'https://youtu.be/ax9uYL4TNKc',
    thumbnail:
        'assets/video/Pusheen_How_To_Tell_If_Your_Cat_is_a_Scaredy_Cat.jpg',
    video: 'assets/video/Pusheen_How_To_Tell_If_Your_Cat_is_a_Scaredy_Cat.mp4',
  ),
  const VideoTypes(
    title: 'Observing The Rare Mermaid Pusheenicorn',
    url: 'https://youtu.be/xNfdTE8WNyI',
    thumbnail: 'assets/video/Observing_The_Rare_Mermaid_Pusheenicorn.jpg',
    video: 'assets/video/Observing_The_Rare_Mermaid_Pusheenicorn.mp4',
  ),
  const VideoTypes(
    title: 'Pusheenicorn Hairstyles',
    url: 'https://youtu.be/BAt7D7zlCbI',
    thumbnail: 'assets/video/Pusheenicorn_Hairstyles.jpg',
    video: 'assets/video/Pusheenicorn_Hairstyles.mp4',
  ),
  const VideoTypes(
    title: 'Mermaid Pusheen\'s Treasure Hunt',
    url: 'https://youtu.be/kmChzsv7_PI',
    thumbnail: 'assets/video/Mermaid_Pusheen_s_Treasure_Hunt.jpg',
    video: 'assets/video/Mermaid_Pusheen_s_Treasure_Hunt.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: Meowgical Girl',
    url: 'https://youtu.be/E_bG4NAcwjg',
    thumbnail: 'assets/video/Pusheen_Meowgical_Girl.jpg',
    video: 'assets/video/Pusheen_Meowgical_Girl.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: Ghost Perks With Boosheen the Ghost',
    url: 'https://youtu.be/7DSfry6kcZE',
    thumbnail: 'assets/video/Pusheen_Ghost_Perks_With_Boosheen_the_Ghost.jpg',
    video: 'assets/video/Pusheen_Ghost_Perks_With_Boosheen_the_Ghost.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: Voyage to Planet Koo-Kee',
    url: 'https://youtu.be/_6cOAcMrcQo',
    thumbnail: 'assets/video/Pusheen_Voyage_to_Planet_Koo-Kee.jpg',
    video: 'assets/video/Pusheen_Voyage_to_Planet_Koo-Kee.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: The 4 Types of Mermaid Cats',
    url: 'https://youtu.be/fZzzukdhJSU',
    thumbnail: 'assets/video/Pusheen_The_4_Types_of_Mermaid_Cats.jpg',
    video: 'assets/video/Pusheen_The_4_Types_of_Mermaid_Cats.mp4',
  ),
  const VideoTypes(
    title: 'Dragonsheen\'s BBQ Techniques',
    url: 'https://youtu.be/HfBRmY1zUPI',
    thumbnail: 'assets/video/Dragonsheen_s_BBQ_Techniques.jpg',
    video: 'assets/video/Dragonsheen_s_BBQ_Techniques.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: How to Contact Aliens',
    url: 'https://youtu.be/I4huuyQEEUE',
    thumbnail: 'assets/video/Pusheen_How_to_Contact_Aliens.jpg',
    video: 'assets/video/Pusheen_How_to_Contact_Aliens.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: Pusheenosaurus',
    url: 'https://youtu.be/RRfunj92HgA',
    thumbnail: 'assets/video/Pusheen_Pusheenosaurus.jpg',
    video: 'assets/video/Pusheen_Pusheenosaurus.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: Staying Warm With Dragonsheen',
    url: 'https://youtu.be/4ltMmH0tS_I',
    thumbnail: 'assets/video/Pusheen_Staying_Warm_With_Dragonsheen.jpg',
    video: 'assets/video/Pusheen_Staying_Warm_With_Dragonsheen.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: How to Tell if Your Cat is an Alien',
    url: 'https://youtu.be/ikIAO6xN4gs',
    thumbnail: 'assets/video/Pusheen_How_to_Tell_if_Your_Cat_is_an_Alien.jpg',
    video: 'assets/video/Pusheen_How_to_Tell_if_Your_Cat_is_an_Alien.mp4',
  ),
  const VideoTypes(
    title: 'Pugsheen: How to Achieve Your Goals',
    url: 'https://youtu.be/iKwZ_G_F_x0',
    thumbnail: 'assets/video/Pugsheen_How_to_Achieve_Your_Goals.jpg',
    video: 'assets/video/Pugsheen_How_to_Achieve_Your_Goals.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: How to Tell if Your Cat is a Vampurr',
    url: 'https://youtu.be/nECyeeQXOwI',
    thumbnail: 'assets/video/Pusheen_How_to_Tell_if_Your_Cat_is_a_Vampurr.jpg',
    video: 'assets/video/Pusheen_How_to_Tell_if_Your_Cat_is_a_Vampurr.mp4',
  ),
  const VideoTypes(
    title: 'Pusheenicorn\'s Motivational Tips',
    url: 'https://youtu.be/B77XXWJKQh8',
    thumbnail: 'assets/video/Pusheenicorn_s_Motivational_Tips.jpg',
    video: 'assets/video/Pusheenicorn_s_Motivational_Tips.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: Pusheenicorn\'s Beauty Tips',
    url: 'https://youtu.be/A0Xm3vKfaW0',
    thumbnail: 'assets/video/Pusheen_Pusheenicorn_s_Beauty_Tips.jpg',
    video: 'assets/video/Pusheen_Pusheenicorn_s_Beauty_Tips.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: Dinosheens\' Survival Guide',
    url: 'https://youtu.be/6cMwhwNerYc',
    thumbnail: 'assets/video/Pusheen_Dinosheens_Survival_Guide.jpg',
    video: 'assets/video/Pusheen_Dinosheens_Survival_Guide.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: Pawsitive Affirmations with Super Pusheenicorn',
    url: 'https://youtu.be/v06ppwFw2vE',
    thumbnail:
        'assets/video/Pusheen_Pawsitive_Affirmations_with_Super_Pusheenicorn.jpg',
    video:
        'assets/video/Pusheen_Pawsitive_Affirmations_with_Super_Pusheenicorn.mp4',
  ),
  const VideoTypes(
    title: 'Pastel Pusheens',
    url: 'https://youtu.be/PD5uNvbnP1U',
    thumbnail: 'assets/video/Pastel_Pusheens.jpg',
    video: 'assets/video/Pastel_Pusheens.mp4',
  ),
  const VideoTypes(
    title: 'Pusheen: Your cat may be a dragon if...',
    url: 'https://youtu.be/MDCvIEn1w98',
    thumbnail: 'assets/video/Pusheen_Your_cat_may_be_a_dragon_if....jpg',
    video: 'assets/video/Pusheen_Your_cat_may_be_a_dragon_if....mp4',
  ),
];

class VideoList extends StatelessWidget {
  const VideoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Vyber si video, které tě nejvíce zaujme',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                itemCount: videoType.length,
                itemBuilder: (context, index) {
                  VideoTypes video = videoType[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.greenAccent.withOpacity(0.3),
                      ),
                      child: ListTile(
                        minLeadingWidth: 130,
                        title: Text(video.title),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
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
                                url: video.url,
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
