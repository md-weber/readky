# Flutter Migration Guide - Readky News App Template

This guide walks you through migrating the Readky Flutter news app template from an outdated Flutter 2.x version to the latest Flutter 3.35.5 with modern best practices.

## What Was Updated

### 📱 Core Framework Updates
- **Dart SDK**: `>=2.7.0 <3.0.0` → `>=3.2.0 <4.0.0`
- **Flutter**: 2.x → 3.35.5 (latest stable)
- **Material Design**: Material 2 → Material 3 (Material You)
- **Null Safety**: Fully implemented across the codebase

### 🤖 Android Platform Updates
- **Compile SDK**: 30 → 35
- **Target SDK**: 30 → 35
- **Min SDK**: 16 → 21
- **Gradle**: 6.7 → 8.4
- **Android Gradle Plugin**: 4.1.0 → 8.1.4
- **Kotlin**: 1.3.50 → 1.9.25

### 📦 Dependencies Updates
| Package | Old Version | New Version | Notes |
|---------|-------------|-------------|-------|
| chewie | ^1.2.2 | ^1.8.5 | Video player improvements |
| cupertino_icons | ^1.0.2 | ^1.0.8 | Updated icons |
| flutter_svg | ^0.22.0 | ^2.0.12 | Better SVG performance |
| video_player | ^2.1.10 | ^2.9.2 | Enhanced video playback |
| scroll_indicator | ^0.0.3 | ^0.0.4 | Minor updates |

### 🆕 New Dependencies Added
- `cached_network_image: ^3.4.1` - Better image caching
- `http: ^1.2.2` - HTTP requests
- `shared_preferences: ^2.3.3` - Local storage
- `connectivity_plus: ^6.1.1` - Network connectivity
- `flutter_lints: ^5.0.0` - Code quality

## Migration Steps

### Step 1: Environment Setup

First, ensure you have the latest Flutter version:

```bash
flutter upgrade
flutter doctor
```

### Step 2: Update Dependencies

The `pubspec.yaml` has been completely updated. Run:

```bash
flutter pub get
```

If you encounter dependency conflicts, try:

```bash
flutter pub deps
flutter pub upgrade
```

### Step 3: Fix Null Safety Issues

All code needs to be null-safe. Common patterns to update:

#### Before (Flutter 2.x):
```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

#### After (Flutter 3.x):
```dart
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Container();
  }
}
```

### Step 4: Update SystemUIOverlayStyle

#### Before:
```dart
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.black,
  systemNavigationBarColor: Colors.black,
  systemNavigationBarIconBrightness: Brightness.dark,
));
```

#### After:
```dart
SystemChrome.setSystemUIOverlayStyle(
  const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  ),
);
```

### Step 5: Material 3 Migration

Update your theme to use Material 3:

```dart
theme: ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
  ),
),
```

### Step 6: Android Configuration

The Android configuration has been updated for modern requirements:
- Updated Gradle and Kotlin versions
- Added necessary permissions for network and media access
- Configured for Android 13+ compatibility

### Step 7: Code Quality

With `flutter_lints` added, fix linting issues:

```bash
flutter analyze
```

Common fixes needed:
- Add `const` constructors where possible
- Use `super.key` parameter
- Add trailing commas
- Prefer `const` declarations

## Breaking Changes to Address

### 1. Constructor Parameters
All widgets should use `super.key`:
```dart
const MyWidget({super.key});
```

### 2. Deprecated APIs
- `SystemUiOverlayStyle` usage has changed
- Some video player APIs have been updated
- Flutter SVG rendering has improved performance

### 3. Android Permissions
New permission model for Android 13+:
- `READ_MEDIA_IMAGES` and `READ_MEDIA_VIDEO` replace `READ_EXTERNAL_STORAGE`
- Network security config updated

## Testing the Migration

### Step 1: Clean Build
```bash
flutter clean
flutter pub get
```

### Step 2: Test Android
```bash
flutter run --debug
flutter build apk --debug
```

### Step 3: Test iOS (if applicable)
```bash
flutter run -d simulator
flutter build ios --debug --no-codesign
```

## Performance Improvements

With this migration, you'll get:

1. **Better Performance**: Flutter 3.x has significant performance improvements
2. **Modern UI**: Material 3 design system
3. **Better Developer Experience**: Enhanced debugging and hot reload
4. **Security**: Updated Android security requirements
5. **Null Safety**: Eliminate null reference errors at compile time

## Common Issues and Solutions

### Issue 1: Gradle Build Failures
**Solution**: Clear gradle cache
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
```

### Issue 2: Dependency Conflicts
**Solution**: Use dependency overrides in `pubspec.yaml`:
```yaml
dependency_overrides:
  package_name: ^version
```

### Issue 3: Null Safety Errors
**Solution**: Add null checks and use proper nullable types:
```dart
String? nullableString;
String nonNullableString = nullableString ?? 'default';
```

### Issue 4: Video Player Issues
**Solution**: Update video player usage according to new API:
```dart
VideoPlayerController.network(url)
```

## Next Steps

After completing this migration:

1. **Update UI Components**: Consider updating to Material 3 components
2. **Add State Management**: Consider adding Provider, Bloc, or Riverpod
3. **Add Testing**: Implement unit and integration tests
4. **Add CI/CD**: Set up continuous integration
5. **Performance Monitoring**: Add Firebase Crashlytics or similar

## Resources

- [Flutter 3 Migration Guide](https://docs.flutter.dev/release/breaking-changes)
- [Material 3 Migration](https://docs.flutter.dev/ui/design/material)
- [Null Safety Migration](https://dart.dev/null-safety/migration-guide)
- [Android Migration Guide](https://developer.android.com/distribute/best-practices/develop/target-sdk)

## Support

If you encounter issues during migration:

1. Check the [Flutter documentation](https://docs.flutter.dev/)
2. Run `flutter doctor` to check your setup
3. Check package documentation on [pub.dev](https://pub.dev/)
4. Consider filing issues with specific packages if problems persist

---

**Migration completed successfully!** 🎉

Your Readky news app template is now running on the latest Flutter 3.35.5 with modern best practices, improved performance, and better developer experience.
