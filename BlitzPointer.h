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
#include "dllmain.h"
#include <string>

// Types of Blitz Functions.
typedef int32_t(__stdcall *BP_BlitzFunction0_t)();
typedef int32_t(__stdcall *BP_BlitzFunction1_t)(int32_t);
typedef int32_t(__stdcall *BP_BlitzFunction2_t)(int32_t, int32_t);
typedef int32_t(__stdcall *BP_BlitzFunction3_t)(int32_t, int32_t, int32_t);
typedef int32_t(__stdcall *BP_BlitzFunction4_t)(int32_t, int32_t, int32_t, int32_t);
typedef int32_t(__stdcall *BP_BlitzFunction5_t)(int32_t, int32_t, int32_t, int32_t, int32_t);

// Basic Functionality (Pointer retrieval)
DLL_METHOD intptr_t DLL_CALL BP_GetReturnAddress();
DLL_METHOD intptr_t DLL_CALL BP_GetFunctionPointer();
DLL_METHOD intptr_t DLL_CALL BP_GetVariablePointer();

// Native Blitz Function Calls
DLL_METHOD int32_t DLL_CALL BP_CallFunction0(BP_BlitzFunction0_t lpFunctionPointer);
DLL_METHOD int32_t DLL_CALL BP_CallFunction1(BP_BlitzFunction1_t lpFunctionPointer, int32_t p1);
DLL_METHOD int32_t DLL_CALL BP_CallFunction2(BP_BlitzFunction2_t lpFunctionPointer, int32_t p1, int32_t p2);
DLL_METHOD int32_t DLL_CALL BP_CallFunction3(BP_BlitzFunction3_t lpFunctionPointer, int32_t p1, int32_t p2, int32_t p3);
DLL_METHOD int32_t DLL_CALL BP_CallFunction4(BP_BlitzFunction4_t lpFunctionPointer, int32_t p1, int32_t p2, int32_t p3, int32_t p4);
DLL_METHOD int32_t DLL_CALL BP_CallFunction5(BP_BlitzFunction5_t lpFunctionPointer, int32_t p1, int32_t p2, int32_t p3, int32_t p4, int32_t p5);
