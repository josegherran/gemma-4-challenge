# B1 Medical Triage App — Flutter Source

This directory contains the main Flutter app code for the B1 On-Device Medical Triage Copilot.

## Structure

- `main.dart` — App entry point and navigation
- `screens/` — UI screens (Input, Triage Card, History)
- `widgets/` — Reusable UI components (e.g., LargeButton, ColorBlock)
- `services/` — Stubs for voice input, photo input, and model integration
- `theme/` — App color scheme and theme
- `assets/` — Images and model files (see parent folder)
- `test/` — Widget and unit tests (see parent folder)

## Getting Started

1. Ensure you have Flutter installed: https://docs.flutter.dev/get-started/install
2. Open this folder in your IDE or run from the project root.
3. Run `flutter pub get` to fetch dependencies.
4. Run the app:
   - Android: `flutter run -d android`
   - iOS: `flutter run -d ios`

## Next Steps
- Implement business logic and connect stubs to real services.
- See TASKS.MD for the full implementation plan.
