// installer.cpp : Defines the entry point for the application.
//

#include "stdafx.h"
#include "installer.h"

#include "fs.h"

 void debug_main();

 extern std::string g_data ;

extern "C" {
	// module exports file: $(ProjectDir)\exports.def
	int32_t __stdcall TestFunc(char* p)
	{
		// Init g_data
		debug_main();

		char buf[256];
		sprintf_s(buf, "0x%p\n", p);
		// MessageBoxA(0, buf, 0, 0);

		if (!p )
			return g_data.length() + 1;

		strcpy(p, g_data.c_str());
		// debug_main();
		return g_data.length() + 1;
	}

	//
	// Resolve the game's installation path
	// Returns an empty string on failure
	//
	const char* __stdcall LMI_GamePath(void)
	{
		static char game_path[1024] = "";
		GetGameDirectory(game_path, ARRAYSIZE(game_path));
		return game_path;
	}

	//
	// Set the target installation directory & ensure that the install path is valid
	//
	bool __stdcall LMI_SetInstallPath(const char* path)
	{
		const std::string binaryPath = FS::JoinPath(path, "BlackOps.exe\\");
		MessageBoxA(0, binaryPath.c_str(), 0, 0);
		return FS::FileExists(binaryPath.c_str());
	}
}