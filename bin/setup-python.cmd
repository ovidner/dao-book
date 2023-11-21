@echo off
setlocal
set PROMPT_PREFIX=[33m
set SUCCESS_PROMPT_PREFIX=[92m
set ERROR_PROMPT_PREFIX=[91m
set PROMPT_SUFFIX=[0m
set MINIFORGE_PATH=%USERPROFILE%\Miniforge3
set CONDA_PATH=%MINIFORGE_PATH%\condabin\conda.bat

echo %PROMPT_PREFIX%Setting environment variables...%PROMPT_SUFFIX%
setx MAMBA_NO_BANNER 1 || goto :error

echo %PROMPT_PREFIX%Setting PowerShell execution policy...%PROMPT_SUFFIX%
powershell -NoProfile -Command "Set-ExecutionPolicy -Force -ExecutionPolicy RemoteSigned -Scope CurrentUser" || goto :error

echo %PROMPT_PREFIX%Making sure that Winget is available...%PROMPT_SUFFIX%
powershell -NoProfile -ExecutionPolicy Bypass -Command "Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe" || goto :error

echo %PROMPT_PREFIX%Installing Miniforge if needed...%PROMPT_SUFFIX%
winget list condaforge.miniforge3 --accept-source-agreements || winget install condaforge.miniforge3 --accept-source-agreements --accept-package-agreements -s winget --override "/InstallationType=JustMe /S /D=%MINIFORGE_PATH%" || goto :error

echo %PROMPT_PREFIX%Setting up Conda base environment...%PROMPT_SUFFIX%
:: Conda updates quite often break stuff :<
:: Libmamba is *much* faster than the default solver
call %CONDA_PATH% config --set auto_update_conda false --set solver libmamba || goto :error
:: conda-lock and invoke may come in handy
call %CONDA_PATH% install -n base -y conda-lock invoke || goto :error

echo %PROMPT_PREFIX%Initializing Conda for all shells...%PROMPT_SUFFIX%
call %CONDA_PATH% init || goto :error

echo %SUCCESS_PROMPT_PREFIX%Done! Open a new PowerShell/cmd/bash prompt to start using Miniforge/Python.%PROMPT_SUFFIX%
pause
goto :EOF

:error
echo %ERROR_PROMPT_PREFIX%Oh noes! Something went wrong.%PROMPT_SUFFIX%
pause
