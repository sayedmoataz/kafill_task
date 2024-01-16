import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  String imagePath;
  bool isNetwork;
  AvatarWidget({required this.imagePath, required this.isNetwork, super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundImage: isNetwork == true
          ? NetworkImage(imagePath) as ImageProvider<Object>?
          : AssetImage(imagePath),
    );
  }
}
