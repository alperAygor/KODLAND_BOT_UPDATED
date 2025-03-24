@echo off
REM Python yüklü mü kontrol et
python --version >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    echo Python sistemde bulunamadi, yukleniyor...
    REM Python yükleyicisini çalıştır
    REM Python yükleyicisinin tam yolunu yazın (örn. python-3.x.x.exe)
    start /wait python-3.x.x.exe /quiet InstallAllUsers=1 PrependPath=1
    echo Python kurulumu tamamlandi.
) ELSE (
    echo Python zaten yüklü: %ERRORLEVEL%
)
python -m pip install --upgrade pip

if not exist "requirements.txt" (
    echo discord.py > requirements.txt
    echo python-dotenv >> requirements.txt
    echo aiohttp >> requirements.txt
    echo requests >> requirements.txt
    echo pytest >> requirements.txt
    echo pytest-asyncio >> requirements.txt
    echo cryptography >> requirements.txt
)

:: Bağımlılıkları yükle
python -m pip install -r requirements.txt
cls
python bot.py 
pause

