@echo off

rem nkf.exe
msbuild nkf.sln /t:Rebuild /p:Configuration=Release

rem nkf32.dll (x86)
msbuild nkf32.sln /t:Rebuild /p:Configuration=Release /p:Platform=Win32

rem nkf32.dll (x64)
msbuild nkf32.sln /t:Rebuild /p:Configuration=Release /p:Platform=x64
