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

- [ ] **History Screen**
  - [ ] List past triage sessions (summary view)
  - [ ] Detail view for each session
  - [ ] Search/filter by date or urgency
- [ ] **Export to PDF**
  - [ ] Generate PDF of triage history or single session
  - [ ] Share/export PDF (for doctor visits)
- [ ] **Accessibility Enhancements**
  - [ ] Screen reader support
  - [ ] Haptic feedback for urgency levels
  - [ ] High-contrast mode toggle
- [ ] **Safety & Disclaimers**
  - [ ] Prominent disclaimer on every output
  - [ ] Emergency number auto-detection by locale
  - [ ] Dedicated emergency resources screen for out-of-scope queries
- [ ] **Robust Error Handling**
  - [ ] User-friendly error messages for model/storage/input failures
  - [ ] Logging (local, privacy-preserving) for crash reports
- [ ] **Performance Optimization**
  - [ ] Ensure <5s triage response on target devices
  - [ ] Profile and optimize model inference and UI rendering

---

## Wave 3: Advanced Features & Compliance

- [ ] **Multilingual Support**
  - [ ] Add language selection for UI and triage
  - [ ] Integrate additional language models or translation layer
- [ ] **Customizable Triage Advice**
  - [ ] User profile for chronic conditions/preferences
  - [ ] Adjust triage output based on user profile
- [ ] **Model Update Mechanism**
  - [ ] Secure, user-approved model updates (no auto-download)
  - [ ] UI for checking and applying updates
- [ ] **Integration with Local Emergency Services**
  - [ ] Auto-dial local emergency number for red cases
  - [ ] Pre-fill emergency SMS with triage summary
- [ ] **Compliance & Security**
  - [ ] Full HIPAA/GDPR audit (data locality, encryption, consent)
  - [ ] Penetration testing and privacy review
- [ ] **Automated Testing**
  - [ ] Unit and integration tests for all modules
  - [ ] End-to-end test suite (offline scenarios, error cases)

---

## Wave 4: Stretch & Future Enhancements

- [ ] **On-Device Symptom Photo Analysis**
  - [ ] Expand model/image pipeline for more visual conditions
  - [ ] UI for annotating or describing images
- [ ] **User Feedback Loop**
  - [ ] Allow users to rate triage accuracy
  - [ ] Local-only feedback storage for future model tuning
- [ ] **Community & Open Source**
  - [ ] CONTRIBUTING.md and code of conduct
  - [ ] Issue templates and PR guidelines
- [ ] **App Store Readiness**
  - [ ] Prepare for iOS App Store and Google Play submission
  - [ ] Privacy policy, terms of use, and support channels

---

## General TODOs

- [ ] Maintain up-to-date documentation (README, SPEC, API docs)
- [ ] Regularly review and update security practices
- [ ] Monitor for new device/OS compatibility issues

---

**Legend:**
- [ ] = Not started
- [x] = Completed

---

This plan should be updated as the project evolves. Each wave can be tracked as a milestone in your project management tool.
