@echo off
chcp 65001 >nul
rem Génère liste.js : la liste des images du dossier "allpokemon" (à relancer si tu ajoutes/retires des images)
powershell -NoProfile -ExecutionPolicy Bypass -Command "$names = @(Get-ChildItem -LiteralPath '%~dp0allpokemon' -File | Where-Object { $_.Extension -match '^\.(gif|png|jpe?g|webp|avif|bmp)$' } | ForEach-Object { $_.Name }); $json = ConvertTo-Json -InputObject $names -Compress; [System.IO.File]::WriteAllText('%~dp0liste.js', 'window.POKEMON_LIST = ' + $json + ';', (New-Object System.Text.UTF8Encoding($false))); Write-Host ($names.Count.ToString() + ' images listees dans liste.js')"
pause
