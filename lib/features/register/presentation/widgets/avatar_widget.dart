import 'package:flutter/widgets.dart';

class AvatarWidget extends StatelessWidget {
  Widget child;
  AvatarWidget({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: child,
    );
  }
}
