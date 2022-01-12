import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/anime_detail_provider.dart';
import 'custom_text.dart';

class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AnimeDetailProvider>(context).animeDetails.title;
    return Container(
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
                    const CustomText('Source', 14),
                    CustomText(
                        Provider.of<AnimeDetailProvider>(context)
                            .animeDetails
                            .source,
                        15),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText('Studio', 14),
                    CustomText(
                        Provider.of<AnimeDetailProvider>(context)
                            .animeDetails
                            .studio,
                        15),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText('Rating', 14),
                    CustomText(
                        Provider.of<AnimeDetailProvider>(context)
                            .animeDetails
                            .rating,
                        15),
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
              const CustomText('Season\n', 14),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText('Aired', 14),
                  CustomText(
                      Provider.of<AnimeDetailProvider>(context)
                          .animeDetails
                          .aired,
                      15),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText('Licensors', 14),
                  CustomText(
                      Provider.of<AnimeDetailProvider>(context)
                          .animeDetails
                          .licensors[0],
                      15),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
