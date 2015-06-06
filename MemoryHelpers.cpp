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

#include "dllmain.h"

DLL_EXPORT uint32_t PeekMemory(uint32_t* address, uint32_t length, intptr_t bank) {
	uint32_t bankAddress, bankSize;
	bankAddress = *(uint32_t*)(bank + 4);
	bankSize = *(uint32_t*)(bank + 8);

	// Limit reading to bank size.
	length = (length > bankSize ? bankSize : length);

	for (uint32_t offset = 0; offset < length; offset++) {
		*(int32_t*)(bankAddress + offset) = *(address + offset);
	}

	return length;
}
#pragma comment(linker, "/EXPORT:PeekMemory=_PeekMemory@12")

DLL_EXPORT uint32_t PokeMemory(uint32_t address, uint32_t length, intptr_t bank) {
	uint32_t bankAddress, bankSize;
	bankAddress = *(uint32_t*)(bank + 4);
	bankSize = *(uint32_t*)(bank + 8);

	// Limit reading to bank size.
	length = (length > bankSize ? bankSize : length);

	for (uint32_t offset = 0; offset < length; offset++) {
		*(int32_t*)(address + offset) = *(int32_t*)(bankAddress + offset);
	}

	return length;
}
#pragma comment(linker, "/EXPORT:PokeMemory=_PokeMemory@12")

DLL_EXPORT int8_t PeekMemoryByte(uint32_t* address) {
	return *(int8_t*)address;
}
#pragma comment(linker, "/EXPORT:PeekMemoryByte=_PeekMemoryByte@4")

DLL_EXPORT void PokeMemoryByte(uint32_t* address, int8_t value) {
	*(int8_t*)address = value;
}
#pragma comment(linker, "/EXPORT:PokeMemoryByte=_PokeMemoryByte@8")

DLL_EXPORT int16_t PeekMemoryShort(uint32_t* address) {
	return *(int16_t*)address;
}
#pragma comment(linker, "/EXPORT:PeekMemoryShort=_PeekMemoryShort@4")

DLL_EXPORT void PokeMemoryShort(uint32_t* address, int16_t value) {
	*(int16_t*)address = value;
}
#pragma comment(linker, "/EXPORT:PokeMemoryShort=_PokeMemoryShort@8")

DLL_EXPORT int32_t PeekMemoryInt(uint32_t* address) {
	return *(int32_t*)address;
}
#pragma comment(linker, "/EXPORT:PeekMemoryInt=_PeekMemoryInt@4")

DLL_EXPORT void PokeMemoryInt(uint32_t* address, int32_t value) {
	*(int32_t*)address = value;
}
#pragma comment(linker, "/EXPORT:PokeMemoryInt=_PokeMemoryInt@8")

DLL_EXPORT float_t PeekMemoryFloat(uint32_t* address) {
	return *(float_t*)address;
}
#pragma comment(linker, "/EXPORT:PeekMemoryFloat=_PeekMemoryFloat@4")

DLL_EXPORT void PokeMemoryFloat(uint32_t* address, float_t value) {
	*(float_t*)address = value;
}
#pragma comment(linker, "/EXPORT:PokeMemoryFloat=_PokeMemoryFloat@8")

