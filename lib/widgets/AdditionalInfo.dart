import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/animeProvider.dart';

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
              Text('Source\n' +
                  Provider.of<AnimeProvider>(context).animeDetails.source),
              const SizedBox(
                height: 10,
              ),
              Text('Studio\n' +
                  Provider.of<AnimeProvider>(context).animeDetails.studio),
              const SizedBox(
                height: 10,
              ),
              Text('Rating\n' +
                  Provider.of<AnimeProvider>(context).animeDetails.rating),
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Season\n'),
              const SizedBox(
                height: 10,
              ),
              Text('Aired\n' +
                  Provider.of<AnimeProvider>(context).animeDetails.aired),
              const SizedBox(
                height: 10,
              ),
              Text('Licensors\n' +
                  Provider.of<AnimeProvider>(context)
                      .animeDetails
                      .licensors[0]),
            ],
          ),
        ],
      ),
    );
  }
}
