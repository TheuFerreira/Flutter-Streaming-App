import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class VideoItemWidget extends StatelessWidget {
  final ImageProvider<Object> image;
  final String description;
  const VideoItemWidget({
    Key? key,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const width = 213.0;
    const height = 113.0;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: InkWell(
            onTap: () {
              // TODO: Play Video
            },
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 0),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: image,
                ),
              ),
              child: const Icon(
                FeatherIcons.play,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Text(
          description,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
