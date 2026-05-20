# IMPROVEMENT_PLAN.md

## Executive Summary

B1 · On-Device Medical Triage Copilot is a privacy-first, offline, multimodal triage assistant for mobile devices. It leverages Gemma 4 Small models to deliver structured, local-first triage guidance, targeting users in connectivity-constrained or privacy-sensitive environments. The project is feature-complete as of May 2026, but further improvements can maximize business value, future-proofing, and operational excellence across quality attributes.

---

## Current State & Gaps

**Strengths:**
- Fully offline, private, and cross-platform (Flutter)
- Multimodal input (text, voice, photo)
- Local, encrypted storage (planned)
- Accessibility, usability, and compliance (HIPAA/GDPR)
- Automated and manual testing
- Community and open source readiness

**Gaps:**
- Model integration, photo input, and voice input are stubbed (not production-ready)
- Observability is limited (local logs only, no user opt-in analytics)
- No automated model update pipeline
- Limited scalability for future features (e.g., more languages, advanced analytics)
- No CI/CD pipeline for automated builds/tests
- Some error handling and storage robustness still pending

---

## Quality Characteristics Matrix

| Attribute      | Current State         | Gaps / Risks                | Business Value | Effort |
|---------------|----------------------|-----------------------------|---------------|--------|
| Availability  | Offline, local-first  | No crash recovery, no backup| High          | Med    |
| Cost          | Zero recurring API    | Model download size         | High          | Low    |
| Security      | Encrypted storage     | Model update, device loss   | High          | Med    |
| Performance   | <5s triage, profiling | Model not fully integrated  | High          | High   |
| Observability | Local logs only       | No remote/opt-in analytics  | Med           | Med    |
| Maintainability| Modular, lints, docs | No CI/CD, stubbed services  | High          | Med    |
| Portability   | Flutter, iOS/Android | No desktop/web, device APIs | Med           | High   |
| Scalability   | Local, single-user    | No multi-user, no cloud     | Med           | High   |

---

## Phased Improvement Waves

### Wave 1: Production Readiness (High Value, Med Effort)
- Complete model integration (Gemma 4, MediaPipe, LiteRT)
- Implement encrypted SQLite storage for triage history
- Finalize photo and voice input (camera/gallery, Whisper Tiny)
- Robust error handling for all I/O and inference paths
- Add crash recovery and local backup/restore
- Harden local logging (rotation, privacy review)

### Wave 2: Operational Excellence (Med Value, Med Effort)
- Add CI/CD pipeline for build, test, and lint automation
- Expand automated test coverage (unit, integration, E2E)
- Implement user opt-in analytics (privacy-preserving, local-first)
- Add performance regression tests and device compatibility checks
- Document all APIs and extension points

### Wave 3: Future-Proofing & Scale (Med Value, High Effort)
- Implement secure, user-approved model update pipeline
- Add support for additional languages and locales
- Explore desktop/web support (Flutter Desktop/Web)
- Add advanced observability (user opt-in, error reporting, anonymized metrics)
- Prepare for multi-user/device scenarios (if business case emerges)

---

## Wave Dependencies
- Wave 1 is a prerequisite for all others (production readiness)
- Wave 2 can proceed in parallel with Wave 3 for non-overlapping tasks
- Model update and advanced analytics depend on robust storage and error handling

---

## Metrics for Follow-Up
- **Availability:** Crash-free sessions, backup/restore success rate
- **Cost:** Model download size, device storage footprint
- **Security:** Penetration test results, encryption audit, update integrity
- **Performance:** Median triage latency, device compatibility pass rate
- **Observability:** % of errors logged, user opt-in analytics rate
- **Maintainability:** CI/CD pass rate, code coverage %, open/closed issues
- **Portability:** Supported device matrix, OS version coverage
- **Scalability:** Model update adoption, language/locale coverage

---

## Risks & Mitigations
- **Model integration complexity:** Mitigate with staged rollout, fallback UI, and robust error handling
- **Device storage constraints:** Warn users, allow model selection, optimize quantization
- **Security (device loss, update):** Encrypted storage, user PIN, signed model updates
- **Observability/privacy tension:** Strict opt-in, local-first analytics, clear user controls
- **CI/CD pipeline failures:** Manual fallback, staged deployment, test gating
- **Regulatory drift:** Schedule periodic compliance reviews

---

## Conclusion

B1 is well-positioned as a privacy-first, offline medical triage solution. By executing these phased improvements, the project will maximize business value, user trust, and technical excellence, ensuring long-term impact and adaptability.
