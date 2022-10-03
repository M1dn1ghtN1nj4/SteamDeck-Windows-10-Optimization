mode 77,35
@echo off
Color a
Title Windows 10 for Steam Deck Optimization Script v1.00 by M1dn1ghtN1nj4
@setlocal enableextensions
@cd /d "%~dp0"
cd data


:main
cls
Echo/
Echo    ллллллллллллллллллллллллллллллллллллллллл
Echo    л    л  Windows 10 for Steam Deck  л    л
Echo    л    ллллл Optimization Script ллллл    л
Echo    л        л  By M1dn1ght N1nj4  л        л
Echo    л        ллллллллллллллллллллллл        л
Echo    л                                       л
Echo    л ллллллллллллллллллллллллллллллллллллл л
Echo    л л Optimize:                         л л
Echo    л л --------------------------------- л л
Echo    л л 1:  Optimize Windows              л л
Echo    л л 2:  Exit                          л л
Echo    л ллллллллллллллллллллллллллллллллллллл л
Echo    л                                 v1.00 л
Echo    л ллллллллллллллллллллллллллллллллллллллл
Echo/
set /p choice=Select: 
if %choice% == 1 goto OE
if %choice% == 2 goto exit

if not %choice% == 1 goto main
if not %choice% == 2 goto main

:OE
cls
Echo/
Echo  Optimizing Windows for Steam Deck...

Echo/
Echo    Optimizing the MFT...
Contig64.exe c:\$Mft >nul 2>&1

Echo/
Echo    Optimizing the USN journal...
fsutil usn deletejournal /D C: >nul 2>&1
@ping localhost -n 5 >NUL
fsutil usn createjournal m=1000 a=100 C: >nul 2>&1

Echo/
Echo    Cleaning up Windows temp files...
rd /s /q %temp% >nul 2>&1
mkdir %temp% >nul 2>&1
rd /s /q c:\windows\temp\ >nul 2>&1
mkdir c:\windows\temp\ >nul 2>&1

Echo/
Echo    Removing old Windows Update files...
net stop wuauserv >nul 2>&1
ren %systemroot%\SoftwareDistribution SoftwareDistribution.old >nul 2>&1
net start wuauserv >nul 2>&1
rd /s/q %systemroot%\SoftwareDistribution.old >nul 2>&1

Echo/
Echo    Optimizing Metadata...
Contig64.exe c:\$AttrDef >nul 2>&1
Echo    Processing:  $AttrDef
Contig64.exe c:\$BadClus >nul 2>&1
Echo    Processing:  $BadClus
Contig64.exe c:\$Bitmap >nul 2>&1
Echo    Processing:  $Bitmap
Contig64.exe c:\$Boot >nul 2>&1
Echo    Processing:  $Boot
Contig64.exe c:\$Extend >nul 2>&1
Echo    Processing:  $Extend
Contig64.exe c:\$LogFile >nul 2>&1
Echo    Processing:  $LogFile
Contig64.exe c:\$Secure >nul 2>&1
Echo    Processing:  $Secure
Contig64.exe c:\$UpCase >nul 2>&1
Echo    Processing:  $UpCase
Contig64.exe c:\$Volume >nul 2>&1
Echo    Processing:  $Volume

Echo/
Echo    Clearing Chrome cache...
set ChromeDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data >nul 2>&1
del /q /s /f "%ChromeDir%" >nul 2>&1
rd /s /q "%ChromeDir%" >nul 2>&1

Echo    Clearing Firefox cache...
set DataDir=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles >nul 2>&1
del /q /s /f "%DataDir%" >nul 2>&1
rd /s /q "%DataDir%" >nul 2>&1
for /d %%x in (C:\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\*) do del /q /s /f %%x\*sqlite >nul 2>&1

Echo    Clearing Internet Explorer cache...
set DataDir=C:\Users\%USERNAME%\AppData\Local\Microsoft\Intern~1 >nul 2>&1
del /q /s /f "%DataDir%" >nul 2>&1
rd /s /q "%DataDir%" >nul 2>&1
set History=C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\History >nul 2>&1
del /q /s /f "%History%" >nul 2>&1
rd /s /q "%History%" >nul 2>&1
set IETemp=C:\Users\%USERNAME%\AppData\Local\Microsoft\Windows\Tempor~1 >nul 2>&1
del /q /s /f "%IETemp%" >nul 2>&1
rd /s /q "%IETemp%" >nul 2>&1
set Cookies=C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Cookies >nul 2>&1
del /q /s /f "%Cookies%" >nul 2>&1
rd /s /q "%Cookies%" >nul 2>&1

Echo    Clearing Safari cache...
set DataDir=C:\Users\%USERNAME%\AppData\Local\Applec~1\Safari >nul 2>&1
set DataDir2=C:\Users\%USERNAME%\AppData\Roaming\Applec~1\Safari >nul 2>&1
del /q /s /f "%DataDir%\History" >nul 2>&1
rd /s /q "%DataDir%\History" >nul 2>&1
del /q /s /f "%DataDir%\Cache.db" >nul 2>&1
del /q /s /f "%DataDir%\WebpageIcons.db" >nul 2>&1
del /q /s /f "%DataDir2%" >nul 2>&1
rd /s /q "%DataDir2%" >nul 2>&1

Echo    Clearing Opera cache...
set DataDir=C:\Users\%USERNAME%\AppData\Local\Opera\Opera >nul 2>&1
set DataDir2=C:\Users\%USERNAME%\AppData\Roaming\Opera\Opera >nul 2>&1
del /q /s /f "%DataDir%" >nul 2>&1
rd /s /q "%DataDir%" >nul 2>&1
del /q /s /f "%DataDir2%" >nul 2>&1
rd /s /q "%DataDir2%" >nul 2>&1

Echo/
Echo    Clearing Flash cookies...
set FlashCookies=C:\Users\%USERNAME%\AppData\Roaming\Macromedia\Flashp~1 >nul 2>&1
del /q /s /f "%FlashCookies%" >nul 2>&1
rd /s /q "%FlashCookies%" >nul 2>&1








REMOVING WINDOWS APPLICATIONS::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Uninstall OneDrive
taskkill /F /IM "OneDrive.exe" >nul 2>&1
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall >nul 2>&1
rd "%UserProfile%\OneDrive" /Q /S >nul 2>&1
rd "%LocalAppData%\Microsoft\OneDrive" /Q /S >nul 2>&1
rd "%ProgramData%\Microsoft OneDrive" /Q /S >nul 2>&1
rd "C:\OneDriveTemp" /Q /S >nul 2>&1



:: Set Hibernation file to disabled
powercfg /h off >nul 2>&1


:: Disable Windows Defender SmartScreen Filter
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f >nul 2>&1


:: Disable all Content Delivery Manager features
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RemediationRequired" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-314563Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338387Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable all suggested apps
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "22StokedOnIt.NotebookPro_ffs55s3hze5sr" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "2FE3CB00.PicsArt-PhotoStudio_crhqpqs3x1ygc" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "41038Axilesoft.ACGMediaPlayer_wxjjre7dryqb6" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "5CB722CC.SeekersNotesMysteriesofDarkwood_ypk0bew5psyra" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "7458BE2C.WorldofTanksBlitz_x4tje2y229k00" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "828B5831.HiddenCityMysteryofShadows_ytsefhwckbdv6" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "828B5831.TheSecretSociety-HiddenMystery_ytsefhwckbdv6" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "89006A2E.AutodeskSketchBook_tf1gferkr813w" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "9E2F88E3.Twitter_wgeqdkkx372wm" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "A278AB0D.AsphaltStreetStormRacing_h6adky7gbf63m" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "A278AB0D.DisneyMagicKingdoms_h6adky7gbf63m" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "A278AB0D.DragonManiaLegends_h6adky7gbf63m" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "A278AB0D.MarchofEmpires_h6adky7gbf63m" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "AdobeSystemsIncorporated.PhotoshopElements2018_ynb6jyjzte8ga" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "CAF9E577.Plex_aam28m9va5cke" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "DolbyLaboratories.DolbyAccess_rz1tebttyb220" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Drawboard.DrawboardPDF_gqbn7fs4pywxm" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Expedia.ExpediaHotelsFlightsCarsActivities_0wbx8rnn4qk5c" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Facebook.317180B0BB486_8xx8rvfyw5nnt" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Facebook.Facebook_8xx8rvfyw5nnt" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Facebook.InstagramBeta_8xx8rvfyw5nnt" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Fitbit.FitbitCoach_6mqt6hf9g46tw" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "flaregamesGmbH.RoyalRevolt2_g0q0z3kw54rap" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "GAMELOFTSA.Asphalt8Airborne_0pp20fcewvvtj" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "king.com.BubbleWitch3Saga_kgqvnymyfvs32" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "king.com.CandyCrushSaga_kgqvnymyfvs32" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "king.com.CandyCrushSodaSaga_kgqvnymyfvs32" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.AgeCastles_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.BingNews_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.BingSports_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.BingWeather_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "microsoft.microsoftskydrive_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.MinecraftUWP_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Microsoft.MSPaint_8wekyb3d8bbwe" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "NAVER.LINEwin8_8ptj331gd3tyt" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "Nordcurrent.CookingFever_m9bz608c1b9ra" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "SiliconBendersLLC.Sketchable_r2kxzpx527qgj" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "SpotifyAB.SpotifyMusic_zpdnekdrzrea0" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "ThumbmunkeysLtd.PhototasticCollage_nfy108tqq3p12" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "USATODAY.USATODAY_wy7mw3214mat8" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v "WinZipComputing.WinZipUniversal_3ykzqggjzj4z0" /t REG_DWORD /d "0" /f >nul 2>&1


:: Disable Network Location Wizard prompts
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Network\NewNetworkWindowOff" /f >nul 2>&1


:: Disable Gamebar
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "MicrophoneCaptureEnabled" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable automatic updates
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f >nul 2>&1

:: File Explorer opens to This PC
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "1" /f >nul 2>&1

:: Disable Aero Shake
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d "1" /f >nul 2>&1

:: Disable "Look for an app in the Store" dialogue
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t REG_DWORD /d "1" /f >nul 2>&1

:: Disable "You have new apps that can open this type of file" notification
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoNewAppAlert" /t REG_DWORD /d "1" /f >nul 2>&1

:: Disable "Windows protected your PC" dialogue
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d "1" /f >nul 2>&1

:: Disable Error Reporting
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f >nul 2>&1

:: Keep thumbnail cache upon Restart
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v "Autorun" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v "Autorun" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable Cortana
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Windows Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v "DisableVoice" /t REG_DWORD /d "1" /f >nul 2>&1



:: Add "Open Command Prompt here" to context menus
SetACL.exe -silent -on "HKCR\Directory\shell\cmd" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\shell\cmd" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -silent -on "HKCR\Directory\shell\cmd\command" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\shell\cmd\command" -ot reg -actn ace -ace "n:Administrators;p:full"
reg delete "HKCR\Directory\shell\cmd" /f >nul 2>&1
reg add "HKCR\Directory\shell\runas" /v "" /t REG_SZ /d "Open Command Prompt here" /f >nul 2>&1
reg add "HKCR\Directory\shell\runas" /v "Icon" /t REG_SZ /d "cmd.exe" /f >nul 2>&1
reg add "HKCR\Directory\shell\runas" /v "NeverDefault" /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\Directory\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\Directory\shell\runas" /v "Position" /t REG_SZ /d "Top" /f >nul 2>&1
reg add "HKCR\Directory\shell\runas\command" /v "" /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f >nul 2>&1
SetACL.exe -silent -on "HKCR\Directory\Background\shell\cmd" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\cmd" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\cmd\command" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\cmd\command" -ot reg -actn ace -ace "n:Administrators;p:full"
reg delete "HKCR\Directory\Background\shell\cmd" /f >nul 2>&1
reg add "HKCR\Directory\Background\shell\runas" /v "" /t REG_SZ /d "Open Command Prompt here" /f >nul 2>&1
reg add "HKCR\Directory\Background\shell\runas" /v "Icon" /t REG_SZ /d "cmd.exe" /f >nul 2>&1
reg add "HKCR\Directory\Background\shell\runas" /v "NeverDefault" /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\Directory\Background\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\Directory\Background\shell\runas" /v "Position" /t REG_SZ /d "Top" /f >nul 2>&1
reg add "HKCR\Directory\Background\shell\runas\command" /v "" /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f >nul 2>&1
reg add "HKCR\LibraryFolder\Shell\runas" /v "" /t REG_SZ /d "Open Command Prompt here" /f >nul 2>&1
reg add "HKCR\LibraryFolder\Shell\runas" /v "Icon" /t REG_SZ /d "cmd.exe" /f >nul 2>&1
reg add "HKCR\LibraryFolder\Shell\runas" /v "NeverDefault" /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\LibraryFolder\Shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\LibraryFolder\Shell\runas" /v "Position" /t REG_SZ /d "Top" /f >nul 2>&1
reg add "HKCR\LibraryFolder\Shell\runas\command" /v "" /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f >nul 2>&1
reg add "HKCR\LibraryFolder\background\shell\runas" /v "" /t REG_SZ /d "Open Command Prompt here" /f >nul 2>&1
reg add "HKCR\LibraryFolder\background\shell\runas" /v "Icon" /t REG_SZ /d "cmd.exe" /f >nul 2>&1
reg add "HKCR\LibraryFolder\background\shell\runas" /v "NeverDefault" /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\LibraryFolder\background\shell\runas" /v "NoWorkingDirectory" /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\LibraryFolder\background\shell\runas" /v "Position" /t REG_SZ /d "Top" /f >nul 2>&1
reg add "HKCR\LibraryFolder\background\shell\runas\command" /v "" /t REG_SZ /d "cmd.exe /s /k pushd \"%%V\"" /f >nul 2>&1

:: Remove "Open PowerShell window here" from Shift+Right-click context menus
SetACL.exe -silent -on "HKCR\Directory\shell\Powershell" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\shell\Powershell" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -silent -on "HKCR\Directory\shell\Powershell\command" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\shell\Powershell\command" -ot reg -actn ace -ace "n:Administrators;p:full"
reg delete "HKCR\Directory\shell\Powershell" /f >nul 2>&1
SetACL.exe -silent -on "HKCR\Directory\Background\shell\Powershell" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\Powershell" -ot reg -actn ace -ace "n:Administrators;p:full"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\Powershell\command" -ot reg -actn setowner -ownr "n:Administrators"
SetACL.exe -silent -on "HKCR\Directory\Background\shell\Powershell\command" -ot reg -actn ace -ace "n:Administrators;p:full"
reg delete "HKCR\Directory\Background\shell\Powershell" /f >nul 2>&1


:: Disable online tips in Settings
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "AllowOnlineTips" /t REG_DWORD /d "0" /f >nul 2>&1


:: Remove 3D Objects from This PC
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f >nul 2>&1
reg delete "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f >nul 2>&1


:: Disable search history in File Explorer
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d "1" /f >nul 2>&1


:: Remove OneDrive from Navigation Pane
reg add "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /v "System.IsPinnedToNameSpaceTree" /t REG_DWORD /d "0" /f >nul 2>&1


:: Disable suggested apps Windows Ink WorkSpace
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PenWorkspace" /v "PenWorkspaceAppSuggestionsEnabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Classes\CLSID\{679f85cb-0220-4080-b29b-5540cc05aab6}" /v "AllowSuggestedAppsInWindowsInkWorkspace" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable Sharing of handwriting data
reg add "HKLM\Software\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d "1" /f >nul 2>&1

:: Disable Sharing of handwriting error reports
reg add "HKLM\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d "1" /f >nul 2>&1

:: Disable Inventory Collector
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d "1" /f >nul 2>&1

:: Disable Camera in login screen
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\AccessPage\Camera" /v "CameraEnabled" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable Advertising ID
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Id" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Id" /f >nul 2>&1

:: Disable transmission of typing information
reg add "HKCU\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable Microsoft conducting experiments with this machine
reg add "HKLM\Software\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable advertisements via Bluetooth
reg add "HKLM\Software\Microsoft\PolicyManager\current\device\Bluetooth" /v "AllowAdvertising" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable Windows Customer Experience Improvement Program
reg add "HKLM\Software\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable syncing of text messages to Microsoft
reg add "HKLM\Software\Policies\Microsoft\Windows\Messaging" /v "AllowMessageSync" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable user steps recorder
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d "1" /f >nul 2>&1

:: Disable telemetry
reg add "HKLM\SYSTEM\ControlSet001\Services\DiagTrack" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f >nul 2>&1
reg add "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable synchronization of all settings to Microsoft
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync" /v "SyncPolicy" /t REG_DWORD /d "5" /f >nul 2>&1

:: Disable Input Personalization
reg add "HKCU\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicyy" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d "1" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable updates for Speech Recognition and Speech Synthesis
reg add "HKLM\Software\Microsoft\Speech_OneCore\Preferences" /v "ModelDownloadAllowed" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Speech" /v "AllowSpeechModelUpdate" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable peer-to-peer functionality in Windows Update
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable ads in File Explorer and OneDrive
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable feedback reminders
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKLM\Software\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d "0" /f >nul 2>&1

:: Remove Search/Cortana from taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f >nul 2>&1

:: Remove Task View button from taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d "0" /f >nul 2>&1

:: Remove People buttom from taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d "0" /f >nul 2>&1

:: Hide frequently used folders in "Quick access"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d "0" /f >nul 2>&1

:: Hide recent files in "Quick access"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable Timeline
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f >nul 2>&1

:: Remove "Edit with photos" from context menus
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "ActivatableClassId" /t REG_SZ /d "App.AppX65n3t4j73ch7cremsjxn7q8bph1ma8jw.mca" /f >nul 2>&1
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "PackageId" /t REG_SZ /d "Microsoft.Windows.Photos_2017.18062.12990.0_x64__8wekyb3d8bbwe" /f >nul 2>&1
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "ContractId" /t REG_SZ /d "Windows.File" /f >nul 2>&1
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "DesiredInitialViewState" /t REG_DWORD /d "0" /f >nul 2>&1
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "" /t REG_SZ /d "@{Microsoft.Windows.Photos_2017.18062.12990.0_x64__8wekyb3d8bbwe?ms-resource://Microsoft.Windows.Photos/Resources/EditWithPhotos}" /f >nul 2>&1
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit" /v "ProgrammaticAccessOnly" /t REG_SZ /d "" /f >nul 2>&1
reg add "HKCR\AppX43hnxtbyyps62jhe9sqpdzxn1790zetc\Shell\ShellEdit\command" /v "DelegateExecute" /t REG_SZ /d "{4ED3A719-CEA8-4BD9-910D-E252F997AFC2}" /f >nul 2>&1

:: Remove "Edit with Paint 3D" from context menus
reg delete "HKLM\Software\Classes\SystemFileAssociations\.bmp\Shell\3D Edit" /f >nul 2>&1
reg delete "HKLM\Software\Classes\SystemFileAssociations\.jpeg\Shell\3D Edit" /f >nul 2>&1
reg delete "HKLM\Software\Classes\SystemFileAssociations\.jpe\Shell\3D Edit" /f >nul 2>&1
reg delete "HKLM\Software\Classes\SystemFileAssociations\.jpg\Shell\3D Edit" /f >nul 2>&1
reg delete "HKLM\Software\Classes\SystemFileAssociations\.png\Shell\3D Edit" /f >nul 2>&1
reg delete "HKLM\Software\Classes\SystemFileAssociations\.gif\Shell\3D Edit" /f >nul 2>&1
reg delete "HKLM\Software\Classes\SystemFileAssociations\.tif\Shell\3D Edit" /f >nul 2>&1
reg delete "HKLM\Software\Classes\SystemFileAssociations\.tiff\Shell\3D Edit" /f >nul 2>&1

:: Remove "Include in library" from context menus
reg delete "HKCR\Folder\ShellEx\ContextMenuHandlers\Library Location" /f >nul 2>&1

:: Disable Microsoft Edge prelaunching
reg add "HKCU\Software\Policies\Microsoft\MicrosoftEdge\TabPreloader" /v "AllowPrelaunch" /t REG_DWORD /d "0" /f >nul 2>&1

:: Disable Microsoft Edge tab preloading
reg add "HKCU\Software\Policies\Microsoft\MicrosoftEdge\TabPreloader" /v "AllowTabPreloading" /t REG_DWORD /d "0" /f >nul 2>&1










:: Remove potential bloat
powershell.exe "Get-AppxPackage *Microsoft.3DBuilder* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Appconnector* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.BingFinance* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.BingNews* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.BingSports* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.BingTranslator* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.FreshPaint* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.DesktopAppInstaller* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.MicrosoftPowerBIForWindows* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.MinecraftUWP* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.NetworkSpeedTest* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.WindowsPhone* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.CommsPhone* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.ConnectivityStore* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Office.Sway* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.BingFoodAndDrink* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.BingTravel* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.BingHealthAndFitness* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *9E2F88E3.Twitter* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *PandoraMediaInc.29680B314EFC2* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Flipboard.Flipboard* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *ShazamEntertainmentLtd.Shazam* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *king.com.CandyCrushSaga* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *king.com.CandyCrushSodaSaga* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *king.com.* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *ClearChannelRadioDigital.iHeartRadio* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *4DF9E0F8.Netflix* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *6Wunderkinder.Wunderlist* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Drawboard.DrawboardPDF* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *22StokedOnIt.NotebookPro* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *2FE3CB00.PicsArt-PhotoStudio* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *41038Axilesoft.ACGMediaPlayer* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *5CB722CC.SeekersNotesMysteriesofDarkwood* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *7458BE2C.WorldofTanksBlitz* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *D52A8D61.FarmVille2CountryEscape | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *TuneIn.TuneInRadio* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *GAMELOFTSA.Asphalt8Airborne* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *TheNewYorkTimes.NYTCrossword* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *DB6EA5DB.CyberLinkMediaSuiteEssentials* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Facebook.Facebook* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *flaregamesGmbH.RoyalRevolt2* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Playtika.CaesarsSlotsFreeCasino* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *A278AB0D.MarchofEmpires* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *KeeperSecurityInc.Keeper* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *ThumbmunkeysLtd.PhototasticCollage* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *INGAG.XING* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *89006A2E.AutodeskSketchBook* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *D5EA27B7.Duolingo-LearnLanguagesforFree* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *46928bounde.EclipseManager* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *ActiproSoftwareLLC.562882FEEB49* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *DolbyLaboratories.DolbyAccess* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *SpotifyAB.SpotifyMusic* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *A278AB0D.DisneyMagicKingdoms* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *WinZipComputing.WinZipUniversal* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.MSPaint* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Office.OneNote* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.OneConnect* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Print3D* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.SkypeApp* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Wallet* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Windows.Photos* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.WindowsCamera* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.windowscommunicationsapps* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.XboxApp* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.Xbox.TCUI* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *828B5831.HiddenCityMysteryofShadows* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *king.com.BubbleWitch3Saga* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Fitbit.FitbitCoach* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Facebook.InstagramBeta* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Facebook.317180B0BB486* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Expedia.ExpediaHotelsFlightsCarsActivities* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *CAF9E577.Plex* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *AdobeSystemsIncorporated.PhotoshopElements2018* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *A278AB0D.DragonManiaLegends* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *A278AB0D.AsphaltStreetStormRacing* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *828B5831.TheSecretSociety-HiddenMystery* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *USATODAY.USATODAY* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *SiliconBendersLLC.Sketchable* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Nordcurrent.CookingFever* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *NAVER.LINEwin8* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *microsoft.microsoftskydrive* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.AgeCastles* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.ScreenSketch* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.WebMediaExtensions* | Remove-AppxPackage"
powershell.exe "Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage"

:: Remove potential bloat for new users
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.DesktopAppInstaller* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.3DBuilder* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Appconnector* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingFinance* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingNews* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingSports* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingTranslator* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingWeather* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.FreshPaint* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.DesktopAppInstaller* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Getstarted* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.GetHelp* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Messaging* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Microsoft3DViewer* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MicrosoftOfficeHub* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MicrosoftPowerBIForWindows* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MicrosoftStickyNotes* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MinecraftUWP* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.NetworkSpeedTest* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsPhone* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.CommsPhone* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.ConnectivityStore* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Office.Sway* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingFoodAndDrink* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingTravel* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingHealthAndFitness* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *9E2F88E3.Twitter* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *PandoraMediaInc.29680B314EFC2* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Flipboard.Flipboard* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *ShazamEntertainmentLtd.Shazam* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *king.com.CandyCrushSaga* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *king.com.CandyCrushSodaSaga* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *king.com.* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *ClearChannelRadioDigital.iHeartRadio* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *4DF9E0F8.Netflix* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *6Wunderkinder.Wunderlist* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Drawboard.DrawboardPDF* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *22StokedOnIt.NotebookPro* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *2FE3CB00.PicsArt-PhotoStudio* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *41038Axilesoft.ACGMediaPlayer* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *5CB722CC.SeekersNotesMysteriesofDarkwood* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *7458BE2C.WorldofTanksBlitz* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *D52A8D61.FarmVille2CountryEscape | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *TuneIn.TuneInRadio* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *GAMELOFTSA.Asphalt8Airborne* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *TheNewYorkTimes.NYTCrossword* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *DB6EA5DB.CyberLinkMediaSuiteEssentials* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Facebook.Facebook* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *flaregamesGmbH.RoyalRevolt2* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Playtika.CaesarsSlotsFreeCasino* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *A278AB0D.MarchofEmpires* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *KeeperSecurityInc.Keeper* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *ThumbmunkeysLtd.PhototasticCollage* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *INGAG.XING* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *89006A2E.AutodeskSketchBook* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *D5EA27B7.Duolingo-LearnLanguagesforFree* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *46928bounde.EclipseManager* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *ActiproSoftwareLLC.562882FEEB49* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *DolbyLaboratories.DolbyAccess* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *SpotifyAB.SpotifyMusic* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *A278AB0D.DisneyMagicKingdoms* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *WinZipComputing.WinZipUniversal* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MSPaint* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Office.OneNote* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.OneConnect* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.People* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Print3D* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.SkypeApp* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Wallet* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Windows.Photos* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsAlarms* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsCamera* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.windowscommunicationsapps* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsFeedbackHub* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsMaps* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsSoundRecorder* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.XboxApp* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Xbox.TCUI* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.ZuneMusic* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.ZuneVideo* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *828B5831.HiddenCityMysteryofShadows* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *king.com.BubbleWitch3Saga* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Fitbit.FitbitCoach* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Facebook.InstagramBeta* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Facebook.317180B0BB486* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Expedia.ExpediaHotelsFlightsCarsActivities* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *CAF9E577.Plex* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *AdobeSystemsIncorporated.PhotoshopElements2018* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *A278AB0D.DragonManiaLegends* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *A278AB0D.AsphaltStreetStormRacing* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *828B5831.TheSecretSociety-HiddenMystery* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *USATODAY.USATODAY* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *SiliconBendersLLC.Sketchable* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Nordcurrent.CookingFever* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *NAVER.LINEwin8* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *microsoft.microsoftskydrive* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.AgeCastles* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.ScreenSketch* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.YourPhone* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WebMediaExtensions* | Remove-AppxProvisionedPackage -Online"
powershell.exe "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MixedReality.Portal* | Remove-AppxProvisionedPackage -Online"


:: Disable Maps Broker service
sc stop MapsBroker >nul 2>&1
sc config MapsBroker start= disabled >nul 2>&1



:: Enable TRIM if it isn't already, and run TRIM
fsutil behavior set DisableDeleteNotify 0
powershell -Command "Optimize-Volume -DriveLetter C -ReTrim"






Echo/
Echo  -- EVERYTHING HAS BEEN OPTIMIZED --
Echo/
Pause
Goto main




:exit
cls
Echo/
@ping localhost -n 5 >NUL
exit
