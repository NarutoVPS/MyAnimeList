import 'package:flutter/material.dart';
import 'package:mal/widgets/infobar.dart';

class AnimeTile extends StatelessWidget {
  final String title;
  final String imgUrl;
  final int members;
  final String startDate;

  // ignore: use_key_in_widget_constructors
  const AnimeTile(this.title, this.imgUrl, this.members, this.startDate);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      padding: const EdgeInsets.only(left: 8),
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(imgUrl),
                backgroundColor: Colors.black.withOpacity(0.04),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      InfoBar(members, startDate),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
