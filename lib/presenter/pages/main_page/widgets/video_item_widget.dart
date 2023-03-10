import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class VideoItemWidget extends StatelessWidget {
  final ImageProvider<Object> image;
  final String description;
  final void Function() onTap;
  const VideoItemWidget({
    Key? key,
    required this.image,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const width = 213.0;
    const height = 113.0;
    final borderRadius = BorderRadius.circular(12);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: borderRadius,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 0),
                    blurRadius: 6,
                    spreadRadius: 1,
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: image,
                ),
              ),
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.6),
                  borderRadius: borderRadius,
                ),
                child: const Icon(
                  FeatherIcons.play,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
