//	BlitzPointer - Adding Pointers to Blitz.
//	Copyright (C) 2015 Xaymar (Michael Fabian Dirks)
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
// New Code by Xaymar<http://xaymar.com>

#pragma once
#include "BlitzPointer.h"

DLL_METHOD intptr_t DLL_CALL BP_GetReturnAddress() {
#pragma comment(linker, "/EXPORT:BP_GetReturnAddress=_BP_GetReturnAddress@0")
	intptr_t BasePointer, ReturnAddress;

	__asm { //ASM. Do touch if suicidal.
		mov BasePointer, ebp;		// Store current BasePointer
	}

	// Blitz uses X86 Call-Near (E8) instructions to call its own functions.
	// We can simply deduce the Return Address like this because of that.
	//-- Parent_EBP = *EBP
	//-- Parent_RP = Parent_EBP + 16
	ReturnAddress = *(intptr_t*)((*(intptr_t*)BasePointer) + 16);

	return ReturnAddress;
}

DLL_METHOD intptr_t DLL_CALL BP_GetFunctionPointer() {
#pragma comment(linker, "/EXPORT:BP_GetFunctionPointer=_BP_GetFunctionPointer@0")
	intptr_t BasePointer, ReturnAddress, FunctionPointer;

	__asm { //ASM. Do touch if suicidal.
		mov BasePointer, ebp;		// Store current BasePointer
	}

	// Blitz uses X86 Call-Near (E8) instructions to call its own functions.
	// We can simply deduce the Return Address like this because of that.
	//-- Parent_EBP = *EBP
	//-- Parent_RP = Parent_EBP + 16
	ReturnAddress = *(intptr_t*)((*(intptr_t*)BasePointer) + 16);

	// And since it's a Call-Near, the call is offset to the return address.
	FunctionPointer = ReturnAddress + *(intptr_t*)(ReturnAddress - 4);

	return FunctionPointer;
}

DLL_METHOD intptr_t DLL_CALL BP_GetVariablePointer(int32_t pVariable) {
#pragma comment(linker, "/EXPORT:BP_GetVariablePointer=_BP_GetVariablePointer@4")
	intptr_t BasePointer;

	__asm { //ASM. Do touch if suicidal.
		mov BasePointer, ebp;		// Store current BasePointer
	}

	// The Variable pointer that is used is at -9 bytes offset to the return address of this function.
	return *(intptr_t*)(*(intptr_t*)(BasePointer + 4) - 9);
}

DLL_METHOD intptr_t DLL_CALL BP_GetVariablePointerType(int32_t pVariable) {
#pragma comment(linker, "/EXPORT:BP_GetVariablePointerType=_BP_GetVariablePointerType@4")
	intptr_t BasePointer;

	__asm { //ASM. Do touch if suicidal.
		mov BasePointer, ebp;		// Store current BasePointer
	}

	// The Variable pointer that is used is at -11 bytes offset to the return address of this function.
	return *(intptr_t*)(*(intptr_t*)(BasePointer + 4) - 11);
}

DLL_METHOD int32_t DLL_CALL BP_CallFunction0(BP_BlitzFunction0_t lpFunctionPointer) {
#pragma comment(linker, "/EXPORT:BP_CallFunction0=_BP_CallFunction0@4")
	return lpFunctionPointer();
}

DLL_METHOD int32_t DLL_CALL BP_CallFunction1(BP_BlitzFunction1_t lpFunctionPointer, int32_t p1) {
#pragma comment(linker, "/EXPORT:BP_CallFunction1=_BP_CallFunction1@8")
	return lpFunctionPointer(p1);
}

DLL_METHOD int32_t DLL_CALL BP_CallFunction2(BP_BlitzFunction2_t lpFunctionPointer, int32_t p1, int32_t p2) {
#pragma comment(linker, "/EXPORT:BP_CallFunction2=_BP_CallFunction2@12")
	return lpFunctionPointer(p1, p2);
}

DLL_METHOD int32_t DLL_CALL BP_CallFunction3(BP_BlitzFunction3_t lpFunctionPointer, int32_t p1, int32_t p2, int32_t p3) {
#pragma comment(linker, "/EXPORT:BP_CallFunction3=_BP_CallFunction3@16")
	return lpFunctionPointer(p1, p2, p3);
}

DLL_METHOD int32_t DLL_CALL BP_CallFunction4(BP_BlitzFunction4_t lpFunctionPointer, int32_t p1, int32_t p2, int32_t p3, int32_t p4) {
#pragma comment(linker, "/EXPORT:BP_CallFunction4=_BP_CallFunction4@20")
	return lpFunctionPointer(p1, p2, p3, p4);
}

DLL_METHOD int32_t DLL_CALL BP_CallFunction5(BP_BlitzFunction5_t lpFunctionPointer, int32_t p1, int32_t p2, int32_t p3, int32_t p4, int32_t p5) {
#pragma comment(linker, "/EXPORT:BP_CallFunction5=_BP_CallFunction5@24")
	return lpFunctionPointer(p1, p2, p3, p4, p5);
}