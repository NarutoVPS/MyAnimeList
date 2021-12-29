import 'package:flutter/material.dart';
import 'package:mal/widgets/InfoBar.dart';

class AnimeTile extends StatelessWidget {
  final title;
  final imgUrl;
  final members;
  final startDate;

  // ignore: use_key_in_widget_constructors
  const AnimeTile(this.title, this.imgUrl, this.members, this.startDate);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      padding: const EdgeInsets.only(left: 8),
      height: 90,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(imgUrl),
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
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.black87),
                        overflow: TextOverflow.ellipsis,
                      ),
                      InfoBar(members, startDate),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.black87,
          ),
        ],
      ),
    );
  }
}
