import 'package:flutter/material.dart';

class PlaylistItemWidget extends StatelessWidget {
  final ImageProvider<Object> image;
  final String description;
  const PlaylistItemWidget({
    Key? key,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
          child: Container(
            height: 185,
            width: 132,
            decoration: BoxDecoration(
              color: const Color(0xFF06040C),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: image,
              ),
            ),
          ),
        ),
        Text(
          description,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
