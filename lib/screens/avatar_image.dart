import 'package:flutter/material.dart';
import 'package:portify/app_theme.dart';

class AvatarImage extends StatelessWidget {
  final ImageProvider imageProvider;
  const AvatarImage({required this.imageProvider});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: const EdgeInsets.all(4),
      decoration: avatarDecoration,
      child: Container(
        decoration: avatarDecoration,
        padding: const EdgeInsets.all(3),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
            ),
          ),
        ),
      ),
    );
  }
}
