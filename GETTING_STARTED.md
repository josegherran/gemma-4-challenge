# Getting Started with B1 · On-Device Medical Triage Copilot

Welcome to B1! This guide will help you set up, build, and run the app on your local machine for development or evaluation.

---

## Prerequisites

- **Flutter SDK** (latest stable, [Install Guide](https://docs.flutter.dev/get-started/install))
- **Dart SDK** (comes with Flutter)
- **Android Studio** or **Xcode** (for device emulation or deployment)
- **A device or emulator** (Android or iOS)
- **Git** (for cloning the repository)

---

## 1. Clone the Repository

```
git clone https://github.com/josegherran/gemma-4-challenge.git
cd gemma-4-challenge
```

---

## 2. Install Dependencies

```
flutter pub get
```

---

## 3. Run the App

### On Android:

- Connect an Android device or start an emulator.
- Run:

```
flutter run
```

### On iOS:

- Open the project in Xcode and set up signing if needed.
- Or, from terminal (with a device or simulator):

```
flutter run
```

---

## 4. Project Structure

- `src/lib/` — Main app code (screens, widgets, services, theme)
- `test/` — Widget, unit, and integration tests
- `assets/` — Images, model files
- `docs/` — Documentation and design notes

---

## 5. Key Features

- Offline, on-device medical triage (Gemma 4 model)
- Text, voice, and photo symptom input
- Multilingual support
- Accessibility: screen reader, haptic feedback, high-contrast mode
- Local, encrypted storage (triage history)
- PDF export and sharing
- User feedback loop
- Community and open source ready

---

## 6. Testing

Run all tests:

```
flutter test
```

---

## 7. Model Download

- The app will prompt to download the Gemma 4 model on first launch.
- Ensure you have enough device storage (~1.3–2.4 GB).
- No health data is ever sent to the cloud.

---

## 8. Contributing

See `CONTRIBUTING.md` for guidelines. Issues and PRs are welcome!

---

## 9. Support & Troubleshooting

- For help, open an issue on GitHub.
- See `docs/` for more details and design notes.

---

## 10. License

MIT License. See `LICENSE` for details.

---

**Thank you for helping make private, accessible medical triage a reality!**
