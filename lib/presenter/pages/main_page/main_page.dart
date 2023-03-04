import 'package:flutter/material.dart';
import 'package:streaming_app/presenter/pages/main_page/widgets/notification_button_widget.dart';
import 'package:streaming_app/presenter/pages/main_page/widgets/player_list_widget.dart';
import 'package:streaming_app/presenter/pages/main_page/widgets/playlist_item_widget.dart';
import 'package:streaming_app/presenter/pages/main_page/widgets/user_info_widget.dart';
import 'package:streaming_app/presenter/pages/main_page/widgets/video_item_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                          normalColor: const Color(0xFF484848),
                          notificationColor: const Color(0xFF967BE3),
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
                  ),
                  VideoItemWidget(
                    image: Image.asset('assets/temp/01.jpg').image,
                    description: 'Temporada 2: Episódio 10',
                  )
                ],
              ),
              PlayerListWidget(
                title: 'Em alta:',
                childrens: [
                  PlaylistItemWidget(
                    image: Image.asset('assets/temp/02.jpg').image,
                    description: 'La Casa de Papel',
                  ),
                  PlaylistItemWidget(
                    image: Image.asset('assets/temp/02.jpg').image,
                    description: 'La Casa de Papel',
                  ),
                  PlaylistItemWidget(
                    image: Image.asset('assets/temp/02.jpg').image,
                    description: 'La Casa de Papel',
                  ),
                ],
              ),
              PlayerListWidget(
                title: 'Lançamentos:',
                childrens: [
                  PlaylistItemWidget(
                    image: Image.asset('assets/temp/02.jpg').image,
                    description: 'La Casa de Papel',
                  ),
                  PlaylistItemWidget(
                    image: Image.asset('assets/temp/02.jpg').image,
                    description: 'La Casa de Papel',
                  ),
                  PlaylistItemWidget(
                    image: Image.asset('assets/temp/02.jpg').image,
                    description: 'La Casa de Papel',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
