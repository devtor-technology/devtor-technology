part of 'header.dart';

final titleTypeWriterNotifierProvider =
    NotifierProvider.autoDispose<TitleTypeWriterNotifier, String?>(TitleTypeWriterNotifier.new);

class TitleTypeWriterNotifier extends AutoDisposeNotifier<String?> {
  final words = ['future', 'freedom', 'favorite', 'identity', 'tolerant'];

  var index = 0;

  @override
  String? build() {
    return null;
  }

  void write() {
    state = words[index];
    if (index < words.length - 1) {
      index = index + 1;
    } else {
      index = 0;
    }
  }

  void eraser() {
    state = null;
  }
}
