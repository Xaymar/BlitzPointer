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
	intptr_t BasePointer, ReturnAddress;

	__asm { //ASM. Do touch if suicidal.
		mov BasePointer, ebp;		// Store current BasePointer
	}

	// Blitz uses X86 Call-Near (E8) instructions to call its own functions.
	// We can simply deduce the Return Address like this because of that.
	ReturnAddress = *reinterpret_cast<intptr_t*>(*reinterpret_cast<intptr_t*>(*reinterpret_cast<intptr_t*>(BasePointer)) - 8);

	return ReturnAddress;
}
#pragma comment(linker, "/EXPORT:BP_GetReturnAddress=_BP_GetReturnAddress@0")

DLL_METHOD intptr_t DLL_CALL BP_GetFunctionPointer()
{
	intptr_t BasePointer, ReturnAddress, FunctionPointer;

	__asm { //ASM. Do touch if suicidal.
		mov BasePointer, ebp;		// Store current BasePointer
	}

	// Blitz uses X86 Call-Near (E8) instructions to call its own functions.
	// We can simply deduce the Return Address like this because of that.
	ReturnAddress = *reinterpret_cast<intptr_t*>(*reinterpret_cast<intptr_t*>(*reinterpret_cast<intptr_t*>(BasePointer)) - 8);
	// And since it's a Call-Near, the call is offset to the return address.
	FunctionPointer = ReturnAddress + *reinterpret_cast<intptr_t*>(ReturnAddress - 4);

	return FunctionPointer;
}
#pragma comment(linker, "/EXPORT:BP_GetFunctionPointer=_BP_GetFunctionPointer@0")

// Didn't work out, overloading a Runtime Function makes it disappear.
/*DLL_METHOD intptr_t DLL_CALL BP_GetLastCalledFunctionPointer( )
{
	// Scan backwards in executable memory for a eax assign.
	return 0;
}
#pragma comment(linker, "/EXPORT:BP_GetLastCalledFunctionPointer=_BP_GetLastCalledFunctionPointer@0")

DLL_METHOD intptr_t DLL_CALL BP_GetNextCalledFunctionPointer()
{
	// Scan forwards in executable memory for a eax assign.
	return 0;
}
#pragma comment(linker, "/EXPORT:BP_GetNextCalledFunctionPointer=_BP_GetNextCalledFunctionPointer@0")*/

DLL_METHOD intptr_t DLL_CALL BP_GetVariablePointer(int32_t pVariable)
{
	intptr_t BasePointer;

	__asm { //ASM. Do touch if suicidal.
		mov BasePointer, ebp;		// Store current BasePointer
	}

	// The Variable pointer that is used is at -9 bytes offset to the return address.
	return *reinterpret_cast<int32_t*>(*reinterpret_cast<intptr_t*>(BasePointer + 4) - 9);
}
#pragma comment(linker, "/EXPORT:BP_GetVariablePointer=_BP_GetVariablePointer@4")

DLL_METHOD intptr_t DLL_CALL BP_GetVariablePointerType( int32_t pVariable ) {
	intptr_t BasePointer;

	__asm { //ASM. Do touch if suicidal.
		mov BasePointer, ebp;		// Store current BasePointer
	}

	// The Variable pointer that is used is at -11 bytes offset to the return address.
	return *reinterpret_cast<int32_t*>(*reinterpret_cast<intptr_t*>(BasePointer + 4) - 11);
}
#pragma comment(linker, "/EXPORT:BP_GetVariablePointerType=_BP_GetVariablePointerType@4")

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