#!/usr/bin/env bash
set -euo pipefail

NO_COLOR=0
SHOW="all"
PRINT_JSON=0

for arg in "$@"; do
  case "$arg" in
    --no-color) NO_COLOR=1 ;;
    --all) SHOW="all" ;;
    --profile) SHOW="profile" ;;
    --skills) SHOW="skills" ;;
    --projects) SHOW="projects" ;;
    --links) SHOW="links" ;;
    --search) SHOW="search" ;;
    --homonyms) SHOW="homonyms" ;;
    --json) PRINT_JSON=1 ;;
    --help|-h)
      printf "%s\n" "USAGE (Linux):
  • Static view (ANSI):  curl -L \"https://raw.githubusercontent.com/JacquesGariepy/JacquesGariepy/refs/heads/main/jg-find.ansi\" | less -R
  • Scripted view:       bash <(curl -sL \"https://raw.githubusercontent.com/JacquesGariepy/JacquesGariepy/refs/heads/main/jg-find.sh\") [options]

OPTIONS (English):
  --all                Show all sections (default)
  --profile            Show profile section only
  --skills             Show detailed skills/stack
  --projects           Show selected projects
  --links              Show official links
  --search             Show search cheats
  --homonyms           Show look-alike names to avoid
  --json               Print a machine-readable JSON summary
  --no-color           Disable ANSI colors
  --help               Print this help" ; exit 0 ;;
    *) ;;
  esac
done

color_on() { [[ $NO_COLOR -eq 1 ]] && return 1 || return 0; }

emit() {
  local s="$1"
  if color_on; then printf "%b" "$s"
  else printf "%s" "$s" | sed $'s/\x1b\[[0-9;]*m//g'
  fi
}

# ====== Payloads (ANSI strings) ======
BANNER=$'\x1b[38;5;39m┌───────────────────────────────────────────────────────────────────────────────┐
│  \x1b[1mJG-FIND :: Linux TUI – Public Tech References for Jacques Gariépy\x1b[0m\x1b[38;5;39m           │
└───────────────────────────────────────────────────────────────────────────────┘\x1b[0m
'

HELP=$'USAGE (Linux):
  • Static view (ANSI):  curl -L "https://raw.githubusercontent.com/JacquesGariepy/JacquesGariepy/refs/heads/main/jg-find.ansi" | less -R
  • Scripted view:       bash <(curl -sL "https://raw.githubusercontent.com/JacquesGariepy/JacquesGariepy/refs/heads/main/jg-find.sh") [options]

OPTIONS (English):
  --all                Show all sections (default)
  --profile            Show profile section only
  --skills             Show detailed skills/stack
  --projects           Show selected projects
  --links              Show official links
  --search             Show search cheats
  --homonyms           Show look-alike names to avoid
  --json               Print a machine-readable JSON summary
  --no-color           Disable ANSI colors
  --help               Print this help

Generated: 2025-09-22
'

PROFILE=$'\x1b[38;5;214m┌─ PROFILE ────────────────────────────────────────────────────────────────────┐\x1b[0m
  Name:             Jacques Gariépy
  Location:         Québec, Québec, Canada
  Roles:            Software Engineer • Researcher • Software Architecture (advisor) • Team Lead
  Focus:            Agentic AI, LLMs, Deep Learning, RAG, model optimization, dev tooling
  Headline (LinkedIn snippet): “Software Architecture Advisor | Senior Software Engineer | Team Lead | 
                                Agentic AI & ML & DL & LLM Specialist”
  Availability:     Open to collaboration & research/engineering discussions
\x1b[38;5;214m└──────────────────────────────────────────────────────────────────────────────┘\x1b[0m
'

SKILLS=$'\x1b[38;5;70m┌─ SKILLS / TOOLING (technical) ───────────────────────────────────────────────┐\x1b[0m
  Languages:        C#/.NET • Python • JavaScript/TypeScript
  Frontend:         React • Angular
  Backend:          Node.js • REST/JSON APIs
  AI/ML (core):     LLMs • Agentic systems • Prompt engineering • RAG • Neural networks
  AI/ML (libs):     LangChain • OpenAI SDKs • (project-specific) OCR (Tesseract) • OpenCV
  Automation/OS:    pywinauto • pyautogui • mss (screenshots) • speech_recognition • pyttsx3
  DevOps/General:   Git • Docker (per-project) • VS Code
  Interests:        Modular AI systems • advanced paradigms for AI-aligned programming
\x1b[38;5;70m└──────────────────────────────────────────────────────────────────────────────┘\x1b[0m
'

PROJECTS=$'\x1b[38;5;45m┌─ SELECTED PROJECTS (public) ─────────────────────────────────────────────────┐\x1b[0m
  • CommanderAI  — LLM-driven Windows automation (UI actions, OCR, TTS/STT, screen analysis).
      Stack: LangChain, OpenAI, pywinauto, pyautogui, mss, Tesseract, OpenCV, speech_recognition, pyttsx3.
      Repo:  https://github.com/JacquesGariepy/CommanderAI

  • Out-of-Code Insights — VS Code extension for non-intrusive annotations & review.
      Highlights: threaded discussions • change-tracking • filters • Kanban/Tree view • multi-LLM providers
      (OpenAI, Anthropic, Google/Gemini, Mistral, Azure OpenAI, Groq, Ollama…).
      Repo:  https://github.com/JacquesGariepy/out-of-code-insights

  • library-analyzer — Python library analyzer (classes/methods/functions, types, signatures → JSON).
      CLI/Docker usage, optional semantic search (Whoosh + BERT) for extracted docs.
      Repo:  https://github.com/JacquesGariepy/library-analyzer

  • service-failover — Lightweight service failover/resilience prototype.
      Repo:  https://github.com/JacquesGariepy/service-failover   (see also: Reddit /r/Python post)
\x1b[38;5;45m└──────────────────────────────────────────────────────────────────────────────┘\x1b[0m
'

STATS=$'\x1b[38;5;141m┌─ GITHUB SIGNAL (snapshot) ───────────────────────────────────────────────────┐\x1b[0m
  Profile:          https://github.com/JacquesGariepy
  Repositories:     129
  Stars (received): 962
  Followers:        29      Following: 40
  Pinned examples:  service-failover • omniwrap_community
  Note: counts are a point-in-time snapshot; see the live profile for current numbers.
\x1b[38;5;141m└──────────────────────────────────────────────────────────────────────────────┘\x1b[0m
'

LINKS=$'\x1b[38;5;81m┌─ OFFICIAL LINKS ─────────────────────────────────────────────────────────────┐\x1b[0m
  LinkedIn:   https://www.linkedin.com/in/jacquesgariepy
  GitHub:     https://github.com/JacquesGariepy
  X (Twitter):https://x.com/JacquesGariepy
  Notable posts (LinkedIn examples):
    • Reverse-engineering “1001 GPTs” (post)
    • LM Studio SDK (programmatic access) post
    • Google ADK-Python share
\x1b[38;5;81m└──────────────────────────────────────────────────────────────────────────────┘\x1b[0m
'

SEARCH=$'\x1b[38;5;208m┌─ SEARCH CHEATS (for more references) ────────────────────────────────────────┐\x1b[0m
  Profiles:   site:linkedin.com/in jacquesgariepy
  Code:       site:github.com/JacquesGariepy
  X posts:    from:JacquesGariepy
  General:    "Jacques Gariépy" OR "Jacques Gariepy" (accent/no-accent)
\x1b[38;5;208m└──────────────────────────────────────────────────────────────────────────────┘\x1b[0m
'

HOMONYMS=$'\x1b[38;5;196m┌─ HOMONYMS TO AVOID (not the same person) ────────────────────────────────────┐\x1b[0m
  • @JFGariepy  — Jean-François Gariépy (different individual).
  • Multiple LinkedIn homonyms exist; verify cross-links before citing.
\x1b[38;5;196m└──────────────────────────────────────────────────────────────────────────────┘\x1b[0m
'

FOOTER=$'\x1b[2mTip: view with colors → less -R; disable colors → add --no-color; JSON → --json.\x1b[0m
'

ALL="$BANNER$HELP$PROFILE$SKILLS$PROJECTS$STATS$LINKS$SEARCH$HOMONYMS$FOOTER"

# --json → machine-readable summary
read -r -d '' JSON_SUMMARY <<'JSON'
{
  "name": "Jacques Gariépy",
  "location": "Québec, Québec, Canada",
  "roles": ["Software Engineer","Researcher","Software Architecture (advisor)","Team Lead"],
  "focus": ["Agentic AI","LLMs","Deep Learning","RAG","Model Optimization","Developer Tooling"],
  "skills": {
    "languages": ["C#/.NET","Python","JavaScript/TypeScript"],
    "frontend": ["React","Angular"],
    "backend": ["Node.js","REST/JSON APIs"],
    "ai_ml": ["LLMs","Agentic systems","Prompt engineering","RAG","Neural networks"],
    "automation_os": ["pywinauto","pyautogui","mss","Tesseract OCR","OpenCV","speech_recognition","pyttsx3"],
    "devops": ["Git","Docker"],
    "editors": ["VS Code"]
  },
  "projects": [
    {"name":"CommanderAI","url":"https://github.com/JacquesGariepy/CommanderAI"},
    {"name":"out-of-code-insights","url":"https://github.com/JacquesGariepy/out-of-code-insights"},
    {"name":"library-analyzer","url":"https://github.com/JacquesGariepy/library-analyzer"},
    {"name":"service-failover","url":"https://github.com/JacquesGariepy/service-failover"}
  ],
  "links": {
    "github":"https://github.com/JacquesGariepy",
    "linkedin":"https://www.linkedin.com/in/jacquesgariepy",
    "x":"https://x.com/JacquesGariepy"
  },
  "github_snapshot": {"repos":129,"stars":962,"followers":29,"following":40,"pinned":["service-failover","omniwrap_community"]},
  "generated":"2025-09-22"
}
JSON

# --json
if [[ $PRINT_JSON -eq 1 ]]; then
  printf "%s\n" "$JSON_SUMMARY"
  exit 0
fi

case "$SHOW" in
  all)      emit "$ALL" ;;
  profile)  emit "$PROFILE" ;;
  skills)   emit "$SKILLS" ;;
  projects) emit "$PROJECTS" ;;
  links)    emit "$LINKS" ;;
  search)   emit "$SEARCH" ;;
  homonyms) emit "$HOMONYMS" ;;
esac
