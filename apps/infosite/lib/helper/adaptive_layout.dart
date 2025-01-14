import 'package:flutter/widgets.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    required this.layout,
    this.phoneLayout,
    super.key,
  });

  final Widget layout;
  final Widget? phoneLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (phoneLayout case Widget phoneLayout when constraints.maxWidth < 600) {
        return phoneLayout;
      } else {
        return layout;
      }
    });
  }
}
