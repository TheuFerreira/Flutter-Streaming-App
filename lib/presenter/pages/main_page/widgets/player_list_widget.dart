import 'package:flutter/material.dart';

class PlayerListWidget extends StatelessWidget {
  final String title;
  final List<Widget> childrens;
  const PlayerListWidget({
    Key? key,
    required this.title,
    required this.childrens,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            physics: const BouncingScrollPhysics(),
            child: Row(children: childrens),
          ),
        ],
      ),
    );
  }
}
