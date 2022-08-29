import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

import '../model/photos.dart';

class PhotoList extends StatelessWidget {
  const PhotoList({Key? key, required this.photos}) : super(key: key);

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 0.9,
        children: List.generate(photos.length, (index) => ImageNetwork(
          image: photos[index].thumbnailUrl, height: size.width/2, width: size.width/2))
      ),
    );
  }
}
