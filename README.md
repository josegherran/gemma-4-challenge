# B1 · On-Device Medical Triage Copilot

**Tagline:** Private, offline, multimodal symptom triage — powered by Gemma 4 on the device in your pocket.

---

## Project Structure (Wave 1)

The main Flutter app code is in `src/lib/`:

- `main.dart` — App entry point and navigation
- `screens/` — UI screens (Input, Triage Card, History)
- `widgets/` — Reusable UI components (e.g., LargeButton, ColorBlock)
- `services/` — Stubs for voice input, photo input, and model integration
- `theme/` — App color scheme and theme
- `assets/` — Images and model files
- `test/` — Widget and unit tests

See TASKS.MD for the full implementation plan and progress.

**Model:** Gemma 4 Small (2B / 4B)

---

## Problem Statement

In rural, low-income, or disaster-stricken areas, patients frequently lack timely access to a healthcare professional who can assess symptom urgency. Delayed triage of chest pain, stroke symptoms, or severe trauma can cost lives, while over-triage floods emergency services unnecessarily.

Existing AI symptom checkers (Ada, WebMD Symptom Checker, Buoy) are **100% cloud-dependent** — they require an active internet connection, send sensitive health data to remote servers, and are blocked in regions with poor connectivity or strict data sovereignty laws. HIPAA and GDPR impose strict constraints on where health data travels. Many patients in underserved areas simply cannot use these tools.

The core gap: there is no offline-capable, privacy-preserving, multimodal triage tool that works on a standard smartphone.

---

## Solution

A mobile-first application that runs a **Gemma 4 Small (2B or 4B) model entirely on-device** — no network calls after the initial model download. The user describes symptoms in natural language (voice or text), optionally attaches a photo (wound, rash, swelling), and receives a structured triage card within seconds:

- **Urgency level:** Green (self-care) / Yellow (see a doctor within 24h) / Red (go to ER now)
- **Top 2–3 possible conditions** with plain-English explanations
- **Immediate action guidance:** what to do right now (e.g., "apply pressure, do not move the limb")
- **Warning flags:** symptoms to watch for that would escalate urgency

The model never phones home. Health data stays on the device.

---

## Objective

Provide accessible, private, offline-capable first-level medical triage guidance to:

1. Patients in rural/remote areas with unreliable connectivity
2. Travelers abroad without local healthcare knowledge
3. Disaster relief zones where infrastructure is down
4. Privacy-conscious users who refuse cloud-based health tools

**Measurable success:** 90%+ urgency classification agreement with a licensed triage nurse on a 200-case validation set.

---

## High-Level Architecture

```view
┌─────────────────────────────────────────────────────┐
│                  Mobile App (Flutter)               │
│                                                     │
│  ┌──────────────┐   ┌──────────────────────────┐     │
│  │ Text Input   │   │ Image Capture (camera or │     │
│  │ (symptoms,   │   │ gallery) — optional      │     │
│  │ voice-to-    │   │ photo of wound, rash,    │     │
│  │ text via     │   │ swelling                 │     │
│  │ on-device    │   └────────────┬─────────────┘     │
│  │ Whisper)     │                │                  │
│  └──────┬───────┘                │                  │
│         │        Multimodal      │                  │
│         └──────────Prompt────────┘                  │
│                      │                              │
│         ┌────────────▼──────────────┐               │
│         │  Gemma 4 2B/4B on-device  │               │
│         │  via MediaPipe / LiteRT   │               │
│         │  (quantized INT4/INT8)    │               │
│         └────────────┬──────────────┘               │
│                      │                              │
│         ┌────────────▼──────────────┐               │
│         │  Structured JSON Parser   │               │
│         │  { urgency, conditions,   │               │
│         │    actions, warnings }    │               │
│         └────────────┬──────────────┘               │
│                      │                              │
│         ┌────────────▼──────────────┐               │
│         │   Triage Card UI          │               │
│         │   (color-coded, scannable)│               │
│         └───────────────────────────┘               │
└─────────────────────────────────────────────────────┘
         ↑ ZERO network calls after model download ↑
```


**Tech Stack:**

| Layer              | Technology                              | Reason                                         |
|--------------------|-----------------------------------------|------------------------------------------------|
| Frontend           | Flutter (iOS + Android)                 | Single codebase, native GPU access             |
| On-device inference| MediaPipe LLM Inference API + LiteRT    | Google's official on-device Gemma runtime      |
| Model format       | Gemma 4 2B INT4 quantized (.task file)  | ~1.3 GB footprint, runs on 4 GB RAM phones     |
| Voice input        | Whisper Tiny (on-device)                | Offline speech-to-text for accessibility       |
| Multimodal         | Gemma 4 4B multimodal variant           | Native image+text joint reasoning              |
| Output parsing     | Regex + JSON schema validation          | Guaranteed structured output                   |
| Storage            | SQLite (on-device)                      | Triage history, offline, encrypted             |

---

## Gemma 4 Integration Details

**Prompt structure:**

```text
[SYSTEM]
You are a medical triage assistant. You receive symptom descriptions and optional images.
Respond ONLY in valid JSON matching this schema:
{
  "urgency": "green|yellow|red",
  "urgency_reason": "one sentence",
  "possible_conditions": [{"name": "...", "explanation": "plain English, max 2 sentences"}],
  "immediate_actions": ["..."],
  "escalation_warnings": ["symptom to watch for that means go to ER"]
}
Do not speculate beyond the presented symptoms. Always err toward caution.

[USER]
Patient symptoms: {user_text}
[IMAGE: {optional_photo_base64}]
```

**Why Gemma 4 Small specifically:**

- The entire value proposition is offline + private — a cloud-dependent model defeats the purpose
- 2B/4B quantized fits in ~1.3–2.4 GB RAM, runnable on mid-range phones (Pixel 6+, iPhone 12+)
- Gemma 4's multimodal capability at the 4B size enables photo-informed triage that no prior on-device model could match
- Reasoning mode can be triggered for edge cases where chain-of-thought improves accuracy

---

### User Flow (3 Screens)

1. **Input screen:** Text field + voice button + optional "Add photo" button. Single "Assess" CTA.
2. **Triage card:** Large color block (green/yellow/red) + urgency label + scrollable detail sections.
3. **History screen:** Past triage sessions stored locally, exportable to PDF for a doctor visit.

---

### Safety & Disclaimer Design

- Every output begins with: *"This is not a medical diagnosis. If in doubt, seek professional care."*
- Red urgency always shows the local emergency number (auto-detected by locale)
- Model classifies urgency and surfaces possible conditions — it does not diagnose
- Out-of-scope queries (mental health crisis, poison ingestion) route to a dedicated emergency resources screen

---

### Benefits

| Benefit              | Detail                                                      |
|----------------------|------------------------------------------------------------ |
| Complete data privacy| Zero health data leaves the device — ever                  |
| Offline-first        | Works in airplane mode, remote areas, disaster zones        |
| Zero recurring cost  | No API bill per query — model runs locally                 |
| Multimodal           | Photo of a wound provides context no text description can match |
| Accessibility        | Voice input + large text + high-contrast urgency cards      |
| Cross-platform       | iOS + Android from a single Flutter codebase                |

---

### Judging Criteria Alignment

| Criterion                              | How B1 scores                                                                                                                        |
|----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **Intentional & effective Gemma 4 use**| Small model is the *only* architecturally valid choice — the privacy + offline premise mandates on-device execution. Gemma 4's multimodal 4B variant enables photo-informed triage that older on-device generations could not do. |
| **Technical implementation quality**    | End-to-end on-device ML pipeline: model quantization, MediaPipe integration, structured output parsing, voice input, encrypted local storage |
| **Creativity & originality**            | Multimodal offline medical triage is a genuinely novel intersection of edge AI and healthcare accessibility                           |
| **Usability & UX**                     | 3-screen flow; color-coded urgency reduces cognitive load during stressful moments; voice input for hands-free use                    |

---