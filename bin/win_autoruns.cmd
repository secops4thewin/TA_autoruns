@echo off
cmd /c start /B "" "%SPLUNK_HOME%\etc\apps\TA_autoruns\bin\autorunsc.exe" -c -h -m -accepteula -a *
