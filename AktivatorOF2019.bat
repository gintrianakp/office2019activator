@echo off
title Aktivasi Microsoft Office 2019 by GIN3TECH&cls&(net session >nul 2>&1)
if %errorLevel% GTR 0 (echo.&echo Aktivasi tidak bisa dilanjut, Anda harus Run CMD as administrator...&echo.&goto halt)
echo =====================================================================================&echo #Project: Aktivasi Microsoft Office 2019 by GIN3TECH&echo =====================================================================================&echo.&echo #Supported products:&echo - Microsoft Office Standard 2019&echo - Microsoft Office Professional Plus 2019&echo.&echo.&echo Memulai proses aktivasi, silahkan tunggu...&echo.&(if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16")&(if exist "%ProgramFiles(x86)%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles(x86)%\Microsoft Office\Office16")&tasklist /FI "IMAGENAME eq WINWORD.EXE" 2>NUL | find /I /N "WINWORD.EXE">NUL && taskkill /F /IM WINWORD.EXE >nul&tasklist /FI "IMAGENAME eq EXCEL.EXE" 2>NUL | find /I /N "EXCEL.EXE">NUL && taskkill /F /IM EXCEL.EXE >nul&tasklist /FI "IMAGENAME eq POWERPNT.EXE" 2>NUL | find /I /N "POWERPNT.EXE">NUL && taskkill /F /IM POWERPNT.EXE >nul&(REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\Licensing" /f >nul 2>NUL)&(cscript //nologo ospp.vbs /setprt:1688 >nul || goto wshdisabled)&(for /f %%x in ('dir /b ..\root\Licenses16\ProPlus2019VL*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)&(for /f %%x in ('dir /b ..\root\Licenses16\ProPlus2019VL*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul)&cscript //nologo ospp.vbs /unpkey:WFG99 >nul&cscript //nologo ospp.vbs /unpkey:6MWKP >nul&cscript //nologo ospp.vbs /unpkey:6F7TH >nul
:ucpkey
cscript //nologo ospp.vbs /dstatus | find /i "Last 5 characters of installed product key" > temp.txt || goto skunpkey
set /P bpkey= < temp.txt
set pkeyt=%bpkey:~-5%
echo.&cscript //nologo ospp.vbs /unpkey:%pkeyt% >nul&goto ucpkey
:skunpkey
echo.&echo =====================================================================================&echo Mengaktivasi Office 2019 anda, silahkan tunggu...&echo =====================================================================================&cscript //nologo slmgr.vbs /ckms >nul&cscript //nologo ospp.vbs /setprt:1688 >nul&set i=1&cscript //nologo ospp.vbs /inpkey:NMMKJ-6RK4F-KMJVX-8D9MJ-6MWKP >nul||goto notsupported
:server
if %i% GTR 5 (goto busy) else if %i% LEQ 5 (set KMS=s1.mshost.pro)
cscript //nologo ospp.vbs /sethst:%KMS% >nul
:ato
echo.&echo =====================================================================================&cscript //nologo ospp.vbs /act >nul&timeout /t 5 >nul&echo.&cscript //nologo ospp.vbs /act | find /i "successful" && (echo.&echo =====================================================================================&echo.&echo.&echo Dukung kami dengan follow IG kami yaitu instagram.com/gin3tech agar cara ini bisa terus digunakan.&echo.& if errorlevel 2 exit) || (echo Sepertinya butuh waktu lebih, silahkan tunggu... & echo. & echo. & set /a i+=1 & timeout /t 10 >nul & goto server)&timeout /t 7 >nul&explorer "https://instagram.com/gin3tech"&echo.&echo Jika sudah follow IG dan Office masih bermasalah, chat via Instagram @gin3tech&echo.&goto halt
:notsupported
echo.&echo =====================================================================================&echo Maaf, Office 2019 anda tidak support.&echo.&goto halt
:wshdisabled
echo =====================================================================================&echo.&echo Maaf, aktivasi gagal karena Windows Script Host access is disabled.&echo.&echo Solusinya, ikuti panduan pada video tutorial yang terbuka untuk mengizinkan Windows Script.&echo.&timeout /t 7 >nul&explorer "https://youtu.be/vqGMSQnWMIY"&goto halt
:busy
echo =====================================================================================&echo.&echo.&echo Maaf, aktivasi gagal karena koneksi internet anda tidak stabil.&echo.&echo Silahkan sambungkan Laptop anda ke WiFi lain kemudian ulangi lagi cara ini.&echo.&goto halt
:halt
cd %~dp0&del %0 >nul&pause >nul