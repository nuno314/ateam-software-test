# ATeam Software Test

## Project Description

This is a Flutter project developed for software testing purposes by the ATeam. The application is built with Flutter 3.32.4 aiming to create a cross-platform mobile application (Android and iOS).

## Key Features

- **State Management**: Uses Flutter Bloc for application state management
- **Dependency Injection**: Integrates Injectable and GetIt for dependency management
- **Local Storage**: Uses SharedPreferences for local data storage
- **Networking**: Integrates Dio and Retrofit for HTTP requests
- **User Interface**: Uses Flutter ScreenUtil for responsive design
- **Images and SVG**: Supports SVG and vector graphics display
- **Logging**: Integrates Logger for logging

## System Requirements

- Flutter SDK: 3.32.4
- Dart SDK: ^3.8.1
- Android Studio or VS Code with Flutter extension

## Installation and Running

1. **Clone repository**:
   ```bash
   git clone <repository-url>
   cd ateam_software_test
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the application**:
   - For Android:
     ```bash
     flutter run
     ```
   - For iOS (macOS only):
     ```bash
     flutter run --platform ios
     ```

4. **Build release**:
   - Android APK:
     ```bash
     flutter build apk --release
     ```
   - iOS (macOS only):
     ```bash
     flutter build ios --release
     ```

## Project Structure

```
lib/
├── app_delegate.dart          # Main application delegate
├── main.dart                  # Main entry point
├── common/                    # Common utilities
│   ├── client_info.dart
│   ├── config.dart
│   └── constants/
├── data/                      # Data layer
│   ├── local/                 # Local storage
│   ├── models/                # Data models
│   ├── modules/               # Data modules
│   └── remote/                # API calls
├── di/                        # Dependency Injection
│   ├── di.config.dart
│   └── di.dart
├── gen/                       # Generated files
│   └── assets.gen.dart
└── presentation/              # Presentation layer
    ├── app.dart
    ├── extensions/
    ├── modules/
    ├── routes/
    ├── theme/
    └── widgets/
```

## Navigation and routing

Named routes are registered in `lib/presentation/routes/router.dart` via `RouteGenerator.generateRoute`. Route tables are split per feature (`OnboardRoute`, `AuthRoute`, `DashboardRoute`).

- **Unknown or missing route name**: resolves to a **Page Not Found** screen instead of a blank page.
- **Splash → onboarding**: `SplashBloc` decides the first screen (default: onboard).
- **Onboarding → login**: **Login** uses `Navigator.pushNamed` with `LoginScreen.path`.
- **Login → home (dashboard)**: after a successful sign-in, `AuthBloc` emits `LoginSuccessfullyState` and the app navigates with `Navigator.pushNamedAndRemoveUntil` to `DashboardScreen.path` (`/dashboard`), clearing the stack.

Sign-in is currently **mocked** in `AuthBloc` (short delay then success) for demo purposes.

## Dependency injection

The app uses **GetIt** (`lib/di/di.dart`) with **Injectable**. Prefer resolving dependencies in **route builders** or root providers (for example `AuthRoute` provides `AuthBloc` via `injector.get()`), so screens stay loosely coupled from the service locator.

After changing injectable registrations, regenerate code:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Main Dependencies

- **flutter_bloc**: State management
- **injectable**: Dependency injection
- **dio**: HTTP client
- **shared_preferences**: Local storage
- **flutter_screenutil**: Responsive UI
- **flutter_svg**: SVG display
- **retrofit**: API client generation

**Dev:** `bloc_test` (unit tests for blocs)

## Development

### Creating a new model
Use Retrofit to create API client:
```dart
@RestApi()
abstract class ApiClient {
  // API methods
}
```

### Adding new dependency
1. Add to `pubspec.yaml`
2. Run `flutter pub get`
3. If code generation needed: `flutter pub run build_runner build`

### Testing
```bash
flutter test
```

Included: `test/route_generator_test.dart` (unknown routes / `PageNotFoundScreen`), `test/auth_bloc_test.dart` (`AuthBloc` sign-in), `test/widget_test.dart` (basic pump).

## Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is developed internally for testing purposes.