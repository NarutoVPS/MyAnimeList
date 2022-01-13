import 'package:flutter/material.dart';
import 'package:mal/models/app_state_provider.dart';
import 'package:mal/utils/colors.dart';
import 'package:mal/widgets/skeleton_container.dart';
import 'package:provider/provider.dart';

class SearchResultSkeleton extends StatelessWidget {
  const SearchResultSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<AppStateProvider>(context).themeMode == 'LIGHT'
          ? BACKGROUND_LIGHT
          : Colors.grey,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, i) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SkeletonContainer(150, 100),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 12.0,
                                top: 8.0,
                                bottom: 8.0,
                              ),
                              height: 150,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      SkeletonContainer(15, 100),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      SkeletonContainer(25, 25),
                                    ],
                                  ),
                                  const SkeletonContainer(15, double.infinity),
                                  const SkeletonContainer(15, double.infinity),
                                  const SkeletonContainer(15, 75),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
