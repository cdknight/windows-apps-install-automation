@echo off 
setlocal enabledelayedexpansionlllhh

rem ** adapted from https://gist.github.com/nkymut/6961cfd3ec634ec28363ee11f1c39d71 ** 

rem Silent install script for Arduino Driver and Arduino IDE
rem https://forum.arduino.cc/index.php?topic=582294.0

cd "C:\Program Files (x86)\Arduino\drivers"

certutil -addstore "TrustedPublisher" "AdafruitCircuitPlayground.cat"
certutil -addstore "TrustedPublisher" "Arduino-org.cat"
certutil -addstore "TrustedPublisher" "Arduino.cat"
certutil -addstore "TrustedPublisher" "Arduino_gemma.cat"
certutil -addstore "TrustedPublisher" "Genuino.cat"
certutil -addstore "TrustedPublisher" "Linino-boards_amd64.cat"

cd ..

"drivers\dpinst-amd64.exe" /q /se

