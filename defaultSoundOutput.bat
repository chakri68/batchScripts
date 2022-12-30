@echo off
set audioDevice=DefaultRealtekAudio

if [%1]==[] (
  :: No command line argument
  echo Setting "%audioDevice%" as the audio output...
  nircmd setdefaultsounddevice "%audioDevice%" 1 || call:Error
  echo Set "%audioDevice%" as the default audio source
) else (
  echo Setting "%1" as the audio output...
  nircmd setdefaultsounddevice "%1" 1 || call:NoSuchAudioDeviceFoundError
  echo Set "%1" as the audio source
)

echo.&goto:eof

::--------------------------------------------------------
::-- Function section starts below here
::--------------------------------------------------------

:NoSuchAudioDeviceFoundError
:: No audio output with the specified name
echo No Audio device called %1 has been found...
exit /B

:Error
:: A random error
echo Something went wrong while setting "%audioDevice%" as the output...
exit /B
