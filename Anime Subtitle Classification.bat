@echo Off&COLOR 0B&setlocal enabledelayedexpansion
set ProgramName=Anime Subtitle Classification By Zack Ver240320
title !ProgramName!
::====================================================================================
For  %%F In ("E:\Sync\Database\Backup\Anime\Database\*.ass") do (
    set FilePath=%%F
    echo !FilePath! | find "N" > nul
    if !errorlevel! equ 0 (
        For /F "tokens=1 delims=N" %%P In ("%%~nxF") do (
            set FilePathName=%%P
        )
        IF not exist "%%~dpF!FilePathName!" md "%%~dpF!FilePathName!"
        echo !FilePath! | find "_" > nul
        if !errorlevel! equ 0 (
            For /F "tokens=1 delims=_" %%N In ("%%~nxF") do (
                set FileName=%%N%%~xF
            )
        ) else (
            set FileName=%%~nxF
        )
        echo %%~dpF!FilePathName!\!FileName!
        move "!FilePath!" "%%~dpF!FilePathName!\!FileName!"
        echo.
    ) else (
        echo !FilePath! | find "_" > nul
        if !errorlevel! equ 0 (
            For /F "tokens=1 delims=_" %%N In ("%%~nxF") do (
                set FileName=%%N%%~xF
            )
            echo %%~dpF!FileName!
            rename "!FilePath!" "!FileName!"
            echo.
        )
    )
)
echo.
pause
exit

::====================================================================================

