; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#include "./scripts/common.iss"

[Setup]
AppName=GameMod
AppVersion=v0.0.1
DefaultGroupName=LinkerMod
UninstallDisplayIcon={app}\GameMod.exe
Compression=lzma2
SolidCompression=yes
OutputDir=./build/
DisableWelcomePage=no

WizardImageFile=C:\Users\SE2Dev\Pictures\dface_512x512.bmp
WizardSmallImageFile=C:\Users\SE2Dev\Pictures\dface_512x512.bmp

; Install Path Options
DefaultDirName={code:GetDefaultDir}
AppendDefaultDirName=no
UsePreviousAppDir=no
DirExistsWarning=no
DisableDirPage=No

[Languages]
Name: english; MessagesFile: compiler:Default.isl

[Registry]
; LinkerMod Registry Group
Root: HKLM; Subkey: "Software\LinkerMod"; \
			Flags: uninsdeletekeyifempty createvalueifdoesntexist;

; {AppName} Registry Group
Root: HKLM; Subkey: "Software\LinkerMod\{#SetupSetting('AppName')}"; \
			Flags: uninsdeletekey deletevalue;

Root: HKLM; Subkey: "Software\LinkerMod\{#SetupSetting('AppName')}"; \
			Flags: createvalueifdoesntexist uninsclearvalue; \
			ValueType: string; \
			ValueName: "InstallPath"; \
			ValueData: "{app}"; 

Root: HKLM; Subkey: "Software\LinkerMod\{#SetupSetting('AppName')}"; \
			Flags: createvalueifdoesntexist uninsclearvalue; \
			ValueType: string; \
			ValueName: "CurrentVersion"; \
			ValueData: "{#SetupSetting('AppVersion')}" 

[Icons]
; Start Menu Shortcuts
Name: "{group}\GameMod"; Filename: "{app}\bin\BlackOps.exe";
Name: "{group}\Uninstall GameMod"; Filename: "{uninstallexe}"

; Desktop Shortcut
Name: "{commondesktop}\GameMod"; Filename: "{app}\bin\BlackOps.exe";

[Components]
Name: "GameMod"; Description: "Game Mod"; Types: full compact custom; Flags: fixed

[Files]
Source: "build\Release\bootstrap.dll";	DestDir: "{app}"
; Flags: dontcopy
Source: "build\Release\proxy.dll";			DestDir: "{app}\bin";
Source: "build\Release\game_mod.dll";		DestDir: "{app}\bin"; Components: GameMod

[Code]
// Test
// var progress:TOutputProgressWizardPage;

procedure InitializeWizard;
// var
	// UserPage: TWizardPage;
	// ListBox: TNewListBox; 
	// tags: TStringList;
	// i: Cardinal;
begin
	 {Create our own progress page for the initial download of a small
		textfile from the server which says what the latest version is}
	//	progress := CreateOutputProgressPage(ITD_GetString(ITDS_Update_Caption), ITD_GetString(ITDS_Update_Description));
end;

function NextButtonClick(curPageID:integer): boolean;
begin
	Result := True;

	//
	// Validate the install path
	//
	if (CurPageID = wpSelectDir) and (SetInstallPath(WizardDirValue) = false) then
	begin
		Result := False;
		MsgBox('Target installation directory is invalid. ' +
			'Choose a different one.', mbError, MB_OK);
		Exit;
	end;
end;
