import 'package:flutter/widgets.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('asset/logo-trans.png',fit: BoxFit.scaleDown);
  }
}
