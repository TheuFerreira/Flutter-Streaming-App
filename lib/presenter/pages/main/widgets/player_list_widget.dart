import 'package:flutter/material.dart';

class PlayerListWidget extends StatelessWidget {
  final String title;
  final List<Widget> childrens;
  final bool showSeeMore;
  final void Function()? onTap;
  const PlayerListWidget({
    Key? key,
    required this.title,
    required this.childrens,
    this.showSeeMore = false,
    this.onTap,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Visibility(
                  visible: showSeeMore,
                  child: GestureDetector(
                    onTap: onTap,
                    child: RichText(
                      text: TextSpan(
                        text: 'Veja mais',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: const Color(0xFFB49AFF),
                                  decoration: TextDecoration.underline,
                                ),
                        children: const [
                          TextSpan(text: ' >'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
