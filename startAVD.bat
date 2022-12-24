@echo off

if [%1]==[] (
  :: No command line argument
  echo Starting the emulator Pixel_5_API_30...
  emulator -avd Pixel_5_API_30
) else (
  echo Starting the emulator %1...
  emulator -avd %1 || call:NoSuchAVDFoundError
)

echo.&goto:eof

::--------------------------------------------------------
::-- Function section starts below here
::--------------------------------------------------------

:NoSuchAVDFoundError
:: No AVD with the specified name
echo No AVD called %1 has been found...
goto :eof