import 'package:flutter/widgets.dart';

enum SpacerSize { normal, small, large }

class SizedSpacer extends StatelessWidget {
  final SpacerSize size;
  const SizedSpacer({
    Key? key,
    this.size = SpacerSize.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (size) {
      case SpacerSize.large:
        return const SizedBox.square(dimension: 32);
      case SpacerSize.small:
        return const SizedBox.square(dimension: 8);
      default:
        return const SizedBox.square(dimension: 16);
    }
  }
}
