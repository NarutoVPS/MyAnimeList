import 'package:flutter/material.dart';

class SearchScreenSkeleton extends StatelessWidget {
  const SearchScreenSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: Container(
              height: 15,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.04),
                borderRadius: BorderRadius.circular(10),
              )),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.only(top: 8, left: 8),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, i) {
                return Container(
                  width: 110,
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.black.withOpacity(0.04),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Container(
                          height: 12,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.04),
                            borderRadius: BorderRadius.circular(10),
                          )),
                    ],
                  ),
                );
              }),
        ),
      ],
    );
  }
}
