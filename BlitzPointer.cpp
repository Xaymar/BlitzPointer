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

#include "BlitzPointer.h"

DLL_EXPORT intptr_t BlitzPointer_GetReturnAddress() {
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
#pragma comment(linker, "/EXPORT:BlitzPointer_GetReturnAddress=_BlitzPointer_GetReturnAddress@0")

DLL_EXPORT intptr_t BlitzPointer_GetFunctionPointer()
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
#pragma comment(linker, "/EXPORT:BlitzPointer_GetFunctionPointer=_BlitzPointer_GetFunctionPointer@0")
