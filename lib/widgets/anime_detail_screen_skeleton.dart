import 'package:flutter/material.dart';
import 'package:mal/widgets/skeleton_container.dart';

class AnimeDetailScreenSkeleton extends StatefulWidget {
  const AnimeDetailScreenSkeleton({Key? key}) : super(key: key);

  @override
  State<AnimeDetailScreenSkeleton> createState() =>
      _AnimeDetailScreenSkeletonState();
}

class _AnimeDetailScreenSkeletonState extends State<AnimeDetailScreenSkeleton> {
  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 325,
            child: Stack(
              children: [
                Container(
                  height: 100,
                  color: Theme.of(context).primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(12.0),
                      padding: const EdgeInsets.all(10.0),
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black.withOpacity(0.04),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SkeletonContainer(15, 100),
                              const SizedBox(
                                height: 5.0,
                              ),
                              SkeletonContainer(15, 100),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SkeletonContainer(15, 100),
                              const SizedBox(
                                height: 5,
                              ),
                              SkeletonContainer(15, 100),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SkeletonContainer(15, 100),
                              const SizedBox(
                                height: 5,
                              ),
                              SkeletonContainer(15, 100),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SkeletonContainer(15, 100),
                              const SizedBox(
                                height: 5,
                              ),
                              SkeletonContainer(15, 100),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SkeletonContainer(15, 100),
                              const SizedBox(
                                height: 5,
                              ),
                              SkeletonContainer(15, 100),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Container(
                  height: 25,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            color: Colors.black12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    height: 15,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(10),
                    )),
                Container(
                    height: 15,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(10),
                    )),
                Container(
                    height: 15,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(10),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                    height: 15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(10),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    height: 15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(10),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SkeletonContainer(15, 100),
                          const SizedBox(
                            height: 5,
                          ),
                          SkeletonContainer(15, 100),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SkeletonContainer(15, 100),
                          const SizedBox(
                            height: 5,
                          ),
                          SkeletonContainer(15, 100),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SkeletonContainer(15, 100),
                          const SizedBox(
                            height: 5,
                          ),
                          SkeletonContainer(15, 100),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonContainer(15, 100),
                        const SizedBox(
                          height: 5,
                        ),
                        SkeletonContainer(15, 100),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonContainer(15, 100),
                        const SizedBox(
                          height: 5,
                        ),
                        SkeletonContainer(15, 100),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SkeletonContainer(15, 100),
                        const SizedBox(
                          height: 5,
                        ),
                        SkeletonContainer(15, 100),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 7, top: 12, bottom: 12),
            height: 340,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  child: Column(
                    children: [
                      SkeletonContainer(150, 100),
                      const SizedBox(
                        height: 10,
                      ),
                      SkeletonContainer(150, 100),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
