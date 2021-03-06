import 'package:flutter/material.dart';

class NetworkImageBuilder extends StatelessWidget {
  const NetworkImageBuilder({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network(
        image,
        fit: BoxFit.fill,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );
  }
}
