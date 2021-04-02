:: по возможности отключить лишние уведомления в консоли
echo off

:: сделать копию прошлой скомпилированной версии
if exist !goal5.old (copy !goal5.nes !goal5.old)

:: запустить перевод символов и дождаться выполнения скрипта
start /wait lua53 preparations.lua

:: -U = нет необходимости писать .import label
:: -l = создать файл листинга для этого банка
:: -g = создать файл дебага для этого банка
ca65 -U -l -g copy_bank_00.asm
ca65 -U -l -g copy_bank_01.asm
ca65 -U -l -g copy_bank_02.asm
ca65 -U -l -g copy_bank_03.asm
ca65 -U -l -g copy_bank_04.asm
ca65 -U -l -g copy_bank_05.asm
ca65 -U -l -g copy_bank_06.asm
ca65 -U -l -g copy_bank_07.asm
ca65 -U -l -g copy_bank_FF.asm

:: компиляция кода в бинарники
ld65 -C ld65.cfg --dbgfile _debug.txt ^
    copy_bank_00.o ^
    copy_bank_01.o ^
    copy_bank_02.o ^
    copy_bank_03.o ^
    copy_bank_04.o ^
    copy_bank_05.o ^
    copy_bank_06.o ^
    copy_bank_07.o ^
    copy_bank_FF.o

:: сбор бинарников, хедера и chr в общий ром
copy /B header.bin + ^
    copy_bank_00.bin + ^
    copy_bank_01.bin + ^
    copy_bank_02.bin + ^
    copy_bank_03.bin + ^
    copy_bank_04.bin + ^
    copy_bank_05.bin + ^
    copy_bank_06.bin + ^
    copy_bank_07.bin + ^
    empty.bin + copy_bank_FF.bin + CHR_ROM.chr !goal5.nes

:: удалить остаточный хлам и копии
del *.o + copy_*.bin + copy_*.asm + copy_*.inc + temp_*.asm + temp_*.inc

:: объединить файлы листинга в один файл
copy /A copy_*.lst _listing.txt

:: удалить копии листинга
del copy_*.lst

:: проверить размер файла и вывести нужное сообщение
setlocal enableextensions
FOR %%A IN ("!goal5.nes") DO set "size=%%~zA"
if %size% EQU 393232 (
    echo.
    echo ----------------------------------------------
    echo Done! Look for !goal5.nes file in your folder.
    if exist !goal5.bak (
        echo.
        fc /A /B /T !goal5.nes !goal5.bak > nul && echo Perfect match || echo Differences found 
        echo.
        copy !goal5.nes !goal5.bak
        echo Backup created
    )
    echo ----------------------------------------------
    timeout /T 10
) else (
    echo.
    echo --------------------------------------------------
    echo Something's wrong, check log for more information.
    if exist !goal5.bak (
        echo.
        copy !goal5.bak !goal5.nes
        echo Backup restored
    )
    echo --------------------------------------------------
    echo.
    pause
)