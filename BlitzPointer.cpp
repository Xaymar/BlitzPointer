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

// Idea take from Code by Noodoby<http://www.blitzforum.de/forum/viewtopic.php?t=31651>
// New Code by Xaymar<http://project-kube.de>

#pragma once
#include "BlitzPointer.h"

DLL_METHOD intptr_t DLL_CALL BP_GetReturnAddress() {
	intptr_t StackPointer, ReturnAddress;

	__asm { //ASM. Do touch if suicidal.
		mov StackPointer, esp;		// Store current Stack Pointer
		mov esp, ebp;				// On X86, EBP[0] is our own function and EBP[1] is the return address.
		add esp, 4;					// Which means that we can just take it from there into our own variable.
		pop ReturnAddress;			// Just like this.
		mov esp, [StackPointer];		// And then reset the Stack Pointer.
	}

	return ReturnAddress;
}
#pragma comment(linker, "/EXPORT:BP_GetReturnAddress=_BP_GetReturnAddress@0")

DLL_METHOD intptr_t DLL_CALL BP_GetFunctionPointer()
{
	intptr_t StackPointer, ReturnAddress;

	__asm { //ASM. Do touch if suicidal.
		mov StackPointer, esp;		// Store current Stack Pointer
		mov esp, ebp;				// On X86, EBP[0] is our own function and EBP[1] is the return address.
		add esp, 4;					// Which means that we can just take it from there into our own variable.
		pop ReturnAddress;			// Just like this.
		mov esp, [StackPointer];	// And then reset the Stack Pointer.
	}

	// Let's look backwards in memory for the function signature (0x53 0x56 0x57 0x55 0x89 0xE5) for at most one megabyte.
	uint8_t* startPtr = (uint8_t*)ReturnAddress;
	uint8_t* endPtr = (uint8_t*)(ReturnAddress - 1048576);
	for (uint8_t* curPtr = startPtr; curPtr != endPtr; curPtr--) {
		if (*(curPtr) == 0x53)												// push ebx
			if (*(curPtr + 1) == 0x56)										// push esi
				if (*(curPtr + 2) == 0x57)									// push edi
					if (*(curPtr + 3) == 0x55)								// push ebp
						if (*(curPtr + 4) == 0x89 && *(curPtr + 5) == 0xE5)	// mov ebp,esp
							return (intptr_t)curPtr;
	}

	return 0;
}
#pragma comment(linker, "/EXPORT:BP_GetFunctionPointer=_BP_GetFunctionPointer@0")

DLL_METHOD intptr_t DLL_CALL BP_GetVariablePointer(int32_t pVariable)
{
	intptr_t StackPointer, ReturnAddress;

	__asm { //ASM. Do touch if suicidal.
		mov StackPointer, esp;		// Store current Stack Pointer
		mov esp, ebp;				// On X86, EBP[0] is our own function and EBP[1] is the return address.
		add esp, 4;					// Which means that we can just take it from there into our own variable.
		pop ReturnAddress;			// Just like this.
		mov esp, [StackPointer];	// And then reset the Stack Pointer.
	}
	// The Variable pointer that is used is at -9 bytes offset to the return address.
	return *reinterpret_cast<int32_t*>(ReturnAddress - 9);
}
#pragma comment(linker, "/EXPORT:BP_GetVariablePointer=_BP_GetVariablePointer@0")

DLL_METHOD int32_t DLL_CALL BP_CallFunction0(BP_BlitzFunction0_t lpFunctionPointer) {
	return lpFunctionPointer();
}
#pragma comment(linker, "/EXPORT:BP_CallFunction0=_BP_CallFunction0@4")

DLL_METHOD int32_t DLL_CALL BP_CallFunction1(BP_BlitzFunction1_t lpFunctionPointer, int32_t p1) {
	return lpFunctionPointer(p1);
}
#pragma comment(linker, "/EXPORT:BP_CallFunction1=_BP_CallFunction1@8")

DLL_METHOD int32_t DLL_CALL BP_CallFunction2(BP_BlitzFunction2_t lpFunctionPointer, int32_t p1, int32_t p2) {
	return lpFunctionPointer(p1, p2);
}
#pragma comment(linker, "/EXPORT:BP_CallFunction2=_BP_CallFunction2@12")

DLL_METHOD int32_t DLL_CALL BP_CallFunction3(BP_BlitzFunction3_t lpFunctionPointer, int32_t p1, int32_t p2, int32_t p3) {
	return lpFunctionPointer(p1, p2, p3);
}
#pragma comment(linker, "/EXPORT:BP_CallFunction3=_BP_CallFunction3@16")

DLL_METHOD int32_t DLL_CALL BP_CallFunction4(BP_BlitzFunction4_t lpFunctionPointer, int32_t p1, int32_t p2, int32_t p3, int32_t p4) {
	return lpFunctionPointer(p1, p2, p3, p4);
}
#pragma comment(linker, "/EXPORT:BP_CallFunction4=_BP_CallFunction4@20")

DLL_METHOD int32_t DLL_CALL BP_CallFunction5(BP_BlitzFunction5_t lpFunctionPointer, int32_t p1, int32_t p2, int32_t p3, int32_t p4, int32_t p5) {
	return lpFunctionPointer(p1, p2, p3, p4, p5);
}
#pragma comment(linker, "/EXPORT:BP_CallFunction5=_BP_CallFunction5@24")