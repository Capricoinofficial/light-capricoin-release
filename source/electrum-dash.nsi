;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General

  ;Name and file
  Name "Light Capricoin Wallet"
  OutFile "dist/light-capricoin-setup.exe"

  ;Default installation folder
  InstallDir "$PROGRAMFILES\Light Capricoin Wallet"

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\Light Capricoin Wallet" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel admin

;--------------------------------
;Variables

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------
;Pages

  ;!insertmacro MUI_PAGE_LICENSE "tmp/LICENCE"
  ;!insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY

  ;Start Menu Folder Page Configuration
  !define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU"
  !define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\Light Capricoin Wallet"
  !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"

  ;!insertmacro MUI_PAGE_STARTMENU Application $StartMenuFolder

  !insertmacro MUI_PAGE_INSTFILES

  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Section

  SetOutPath "$INSTDIR"

  ;ADD YOUR OWN FILES HERE...
  file /r dist\light-capricoin\*.*

  ;Store installation folder
  WriteRegStr HKCU "Software\Light Capricoin Wallet" "" $INSTDIR

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"


  CreateShortCut "$DESKTOP\Light Capricoin Wallet.lnk" "$INSTDIR\light-capricoin.exe" ""

  ;create start-menu items
  CreateDirectory "$SMPROGRAMS\Light Capricoin Wallet"
  CreateShortCut "$SMPROGRAMS\Light Capricoin Wallet\Uninstall.lnk" "$INSTDIR\Uninstall.exe" "" "$INSTDIR\Uninstall.exe" 0
  CreateShortCut "$SMPROGRAMS\Light Capricoin Wallet\Light Capricoin Wallet.lnk" "$INSTDIR\light-capricoin.exe" "" "$INSTDIR\light-capricoin.exe" 0

SectionEnd

;--------------------------------
;Descriptions

  ;Assign language strings to sections
  ;!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
  ;  !insertmacro MUI_DESCRIPTION_TEXT ${SecDummy} $(DESC_SecDummy)
  ;!insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...
  RMDir /r "$INSTDIR\*.*"

  RMDir "$INSTDIR"

  Delete "$DESKTOP\Light Capricoin Wallet.lnk"
  Delete "$SMPROGRAMS\Light Capricoin Wallet\*.*"
  RmDir  "$SMPROGRAMS\Light Capricoin Wallet"

  DeleteRegKey /ifempty HKCU "Software\Light Capricoin Wallet"

SectionEnd
