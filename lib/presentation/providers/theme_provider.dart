
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgetsapp/config/theme/app_theme.dart';

// Immutable color list provider
final colorListProvider = Provider((ref) => colorList);

// Simple boolean
final isDarkmodeProvider = StateProvider<bool>((ref) => false);

// Simple integer
final selectedColorProvider = StateProvider<int>((ref) => 0);

// An object of type AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

// Controllers or Notifiers
class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkmode);
  }

  void changeColorIndex(int index) {
    state = state.copyWith(selectedColor: index);
  }
}