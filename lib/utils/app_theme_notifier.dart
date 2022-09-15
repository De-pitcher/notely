import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notely/utils/shared_utility.dart';
import 'package:notely/utils/util.dart';

class AppThemeNotifier extends StateNotifier<AsyncValue<bool>> {
  AppThemeNotifier(this.defaultDarkModeValue)
      : super(AsyncData(defaultDarkModeValue));
  final bool defaultDarkModeValue;

  void toggleAppTheme(WidgetRef ref) async {
    bool isDarkModeEnabled = ref.watch(isDarkModeProvider.notifier).state =
        !ref.watch(isDarkModeProvider.notifier).state;
    ref
        .read(sharedUtitltyProvider)
        .setDarkModeEnabled(isDarkModeEnabled)
        .whenComplete(
          () => state = AsyncData(isDarkModeEnabled),
        );
  }
}

final appThemeStateProvider =
    StateNotifierProvider<AppThemeNotifier, AsyncValue<bool>>((ref) {
  final isDarkModeEnabled = ref.read(sharedUtitltyProvider).isDarkModeEnabled();
  return AppThemeNotifier(isDarkModeEnabled);
});
