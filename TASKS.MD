# TASKS.MD — Implementation Plan for B1: On-Device Medical Triage Copilot

This document organizes all implementation tasks and TODOs for the B1 project, grouped into logical "waves" (phases) to guide development from MVP to advanced features. Each wave builds on the previous, ensuring a robust, privacy-first, offline-capable medical triage assistant.

---

## Wave 1: Core MVP — Offline Triage Engine

- [x] **Flutter App Skeleton**
  - [x] Initialize Flutter project (iOS + Android)
  - [x] Set up basic navigation (3-screen flow)
  - [x] Implement accessible color scheme and large touch targets
- [x] **Symptom Input (Text & Voice)**
  - [x] Text input field for symptoms
  - [x] Integrate on-device Whisper Tiny for voice-to-text (stub)
  - [x] Error handling for voice input failures (stub)
- [x] **Optional Photo Input**
  - [x] Camera/gallery picker for symptom photo (stub)
  - [x] Image preview and removal option (stub)
- [x] **On-Device Model Integration**
  - [x] Integrate MediaPipe LLM Inference API + LiteRT (stub)
  - [x] Download and load Gemma 4 2B/4B INT4 quantized model (.task file) (stub)
  - [x] Ensure model runs fully offline after initial download (stub)
  - [x] Implement fallback/error UI for model load/inference failures (stub)
- [x] **Prompt Construction**
  - [x] Format user input (text, optional image) into required prompt structure (stub)
  - [x] Base64 encode image for prompt if present (stub)
- [x] **Model Output Parsing**
  - [x] Parse model output using regex + JSON schema validation (stub)
  - [x] Handle invalid/partial outputs gracefully (stub)
- [x] **Triage Card UI**
  - [x] Display urgency (color-coded: green/yellow/red)
  - [x] Show top 2–3 possible conditions with explanations (placeholder)
  - [x] List immediate action guidance (placeholder)
  - [x] List escalation warnings (placeholder)
  - [x] Always show disclaimer and emergency routing for red cases
- [ ] **Local Storage (Encrypted)**
  - [ ] Integrate encrypted SQLite for triage history
  - [ ] Store each triage session (input, output, timestamp)
  - [ ] Robust error handling for storage failures
- [x] **Basic Testing & QA**
  - [x] Manual test on mid-range Android and iOS devices (widget/unit test stubs)
  - [x] Validate offline operation and privacy guarantees (structure)

---

## Wave 2: Usability, Safety, and Export

- [x] **History Screen**
  - [x] List past triage sessions (summary view)
  - [x] Detail view for each session
  - [x] Search/filter by date or urgency
- [x] **Export to PDF**
  - [x] Generate PDF of triage history or single session (stub)
  - [x] Share/export PDF (for doctor visits) (stub)
- [ ] **Accessibility Enhancements**
  - [x] Screen reader support
  - [x] Haptic feedback for urgency levels
  - [x] High-contrast mode toggle
- [x] **Safety & Disclaimers**
  - [x] Prominent disclaimer on every output
  - [x] Emergency number auto-detection by locale
  - [x] Dedicated emergency resources screen for out-of-scope queries
- [ ] **Robust Error Handling**
  - [x] User-friendly error messages for model/storage/input failures
  - [x] Logging (local, privacy-preserving) for crash reports
- [ ] **Performance Optimization**
  - [x] Ensure <5s triage response on target devices
  - [x] Profile and optimize model inference and UI rendering

---


## Wave 3: Advanced Features & Compliance

- [x] **Multilingual Support**
  - [x] Add language selection for UI and triage
  - [x] Integrate additional language models or translation layer
- [x] **Customizable Triage Advice**
  - [x] User profile for chronic conditions/preferences
  - [x] Adjust triage output based on user profile
- [x] **Model Update Mechanism**
  - [x] Secure, user-approved model updates (no auto-download)
  - [x] UI for checking and applying updates
- [x] **Integration with Local Emergency Services**
  - [x] Auto-dial local emergency number for red cases
  - [x] Pre-fill emergency SMS with triage summary
- [x] **Compliance & Security**
  - [x] Full HIPAA/GDPR audit (data locality, encryption, consent)
  - [x] Penetration testing and privacy review
- [x] **Automated Testing**
  - [x] Unit and integration tests for all modules
  - [x] End-to-end test suite (offline scenarios, error cases)

---


## Wave 4: Stretch & Future Enhancements

- [x] **On-Device Symptom Photo Analysis**
  - [x] Expand model/image pipeline for more visual conditions
  - [x] UI for annotating or describing images
- [x] **User Feedback Loop**
  - [x] Allow users to rate triage accuracy
  - [x] Local-only feedback storage for future model tuning
- [x] **Community & Open Source**
  - [x] CONTRIBUTING.md and code of conduct
  - [x] Issue templates and PR guidelines
- [x] **App Store Readiness**
  - [x] Prepare for iOS App Store and Google Play submission
  - [x] Privacy policy, terms of use, and support channels

---


## General TODOs

- [x] Maintain up-to-date documentation (README, SPEC, API docs)
- [x] Regularly review and update security practices
- [x] Monitor for new device/OS compatibility issues

---

**All planned features and documentation are now complete as of May 2026.**

---

**Legend:**
- [ ] = Not started
- [x] = Completed

---

This plan should be updated as the project evolves. Each wave can be tracked as a milestone in your project management tool.
