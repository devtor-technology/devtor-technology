import 'dart:async';

import 'package:devtor_technology_siteinfo/helper/adaptive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'component/header.dart';
import 'component/logo.dart';

part 'application.provider.dart';
part 'application.state.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Devtor Technology',
      theme: ThemeData(useMaterial3: true),
      home: const Scaffold(body: _ApplicationView()),
    );
  }
}

class _ApplicationView extends ConsumerWidget {
  const _ApplicationView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(applicationNotifierProvider);
    return AdaptiveLayout(
      layout: _ApplicationLayout(state),
      phoneLayout: _ApplicationPhoneLayout(state),
    );
  }
}

class _ApplicationLayout extends StatelessWidget {
  const _ApplicationLayout(this.state);

  final ApplicationState state;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: AnimatedOpacity(
              duration: Durations.long1,
              curve: Curves.easeInOut,
              opacity: state != ApplicationState.boot ? 1 : 0,
              child: AnimatedContainer(
                duration: Durations.extralong1,
                curve: Curves.linearToEaseOut,
                height: state == ApplicationState.title ? 70 : 250,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Logo(),
                    AnimatedContainer(
                      width: state == ApplicationState.title ? 380 : 0,
                      duration: Durations.medium4,
                      curve: Curves.easeInOutCubicEmphasized,
                      child: const Header(alignment: Alignment.centerLeft),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ApplicationPhoneLayout extends StatelessWidget {
  const _ApplicationPhoneLayout(this.state);

  final ApplicationState state;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: AnimatedOpacity(
              duration: Durations.long1,
              curve: Curves.easeInOut,
              opacity: state != ApplicationState.boot ? 1 : 0,
              child: AnimatedContainer(
                duration: Durations.extralong1,
                curve: Curves.linearToEaseOut,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      width: state == ApplicationState.title ? 180 : 380,
                      duration: Durations.medium4,
                      curve: Curves.easeInOutCubicEmphasized,
                      child: const Logo(),
                    ),
                    Visibility(
                      visible: state == ApplicationState.title,
                      child: AnimatedContainer(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: state == ApplicationState.title ? 380 : 0,
                        duration: Durations.medium4,
                        curve: Curves.easeInOutCubicEmphasized,
                        alignment: Alignment.center,
                        child: const Header(alignment: Alignment.center),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
