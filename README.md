# REPO_boredom

The **boredom monitor** for oobabooga (text-generation-webui): an oobabooga extension that
notices when the chat has gone quiet and has the character speak up on its own.

When you have not written anything for a while (`idle_threshold_minutes`, 7 by default in
`idle_response_config.json`), the monitor picks an emotion, builds a prompt for it from
`idle_meta_prompt_templates.json`, and injects the character's message into the chat.
Cooldowns keep it from repeating too often (`min_injection_interval_minutes`, and a longer
cooldown for some emotions).

## Where things are

| Path | What it is |
|---|---|
| `user_data/extensions/boredom_monitor/` | The boredom monitor itself. `script.py` is what oobabooga loads. |
| `user_data/` | Oobabooga's user folder: settings, presets, extensions. `settings.yaml` switches the boredom monitor on. |
| `user_data/extensions/alltalk_tts/` | A small loader that starts the AllTalk voice add-on, which lives in REPO_alltalk. |
| `launch_oobabooga.bat` | Starts oobabooga with this `user_data` folder. |
| `update_check.ps1` | Weekly check for a new oobabooga release; asks before installing. |
| `patches/` | A record of local edits made to oobabooga's own code. |

Oobabooga itself is not in this repo. It stays untouched in
`F:\Apps\freedom_system\app_cabinet\text-generation-webui`, and the launcher points it at this
folder with oobabooga's own `--user-data-dir` setting.

## Starting it

Run `launch_oobabooga.bat` (or the "Oobabooga (with my voices)" shortcut). Starting oobabooga
any other way runs it without this `user_data` folder, so the boredom monitor is not loaded.

## Not in git

Models, characters, users, logs and cache stay on disk only (see `.gitignore`).
