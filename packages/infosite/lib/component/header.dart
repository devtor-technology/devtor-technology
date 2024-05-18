import 'dart:async';

import 'package:devtor_technology_siteinfo/component/typewriter_text/typewriter_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'header.provider.dart';

class Header extends ConsumerStatefulWidget {
  const Header({required this.alignment, super.key});

  final Alignment alignment;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HeaderState();
  }
}

class _HeaderState extends ConsumerState<Header> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(titleTypeWriterNotifierProvider.notifier).write();
      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        if (!mounted) return;
        ref.read(titleTypeWriterNotifierProvider.notifier).eraser();
        Future.delayed(const Duration(milliseconds: 1), () {
          if (!mounted) return;
          ref.read(titleTypeWriterNotifierProvider.notifier).write();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isTitleEmpty = ref.watch(titleTypeWriterNotifierProvider)?.isNotEmpty ?? false;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: widget.alignment,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 40,
          child: FittedBox(
            child: Text(
              'DEVTOR TECHNOLOGY',
              softWrap: false,
              style: textTheme.displaySmall,
              maxLines: 1,
            ),
          ),
        ),
        Container(
          alignment: widget.alignment,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 25,
          child: FittedBox(
            child: Row(
              children: [
                Text('Focus on the', style: textTheme.titleLarge),
                Visibility(
                  visible: isTitleEmpty,
                  child: Consumer(builder: (context, ref, _) {
                    final title = ref.watch(titleTypeWriterNotifierProvider);
                    return TypeWriterText(
                      text: Text(' $title.', style: textTheme.titleLarge),
                      duration: const Duration(milliseconds: 50),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
