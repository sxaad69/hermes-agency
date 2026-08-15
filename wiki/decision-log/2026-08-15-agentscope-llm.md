# Decision Log

Chronological record of agency decisions. Newest first.

---

## 2026-08-15 — AgentScope LLM integration: opencode-go deepseek-flash (M3 hardening, card t_d54c6789)

**Trigger:** Governance audit (t_d33aa606) found AgentScope's LLM demo MOCKED
(FakeListLLM/StubOpenAI). Hardening card initially stamped "local free-first
(Ollama/llama.cpp) OR honest DEMO."

**Board override (delivered mid-run, 2026-08-15):** Do NOT use or reinstall
Ollama/llama.cpp/local inference — the VPS is not suitable (4GB RAM, no GPU).
Real inference uses the opencode-go deepseek-flash API.

```
DATE: 2026-08-15
PRODUCT: AgentScope Observability
INTEGRATION: LLM inference (opencode-go API, deepseek-v4-flash)
PROTOCOL PATH: step 4/5 — board decision (override received mid-run)
DECISION: production LLM path calls https://opencode.ai/zen/go/v1
  (model deepseek-v4-flash) with key from AGENTSCOPE_LLM_API_KEY /
  OPENCODE_GO_API_KEY. Fail-closed: no API/key -> LocalLLMUnavailable,
  no mock fallback.
REJECTED: local inference (Ollama qwen2.5:0.5b) — board: VPS unsuitable
  (4GB RAM, no GPU); Ollama stopped + disabled. Paid third-party APIs —
  not needed; agency provider covers it.
MATRIX LABEL: REAL (production path); demo fixtures remain DEMO
  (demo/stub_llm.py, import-isolated, proven by test).
COST: agency opencode-go provider (shared key, per-token); no new
  credentials, no new spend approval required beyond board override.
ESCALATED TO BOARD: yes (override received; this entry records it)
```

**Implementation:** agentscope/llm.py (REAL client, fail-closed),
demo/run_agent.py + demo/run_openai.py (real inference), demo/stub_llm.py
(DEMO fixtures), tests/test_llm_real_vs_demo.py (REAL-vs-DEMO proof),
docs/integrations.md + docs/security-review.md. Ollama removed/disabled.
