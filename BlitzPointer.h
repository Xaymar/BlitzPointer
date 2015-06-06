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

DLL_EXPORT intptr_t BlitzPointer_GetReturnAddress();
DLL_EXPORT intptr_t BlitzPointer_GetFunctionPointer();

// Defines for easier function generation.
#define CALLFUNCTION_DECL_BEGIN(NAME)					DLL_EXPORT int32_t BlitzPointer_CallFunction##NAME(intptr_t lpFunctionPointer
#define CALLFUNCTION_DECL_PARAMETER(TYPE, NAME)			, TYPE NAME
#define CALLFUNCTION_DECL_END()							)
#define CALLFUNCTION_IMPL_BEGIN()						{ 
#define CALLFUNCTION_IMPL_SAFEGUARD()					if (!lpFunctionPointer) return NULL;
#define CALLFUNCTION_IMPL_PREPARE(COUNT)				__asm SUB ESP, COUNT * 4
#define CALLFUNCTION_IMPL_PARAMETER(INDEX, NAME)		__asm MOV EAX, [NAME] __asm MOV [ESP + INDEX * 4], EAX
#define CALLFUNCTION_IMPL_CALL()						__asm CALL DWORD ptr[lpFunctionPointer]
#define CALLFUNCTION_IMPL_RESULT()						int32_t result; __asm MOV [result], EAX
#define CALLFUNCTION_IMPL_RETURN()						return result; 
#define CALLFUNCTION_IMPL_END()							}
