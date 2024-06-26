; Informations g�n�rales

#define PackageDir="..\..\Builds\Package" 
#define MyAppName="LUGE 2024.2 Demonstration"
#define MajorMinorFix="24.2.0" 
#define BuildNumber="0" 
#define PackageName="luge-2024.2-demonstration_" + MajorMinorFix + "-" + BuildNumber + "_windows_all.nipkg"
#define MyIcon=""
#define OutputDir="..\..\Builds\Online Installer\"
#define PassiveMode=""
#define BuildNumberInfos=MajorMinorFix + "." + BuildNumber
#define MyAppPublisher="BioLogic"
#define MyAppURL="https://www.biologic.net"
#define FeedURL="L:\Demonstration\Builds\Feed"
#define FeedName="LUGE-2024-2"



; D�finition de l'ann�e pour le tag AppCopyright
#define MyYearStr GetDateTimeString('yyyy', , )

[Setup]
; NOTE: Do not set AppId, this installer is only a support for Package. We don't want any inscription in Programs for this installer.
;AppId={#MyAppName}
UsePreviousLanguage=no
UsePreviousAppDir=no
CreateUninstallRegKey=no

;D�finitiion des informations de l'installeur
AppName={#MyAppName}
;UninstallDisplayName={#MyAppName}
UpdateUninstallLogAppName=yes
AppVersion={#MajorMinorFix}
AppVerName={#MyAppName} {#MajorMinorFix}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
SetupIconFile={#MyIcon}
DefaultGroupName={#MyAppName}
VersionInfoProductName={#MyAppName} Setup {#MajorMinorFix}
VersionInfoCompany={#MyAppPublisher}
VersionInfoDescription={#MyAppName}
VersionInfoVersion={#BuildNumberInfos}
AppCopyright=� {#MyYearStr} {#MyAppPublisher} 
OutputBaseFilename={#MyAppPublisher}_{#MyAppName}_Setup_{#MajorMinorFix}
OutputDir={#OutputDir}
;Configuration de la build de l'installeur 
Compression=lzma
SolidCompression=yes
WizardStyle=modern
DisableDirPage=yes
DisableProgramGroupPage=yes
AlwaysShowComponentsList=yes
AlwaysRestart=no
;Configuration des pr�-requis de l'installeur � l'ex�cution
;MinVersion 10.0 conrrespond � Windows 10 1507
MinVersion=10.0
; PrivilegesRequired admin or lowest. Lowest will not require Admin
PrivilegesRequired=admin
DefaultDirName={%TEMP}\LUGE


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: ".\NIPackageManager22.5.0_online.exe"; DestDir: "{app}" ; Excludes: ""; Flags: ignoreversion deleteafterinstall
Source: "{#PackageDir}\{#PackageName}"; DestDir: "{app}" ; Excludes: ""; Flags: ignoreversion deleteafterinstall

[Run]
Filename: "{app}\NIPackageManager22.5.0_online.exe"; StatusMsg: "Installing NI Package Manager..."; Parameters: "--passive --accept-eulas --prevent-reboot"
#ifdef FeedName
  Filename: "{commonpf64}\National Instruments\NI Package Manager\nipkg.exe"; StatusMsg: "Registering Feed..."; Parameters: "feed-add ""{#FeedURL}"" --name=""{#FeedName}"" "
#endif
Filename: "{commonpf64}\National Instruments\NI Package Manager\NIPackageManager.exe"; StatusMsg: "Installing Application Package..."; Parameters: "install {app}\{#PackageName} {#PassiveMode} --accept-eulas --prevent-reboot"
