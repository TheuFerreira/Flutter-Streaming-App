import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:streaming_app/presenter/pages/main/widgets/bottom_navigation_item_widget.dart';
import 'package:streaming_app/presenter/pages/main/widgets/notification_button_widget.dart';
import 'package:streaming_app/presenter/pages/main/widgets/player_list_widget.dart';
import 'package:streaming_app/presenter/pages/main/widgets/playlist_item_widget.dart';
import 'package:streaming_app/presenter/pages/main/widgets/user_info_widget.dart';
import 'package:streaming_app/presenter/pages/main/widgets/video_item_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NotificationButtonWidget(
                          onTap: () {
                            // TODO: Open Notifications
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        UserInfoWidget(
                          photo: Image.asset('assets/temp/perfil.jpg'),
                          username: 'Alessandra',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              PlayerListWidget(
                title: 'Continue assistindo:',
                childrens: [
                  VideoItemWidget(
                    image: Image.asset('assets/temp/01.jpg').image,
                    description: 'Temporada 2: Episódio 10',
                    onTap: () {},
                  ),
                  VideoItemWidget(
                    image: Image.asset('assets/temp/01.jpg').image,
                    description: 'Temporada 2: Episódio 10',
                    onTap: () {},
                  )
                ],
              ),
              PlayerListWidget(
                title: 'Em alta:',
                childrens: [
                  PlaylistItemWidget(
                    image: Image.asset('assets/temp/02.jpg').image,
                    description: 'La Casa de Papel',
                    onTap: () {},
                  ),
                  PlaylistItemWidget(
                    image: Image.asset('assets/temp/02.jpg').image,
                    description: 'La Casa de Papel',
                    onTap: () {},
                  ),
                  PlaylistItemWidget(
                    image: Image.asset('assets/temp/02.jpg').image,
                    description: 'La Casa de Papel',
                    onTap: () {},
                  ),
                ],
              ),
              PlayerListWidget(
                title: 'Lançamentos:',
                showSeeMore: true,
                onTap: () {
                  // TODO: Tap See More
                },
                childrens: [
                  PlaylistItemWidget(
                    image: Image.asset('assets/temp/02.jpg').image,
                    description: 'La Casa de Papel',
                    onTap: () {},
                  ),
                  PlaylistItemWidget(
                    image: Image.asset('assets/temp/02.jpg').image,
                    description: 'La Casa de Papel',
                    onTap: () {},
                  ),
                  PlaylistItemWidget(
                    image: Image.asset('assets/temp/02.jpg').image,
                    description: 'La Casa de Papel',
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavigationItemWidget(
              icon: FeatherIcons.home,
              onTap: () {},
            ),
            BottomNavigationItemWidget(
              icon: FeatherIcons.search,
              onTap: () {},
            ),
            BottomNavigationItemWidget(
              icon: FeatherIcons.heart,
              onTap: () {},
            ),
            BottomNavigationItemWidget(
              icon: Icons.account_circle_outlined,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
