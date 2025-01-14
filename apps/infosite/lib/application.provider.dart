part of 'application.dart';

// final applicationState
final applicationNotifierProvider =
    NotifierProvider.autoDispose<ApplicationNotifier, ApplicationState>(ApplicationNotifier.new);

class ApplicationNotifier extends AutoDisposeNotifier<ApplicationState> {
  @override
  ApplicationState build() {
    initial();
    return ApplicationState.boot;
  }

  void initial() {
    Future.delayed(Duration.zero, () => state = ApplicationState.splash);
    Future.delayed(Durations.long2, () => state = ApplicationState.title);
  }
}
