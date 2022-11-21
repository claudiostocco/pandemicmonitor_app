import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  const Separator({Key? key, this.flex = 1}) : super(key: key);

  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: const SizedBox(),
    );
  }
}

class LineSeparator extends StatelessWidget {
  const LineSeparator({Key? key, this.flex, this.height = 10, this.thickness = 2}) : super(key: key);

  final int? flex;
  final double height;
  final double thickness;

  @override
  Widget build(BuildContext context) {
    var _divider = Divider(
      height: height,
      thickness: thickness,
    );

    if (flex == null) {
      return Padding(
        padding: const EdgeInsets.all(5),
        child: _divider,
      );
    } else {
      return Expanded(
        flex: flex ?? 1,
        child: _divider,
      );
    }
  }
}
