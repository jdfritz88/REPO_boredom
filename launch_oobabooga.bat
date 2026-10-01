@echo off
rem REPO_boredom launcher: starts stock oobabooga (app_cabinet\text-generation-webui)
rem with its user folder (settings, characters, extensions, models, logs) in
rem REPO_boredom\user_data - oobabooga's own --user-data-dir setting, the way ComfyUI
rem is started with --base-directory. Oobabooga's own folder is never changed.
setlocal
set "REPO_BOREDOM=%~dp0"
if "%REPO_BOREDOM:~-1%"=="\" set "REPO_BOREDOM=%REPO_BOREDOM:~0,-1%"
if not defined OOBABOOGA_APP set "OOBABOOGA_APP=F:\Apps\freedom_system\app_cabinet\text-generation-webui"

rem eSpeak NG (the phonemes tool) for oobabooga and the AllTalk server its add-on starts;
rem its settings belong to AllTalk and live in REPO_alltalk.
call "F:\Apps\freedom_system\REPO_alltalk\oobabooga_extension\espeak_env.bat"

rem Weekly update check (asks before installing; reports go to REPO_boredom\logs\update_checks.log)
powershell -NoProfile -ExecutionPolicy Bypass -File "%REPO_BOREDOM%\update_check.ps1" -App "%OOBABOOGA_APP%"

rem GPU_CHOICE only matters if oobabooga ever has to build a fresh environment (NVIDIA, CUDA 12.8).
set "GPU_CHOICE=A"
call "%OOBABOOGA_APP%\start_windows.bat" --user-data-dir "%REPO_BOREDOM%\user_data" --model-dir "%REPO_BOREDOM%\user_data\models" %*
