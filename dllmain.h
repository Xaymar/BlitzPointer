//	BlitzPointer - Adding Pointers to Blitz.
//	Copyright (C) 2015 Project Kube (Michael Fabian Dirks)
//
//	This program is free software: you can redistribute it and/or modify
//	it under the terms of the GNU Lesser General Public License as
//	published by the Free Software Foundation, either version 3 of the 
//	License, or (at your option) any later version.
//
//	This program is distributed in the hope that it will be useful,
//	but WITHOUT ANY WARRANTY; without even the implied warranty of
//	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//	GNU General Public License for more details.
//
//	You should have received a copy of the GNU Lesser General Public License
//	along with this program.  If not, see <http://www.gnu.org/licenses/>.

#pragma once

// Memory Management
#include <memory>

// Platform specific: Windows
#include <windows.h>

// Macros
#ifndef IMPORT
#define DLL_METHOD extern "C" //__declspec(dllexport)
#else
#define DLL_METHOD extern "c" __declspec(dllimport)
#endif
#define DLL_CALL __stdcall