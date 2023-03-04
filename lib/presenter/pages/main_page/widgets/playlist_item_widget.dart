import 'package:flutter/material.dart';

class PlaylistItemWidget extends StatelessWidget {
  final ImageProvider<Object> image;
  final String description;
  final void Function() onTap;
  const PlaylistItemWidget({
    Key? key,
    required this.image,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
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
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
