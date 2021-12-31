import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/anime_provider.dart';
import 'custom_text.dart';

class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<AnimeProvider>(context).animeDetails.title;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText('Source', 14, false),
                  CustomText(
                      Provider.of<AnimeProvider>(context).animeDetails.source,
                      15,
                      true),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText('Studio', 14, false),
                  CustomText(
                      Provider.of<AnimeProvider>(context).animeDetails.studio,
                      15,
                      true),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText('Rating', 14, false),
                  CustomText(
                      Provider.of<AnimeProvider>(context).animeDetails.rating,
                      15,
                      true),
                ],
              ),
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText('Season\n', 14, false),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText('Aired', 14, false),
                  CustomText(
                      Provider.of<AnimeProvider>(context).animeDetails.aired,
                      15,
                      true),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText('Licensors', 14, false),
                  CustomText(
                      Provider.of<AnimeProvider>(context)
                          .animeDetails
                          .licensors[0],
                      15,
                      true),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
