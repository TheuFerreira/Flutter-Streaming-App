import 'package:flutter/material.dart';
import 'package:streaming_app/presenter/pages/main_page/widgets/notification_button_widget.dart';
import 'package:streaming_app/presenter/pages/main_page/widgets/player_list_widget.dart';
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SizedBox(
                width: double.infinity,
                height: 90,
                child: Stack(
                  children: [
                    Positioned(
                      top: 1,
                      right: 1,
                      child: NotificationButtonWidget(
                        normalColor: const Color(0xFF484848),
                        notificationColor: const Color(0xFF967BE3),
                        onTap: () {},
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      left: 1,
                      child: UserInfoWidget(
                        photo: Image.asset('assets/temp/perfil.jpg'),
                        username: 'Alessandra',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            PlayerListWidget(
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
          ],
        ),
      ),
    );
  }
}
