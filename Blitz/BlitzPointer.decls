;	BlitzPointer - Adding Pointers to Blitz.
;	Copyright (C) 2015 Project Kube (Michael Fabian Dirks)
;
;	This program is free software: you can redistribute it and/or modify
;	it under the terms of the GNU Lesser General Public License as
;	published by the Free Software Foundation, either version 3 of the 
;	License, or (at your option) any later version.
;
;	This program is distributed in the hope that it will be useful,
;	but WITHOUT ANY WARRANTY; without even the implied warranty of
;	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;	GNU General Public License for more details.
;
;	You should have received a copy of the GNU Lesser General Public License
;	along with this program.  If not, see <http:;www.gnu.org/licenses/>.

.lib "BlitzPointer.dll"

; BlitzPointer
BP_GetReturnAddress%()
BP_GetFunctionPointer%()
BP_GetVariablePointer%()

; Memory Modification
PeekMemoryByte%(lpMemoryPointer%)
PeekMemoryShort%(lpMemoryPointer%)
PeekMemoryInt%(lpMemoryPointer%)
PeekMemoryFloat#(lpMemoryPointer%)
PeekMemory(lpMemoryPointer%, iLength%, lpBank*)
PokeMemoryByte(lpMemoryPointer%, value%)
PokeMemoryShort(lpMemoryPointer%, value%)
PokeMemoryInt(lpMemoryPointer%, value%)
PokeMemoryFloat(lpMemoryPointer%, value#)
PokeMemory(lpMemoryPointer%, iLength%, lpBank*)

; Function Calling
BP_CallFunctionV(lpFunctionPointer%) : "BP_CallFunction0"
BP_CallFunctionVI(lpFunctionPointer%, P1%) : "BP_CallFunction1"
BP_CallFunctionVII(lpFunctionPointer%, p1%, p2%) : "BP_CallFunction2"
BP_CallFunctionVIII(lpFunctionPointer%, p1%, p2%, p3%) : "BP_CallFunction3"
BP_CallFunctionVIIII(lpFunctionPointer%, p1%, p2%, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionVIIIF(lpFunctionPointer%, p1%, p2%, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionVIIIP(lpFunctionPointer%, p1%, p2%, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionVIIF(lpFunctionPointer%, p1%, p2%, p3#) : "BP_CallFunction3"
BP_CallFunctionVIIFI(lpFunctionPointer%, p1%, p2%, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionVIIFF(lpFunctionPointer%, p1%, p2%, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionVIIFP(lpFunctionPointer%, p1%, p2%, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionVIIP(lpFunctionPointer%, p1%, p2%, p3*) : "BP_CallFunction3"
BP_CallFunctionVIIPI(lpFunctionPointer%, p1%, p2%, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionVIIPF(lpFunctionPointer%, p1%, p2%, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionVIIPP(lpFunctionPointer%, p1%, p2%, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionVIF(lpFunctionPointer%, p1%, p2#) : "BP_CallFunction2"
BP_CallFunctionVIFI(lpFunctionPointer%, p1%, p2#, p3%) : "BP_CallFunction3"
BP_CallFunctionVIFII(lpFunctionPointer%, p1%, p2#, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionVIFIF(lpFunctionPointer%, p1%, p2#, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionVIFIP(lpFunctionPointer%, p1%, p2#, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionVIFF(lpFunctionPointer%, p1%, p2#, p3#) : "BP_CallFunction3"
BP_CallFunctionVIFFI(lpFunctionPointer%, p1%, p2#, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionVIFFF(lpFunctionPointer%, p1%, p2#, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionVIFFP(lpFunctionPointer%, p1%, p2#, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionVIFP(lpFunctionPointer%, p1%, p2#, p3*) : "BP_CallFunction3"
BP_CallFunctionVIFPI(lpFunctionPointer%, p1%, p2#, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionVIFPF(lpFunctionPointer%, p1%, p2#, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionVIFPP(lpFunctionPointer%, p1%, p2#, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionVIP(lpFunctionPointer%, p1%, p2*) : "BP_CallFunction2"
BP_CallFunctionVIPI(lpFunctionPointer%, p1%, p2*, p3%) : "BP_CallFunction3"
BP_CallFunctionVIPII(lpFunctionPointer%, p1%, p2*, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionVIPIF(lpFunctionPointer%, p1%, p2*, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionVIPIP(lpFunctionPointer%, p1%, p2*, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionVIPF(lpFunctionPointer%, p1%, p2*, p3#) : "BP_CallFunction3"
BP_CallFunctionVIPFI(lpFunctionPointer%, p1%, p2*, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionVIPFF(lpFunctionPointer%, p1%, p2*, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionVIPFP(lpFunctionPointer%, p1%, p2*, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionVIPP(lpFunctionPointer%, p1%, p2*, p3*) : "BP_CallFunction3"
BP_CallFunctionVIPPI(lpFunctionPointer%, p1%, p2*, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionVIPPF(lpFunctionPointer%, p1%, p2*, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionVIPPP(lpFunctionPointer%, p1%, p2*, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionVF(lpFunctionPointer%, P1#) : "BP_CallFunction1"
BP_CallFunctionVFI(lpFunctionPointer%, p1#, p2%) : "BP_CallFunction2"
BP_CallFunctionVFII(lpFunctionPointer%, p1#, p2%, p3%) : "BP_CallFunction3"
BP_CallFunctionVFIII(lpFunctionPointer%, p1#, p2%, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionVFIIF(lpFunctionPointer%, p1#, p2%, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionVFIIP(lpFunctionPointer%, p1#, p2%, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionVFIF(lpFunctionPointer%, p1#, p2%, p3#) : "BP_CallFunction3"
BP_CallFunctionVFIFI(lpFunctionPointer%, p1#, p2%, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionVFIFF(lpFunctionPointer%, p1#, p2%, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionVFIFP(lpFunctionPointer%, p1#, p2%, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionVFIP(lpFunctionPointer%, p1#, p2%, p3*) : "BP_CallFunction3"
BP_CallFunctionVFIPI(lpFunctionPointer%, p1#, p2%, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionVFIPF(lpFunctionPointer%, p1#, p2%, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionVFIPP(lpFunctionPointer%, p1#, p2%, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionVFF(lpFunctionPointer%, p1#, p2#) : "BP_CallFunction2"
BP_CallFunctionVFFI(lpFunctionPointer%, p1#, p2#, p3%) : "BP_CallFunction3"
BP_CallFunctionVFFII(lpFunctionPointer%, p1#, p2#, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionVFFIF(lpFunctionPointer%, p1#, p2#, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionVFFIP(lpFunctionPointer%, p1#, p2#, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionVFFF(lpFunctionPointer%, p1#, p2#, p3#) : "BP_CallFunction3"
BP_CallFunctionVFFFI(lpFunctionPointer%, p1#, p2#, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionVFFFF(lpFunctionPointer%, p1#, p2#, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionVFFFP(lpFunctionPointer%, p1#, p2#, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionVFFP(lpFunctionPointer%, p1#, p2#, p3*) : "BP_CallFunction3"
BP_CallFunctionVFFPI(lpFunctionPointer%, p1#, p2#, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionVFFPF(lpFunctionPointer%, p1#, p2#, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionVFFPP(lpFunctionPointer%, p1#, p2#, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionVFP(lpFunctionPointer%, p1#, p2*) : "BP_CallFunction2"
BP_CallFunctionVFPI(lpFunctionPointer%, p1#, p2*, p3%) : "BP_CallFunction3"
BP_CallFunctionVFPII(lpFunctionPointer%, p1#, p2*, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionVFPIF(lpFunctionPointer%, p1#, p2*, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionVFPIP(lpFunctionPointer%, p1#, p2*, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionVFPF(lpFunctionPointer%, p1#, p2*, p3#) : "BP_CallFunction3"
BP_CallFunctionVFPFI(lpFunctionPointer%, p1#, p2*, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionVFPFF(lpFunctionPointer%, p1#, p2*, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionVFPFP(lpFunctionPointer%, p1#, p2*, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionVFPP(lpFunctionPointer%, p1#, p2*, p3*) : "BP_CallFunction3"
BP_CallFunctionVFPPI(lpFunctionPointer%, p1#, p2*, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionVFPPF(lpFunctionPointer%, p1#, p2*, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionVFPPP(lpFunctionPointer%, p1#, p2*, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionVP(lpFunctionPointer%, P1*) : "BP_CallFunction1"
BP_CallFunctionVPI(lpFunctionPointer%, p1*, p2%) : "BP_CallFunction2"
BP_CallFunctionVPII(lpFunctionPointer%, p1*, p2%, p3%) : "BP_CallFunction3"
BP_CallFunctionVPIII(lpFunctionPointer%, p1*, p2%, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionVPIIF(lpFunctionPointer%, p1*, p2%, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionVPIIP(lpFunctionPointer%, p1*, p2%, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionVPIF(lpFunctionPointer%, p1*, p2%, p3#) : "BP_CallFunction3"
BP_CallFunctionVPIFI(lpFunctionPointer%, p1*, p2%, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionVPIFF(lpFunctionPointer%, p1*, p2%, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionVPIFP(lpFunctionPointer%, p1*, p2%, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionVPIP(lpFunctionPointer%, p1*, p2%, p3*) : "BP_CallFunction3"
BP_CallFunctionVPIPI(lpFunctionPointer%, p1*, p2%, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionVPIPF(lpFunctionPointer%, p1*, p2%, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionVPIPP(lpFunctionPointer%, p1*, p2%, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionVPF(lpFunctionPointer%, p1*, p2#) : "BP_CallFunction2"
BP_CallFunctionVPFI(lpFunctionPointer%, p1*, p2#, p3%) : "BP_CallFunction3"
BP_CallFunctionVPFII(lpFunctionPointer%, p1*, p2#, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionVPFIF(lpFunctionPointer%, p1*, p2#, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionVPFIP(lpFunctionPointer%, p1*, p2#, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionVPFF(lpFunctionPointer%, p1*, p2#, p3#) : "BP_CallFunction3"
BP_CallFunctionVPFFI(lpFunctionPointer%, p1*, p2#, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionVPFFF(lpFunctionPointer%, p1*, p2#, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionVPFFP(lpFunctionPointer%, p1*, p2#, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionVPFP(lpFunctionPointer%, p1*, p2#, p3*) : "BP_CallFunction3"
BP_CallFunctionVPFPI(lpFunctionPointer%, p1*, p2#, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionVPFPF(lpFunctionPointer%, p1*, p2#, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionVPFPP(lpFunctionPointer%, p1*, p2#, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionVPP(lpFunctionPointer%, p1*, p2*) : "BP_CallFunction2"
BP_CallFunctionVPPI(lpFunctionPointer%, p1*, p2*, p3%) : "BP_CallFunction3"
BP_CallFunctionVPPII(lpFunctionPointer%, p1*, p2*, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionVPPIF(lpFunctionPointer%, p1*, p2*, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionVPPIP(lpFunctionPointer%, p1*, p2*, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionVPPF(lpFunctionPointer%, p1*, p2*, p3#) : "BP_CallFunction3"
BP_CallFunctionVPPFI(lpFunctionPointer%, p1*, p2*, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionVPPFF(lpFunctionPointer%, p1*, p2*, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionVPPFP(lpFunctionPointer%, p1*, p2*, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionVPPP(lpFunctionPointer%, p1*, p2*, p3*) : "BP_CallFunction3"
BP_CallFunctionVPPPI(lpFunctionPointer%, p1*, p2*, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionVPPPF(lpFunctionPointer%, p1*, p2*, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionVPPPP(lpFunctionPointer%, p1*, p2*, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionI%(lpFunctionPointer%) : "BP_CallFunction0"
BP_CallFunctionII%(lpFunctionPointer%, P1%) : "BP_CallFunction1"
BP_CallFunctionIII%(lpFunctionPointer%, p1%, p2%) : "BP_CallFunction2"
BP_CallFunctionIIII%(lpFunctionPointer%, p1%, p2%, p3%) : "BP_CallFunction3"
BP_CallFunctionIIIII%(lpFunctionPointer%, p1%, p2%, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionIIIIF%(lpFunctionPointer%, p1%, p2%, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionIIIIP%(lpFunctionPointer%, p1%, p2%, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionIIIF%(lpFunctionPointer%, p1%, p2%, p3#) : "BP_CallFunction3"
BP_CallFunctionIIIFI%(lpFunctionPointer%, p1%, p2%, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionIIIFF%(lpFunctionPointer%, p1%, p2%, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionIIIFP%(lpFunctionPointer%, p1%, p2%, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionIIIP%(lpFunctionPointer%, p1%, p2%, p3*) : "BP_CallFunction3"
BP_CallFunctionIIIPI%(lpFunctionPointer%, p1%, p2%, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionIIIPF%(lpFunctionPointer%, p1%, p2%, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionIIIPP%(lpFunctionPointer%, p1%, p2%, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionIIF%(lpFunctionPointer%, p1%, p2#) : "BP_CallFunction2"
BP_CallFunctionIIFI%(lpFunctionPointer%, p1%, p2#, p3%) : "BP_CallFunction3"
BP_CallFunctionIIFII%(lpFunctionPointer%, p1%, p2#, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionIIFIF%(lpFunctionPointer%, p1%, p2#, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionIIFIP%(lpFunctionPointer%, p1%, p2#, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionIIFF%(lpFunctionPointer%, p1%, p2#, p3#) : "BP_CallFunction3"
BP_CallFunctionIIFFI%(lpFunctionPointer%, p1%, p2#, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionIIFFF%(lpFunctionPointer%, p1%, p2#, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionIIFFP%(lpFunctionPointer%, p1%, p2#, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionIIFP%(lpFunctionPointer%, p1%, p2#, p3*) : "BP_CallFunction3"
BP_CallFunctionIIFPI%(lpFunctionPointer%, p1%, p2#, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionIIFPF%(lpFunctionPointer%, p1%, p2#, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionIIFPP%(lpFunctionPointer%, p1%, p2#, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionIIP%(lpFunctionPointer%, p1%, p2*) : "BP_CallFunction2"
BP_CallFunctionIIPI%(lpFunctionPointer%, p1%, p2*, p3%) : "BP_CallFunction3"
BP_CallFunctionIIPII%(lpFunctionPointer%, p1%, p2*, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionIIPIF%(lpFunctionPointer%, p1%, p2*, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionIIPIP%(lpFunctionPointer%, p1%, p2*, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionIIPF%(lpFunctionPointer%, p1%, p2*, p3#) : "BP_CallFunction3"
BP_CallFunctionIIPFI%(lpFunctionPointer%, p1%, p2*, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionIIPFF%(lpFunctionPointer%, p1%, p2*, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionIIPFP%(lpFunctionPointer%, p1%, p2*, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionIIPP%(lpFunctionPointer%, p1%, p2*, p3*) : "BP_CallFunction3"
BP_CallFunctionIIPPI%(lpFunctionPointer%, p1%, p2*, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionIIPPF%(lpFunctionPointer%, p1%, p2*, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionIIPPP%(lpFunctionPointer%, p1%, p2*, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionIF%(lpFunctionPointer%, P1#) : "BP_CallFunction1"
BP_CallFunctionIFI%(lpFunctionPointer%, p1#, p2%) : "BP_CallFunction2"
BP_CallFunctionIFII%(lpFunctionPointer%, p1#, p2%, p3%) : "BP_CallFunction3"
BP_CallFunctionIFIII%(lpFunctionPointer%, p1#, p2%, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionIFIIF%(lpFunctionPointer%, p1#, p2%, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionIFIIP%(lpFunctionPointer%, p1#, p2%, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionIFIF%(lpFunctionPointer%, p1#, p2%, p3#) : "BP_CallFunction3"
BP_CallFunctionIFIFI%(lpFunctionPointer%, p1#, p2%, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionIFIFF%(lpFunctionPointer%, p1#, p2%, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionIFIFP%(lpFunctionPointer%, p1#, p2%, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionIFIP%(lpFunctionPointer%, p1#, p2%, p3*) : "BP_CallFunction3"
BP_CallFunctionIFIPI%(lpFunctionPointer%, p1#, p2%, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionIFIPF%(lpFunctionPointer%, p1#, p2%, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionIFIPP%(lpFunctionPointer%, p1#, p2%, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionIFF%(lpFunctionPointer%, p1#, p2#) : "BP_CallFunction2"
BP_CallFunctionIFFI%(lpFunctionPointer%, p1#, p2#, p3%) : "BP_CallFunction3"
BP_CallFunctionIFFII%(lpFunctionPointer%, p1#, p2#, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionIFFIF%(lpFunctionPointer%, p1#, p2#, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionIFFIP%(lpFunctionPointer%, p1#, p2#, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionIFFF%(lpFunctionPointer%, p1#, p2#, p3#) : "BP_CallFunction3"
BP_CallFunctionIFFFI%(lpFunctionPointer%, p1#, p2#, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionIFFFF%(lpFunctionPointer%, p1#, p2#, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionIFFFP%(lpFunctionPointer%, p1#, p2#, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionIFFP%(lpFunctionPointer%, p1#, p2#, p3*) : "BP_CallFunction3"
BP_CallFunctionIFFPI%(lpFunctionPointer%, p1#, p2#, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionIFFPF%(lpFunctionPointer%, p1#, p2#, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionIFFPP%(lpFunctionPointer%, p1#, p2#, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionIFP%(lpFunctionPointer%, p1#, p2*) : "BP_CallFunction2"
BP_CallFunctionIFPI%(lpFunctionPointer%, p1#, p2*, p3%) : "BP_CallFunction3"
BP_CallFunctionIFPII%(lpFunctionPointer%, p1#, p2*, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionIFPIF%(lpFunctionPointer%, p1#, p2*, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionIFPIP%(lpFunctionPointer%, p1#, p2*, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionIFPF%(lpFunctionPointer%, p1#, p2*, p3#) : "BP_CallFunction3"
BP_CallFunctionIFPFI%(lpFunctionPointer%, p1#, p2*, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionIFPFF%(lpFunctionPointer%, p1#, p2*, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionIFPFP%(lpFunctionPointer%, p1#, p2*, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionIFPP%(lpFunctionPointer%, p1#, p2*, p3*) : "BP_CallFunction3"
BP_CallFunctionIFPPI%(lpFunctionPointer%, p1#, p2*, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionIFPPF%(lpFunctionPointer%, p1#, p2*, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionIFPPP%(lpFunctionPointer%, p1#, p2*, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionIP%(lpFunctionPointer%, P1*) : "BP_CallFunction1"
BP_CallFunctionIPI%(lpFunctionPointer%, p1*, p2%) : "BP_CallFunction2"
BP_CallFunctionIPII%(lpFunctionPointer%, p1*, p2%, p3%) : "BP_CallFunction3"
BP_CallFunctionIPIII%(lpFunctionPointer%, p1*, p2%, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionIPIIF%(lpFunctionPointer%, p1*, p2%, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionIPIIP%(lpFunctionPointer%, p1*, p2%, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionIPIF%(lpFunctionPointer%, p1*, p2%, p3#) : "BP_CallFunction3"
BP_CallFunctionIPIFI%(lpFunctionPointer%, p1*, p2%, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionIPIFF%(lpFunctionPointer%, p1*, p2%, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionIPIFP%(lpFunctionPointer%, p1*, p2%, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionIPIP%(lpFunctionPointer%, p1*, p2%, p3*) : "BP_CallFunction3"
BP_CallFunctionIPIPI%(lpFunctionPointer%, p1*, p2%, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionIPIPF%(lpFunctionPointer%, p1*, p2%, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionIPIPP%(lpFunctionPointer%, p1*, p2%, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionIPF%(lpFunctionPointer%, p1*, p2#) : "BP_CallFunction2"
BP_CallFunctionIPFI%(lpFunctionPointer%, p1*, p2#, p3%) : "BP_CallFunction3"
BP_CallFunctionIPFII%(lpFunctionPointer%, p1*, p2#, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionIPFIF%(lpFunctionPointer%, p1*, p2#, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionIPFIP%(lpFunctionPointer%, p1*, p2#, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionIPFF%(lpFunctionPointer%, p1*, p2#, p3#) : "BP_CallFunction3"
BP_CallFunctionIPFFI%(lpFunctionPointer%, p1*, p2#, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionIPFFF%(lpFunctionPointer%, p1*, p2#, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionIPFFP%(lpFunctionPointer%, p1*, p2#, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionIPFP%(lpFunctionPointer%, p1*, p2#, p3*) : "BP_CallFunction3"
BP_CallFunctionIPFPI%(lpFunctionPointer%, p1*, p2#, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionIPFPF%(lpFunctionPointer%, p1*, p2#, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionIPFPP%(lpFunctionPointer%, p1*, p2#, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionIPP%(lpFunctionPointer%, p1*, p2*) : "BP_CallFunction2"
BP_CallFunctionIPPI%(lpFunctionPointer%, p1*, p2*, p3%) : "BP_CallFunction3"
BP_CallFunctionIPPII%(lpFunctionPointer%, p1*, p2*, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionIPPIF%(lpFunctionPointer%, p1*, p2*, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionIPPIP%(lpFunctionPointer%, p1*, p2*, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionIPPF%(lpFunctionPointer%, p1*, p2*, p3#) : "BP_CallFunction3"
BP_CallFunctionIPPFI%(lpFunctionPointer%, p1*, p2*, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionIPPFF%(lpFunctionPointer%, p1*, p2*, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionIPPFP%(lpFunctionPointer%, p1*, p2*, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionIPPP%(lpFunctionPointer%, p1*, p2*, p3*) : "BP_CallFunction3"
BP_CallFunctionIPPPI%(lpFunctionPointer%, p1*, p2*, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionIPPPF%(lpFunctionPointer%, p1*, p2*, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionIPPPP%(lpFunctionPointer%, p1*, p2*, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionF#(lpFunctionPointer%) : "BP_CallFunction0"
BP_CallFunctionFI#(lpFunctionPointer%, P1%) : "BP_CallFunction1"
BP_CallFunctionFII#(lpFunctionPointer%, p1%, p2%) : "BP_CallFunction2"
BP_CallFunctionFIII#(lpFunctionPointer%, p1%, p2%, p3%) : "BP_CallFunction3"
BP_CallFunctionFIIII#(lpFunctionPointer%, p1%, p2%, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionFIIIF#(lpFunctionPointer%, p1%, p2%, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionFIIIP#(lpFunctionPointer%, p1%, p2%, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionFIIF#(lpFunctionPointer%, p1%, p2%, p3#) : "BP_CallFunction3"
BP_CallFunctionFIIFI#(lpFunctionPointer%, p1%, p2%, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionFIIFF#(lpFunctionPointer%, p1%, p2%, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionFIIFP#(lpFunctionPointer%, p1%, p2%, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionFIIP#(lpFunctionPointer%, p1%, p2%, p3*) : "BP_CallFunction3"
BP_CallFunctionFIIPI#(lpFunctionPointer%, p1%, p2%, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionFIIPF#(lpFunctionPointer%, p1%, p2%, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionFIIPP#(lpFunctionPointer%, p1%, p2%, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionFIF#(lpFunctionPointer%, p1%, p2#) : "BP_CallFunction2"
BP_CallFunctionFIFI#(lpFunctionPointer%, p1%, p2#, p3%) : "BP_CallFunction3"
BP_CallFunctionFIFII#(lpFunctionPointer%, p1%, p2#, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionFIFIF#(lpFunctionPointer%, p1%, p2#, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionFIFIP#(lpFunctionPointer%, p1%, p2#, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionFIFF#(lpFunctionPointer%, p1%, p2#, p3#) : "BP_CallFunction3"
BP_CallFunctionFIFFI#(lpFunctionPointer%, p1%, p2#, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionFIFFF#(lpFunctionPointer%, p1%, p2#, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionFIFFP#(lpFunctionPointer%, p1%, p2#, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionFIFP#(lpFunctionPointer%, p1%, p2#, p3*) : "BP_CallFunction3"
BP_CallFunctionFIFPI#(lpFunctionPointer%, p1%, p2#, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionFIFPF#(lpFunctionPointer%, p1%, p2#, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionFIFPP#(lpFunctionPointer%, p1%, p2#, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionFIP#(lpFunctionPointer%, p1%, p2*) : "BP_CallFunction2"
BP_CallFunctionFIPI#(lpFunctionPointer%, p1%, p2*, p3%) : "BP_CallFunction3"
BP_CallFunctionFIPII#(lpFunctionPointer%, p1%, p2*, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionFIPIF#(lpFunctionPointer%, p1%, p2*, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionFIPIP#(lpFunctionPointer%, p1%, p2*, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionFIPF#(lpFunctionPointer%, p1%, p2*, p3#) : "BP_CallFunction3"
BP_CallFunctionFIPFI#(lpFunctionPointer%, p1%, p2*, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionFIPFF#(lpFunctionPointer%, p1%, p2*, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionFIPFP#(lpFunctionPointer%, p1%, p2*, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionFIPP#(lpFunctionPointer%, p1%, p2*, p3*) : "BP_CallFunction3"
BP_CallFunctionFIPPI#(lpFunctionPointer%, p1%, p2*, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionFIPPF#(lpFunctionPointer%, p1%, p2*, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionFIPPP#(lpFunctionPointer%, p1%, p2*, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionFF#(lpFunctionPointer%, P1#) : "BP_CallFunction1"
BP_CallFunctionFFI#(lpFunctionPointer%, p1#, p2%) : "BP_CallFunction2"
BP_CallFunctionFFII#(lpFunctionPointer%, p1#, p2%, p3%) : "BP_CallFunction3"
BP_CallFunctionFFIII#(lpFunctionPointer%, p1#, p2%, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionFFIIF#(lpFunctionPointer%, p1#, p2%, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionFFIIP#(lpFunctionPointer%, p1#, p2%, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionFFIF#(lpFunctionPointer%, p1#, p2%, p3#) : "BP_CallFunction3"
BP_CallFunctionFFIFI#(lpFunctionPointer%, p1#, p2%, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionFFIFF#(lpFunctionPointer%, p1#, p2%, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionFFIFP#(lpFunctionPointer%, p1#, p2%, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionFFIP#(lpFunctionPointer%, p1#, p2%, p3*) : "BP_CallFunction3"
BP_CallFunctionFFIPI#(lpFunctionPointer%, p1#, p2%, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionFFIPF#(lpFunctionPointer%, p1#, p2%, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionFFIPP#(lpFunctionPointer%, p1#, p2%, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionFFF#(lpFunctionPointer%, p1#, p2#) : "BP_CallFunction2"
BP_CallFunctionFFFI#(lpFunctionPointer%, p1#, p2#, p3%) : "BP_CallFunction3"
BP_CallFunctionFFFII#(lpFunctionPointer%, p1#, p2#, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionFFFIF#(lpFunctionPointer%, p1#, p2#, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionFFFIP#(lpFunctionPointer%, p1#, p2#, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionFFFF#(lpFunctionPointer%, p1#, p2#, p3#) : "BP_CallFunction3"
BP_CallFunctionFFFFI#(lpFunctionPointer%, p1#, p2#, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionFFFFF#(lpFunctionPointer%, p1#, p2#, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionFFFFP#(lpFunctionPointer%, p1#, p2#, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionFFFP#(lpFunctionPointer%, p1#, p2#, p3*) : "BP_CallFunction3"
BP_CallFunctionFFFPI#(lpFunctionPointer%, p1#, p2#, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionFFFPF#(lpFunctionPointer%, p1#, p2#, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionFFFPP#(lpFunctionPointer%, p1#, p2#, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionFFP#(lpFunctionPointer%, p1#, p2*) : "BP_CallFunction2"
BP_CallFunctionFFPI#(lpFunctionPointer%, p1#, p2*, p3%) : "BP_CallFunction3"
BP_CallFunctionFFPII#(lpFunctionPointer%, p1#, p2*, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionFFPIF#(lpFunctionPointer%, p1#, p2*, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionFFPIP#(lpFunctionPointer%, p1#, p2*, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionFFPF#(lpFunctionPointer%, p1#, p2*, p3#) : "BP_CallFunction3"
BP_CallFunctionFFPFI#(lpFunctionPointer%, p1#, p2*, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionFFPFF#(lpFunctionPointer%, p1#, p2*, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionFFPFP#(lpFunctionPointer%, p1#, p2*, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionFFPP#(lpFunctionPointer%, p1#, p2*, p3*) : "BP_CallFunction3"
BP_CallFunctionFFPPI#(lpFunctionPointer%, p1#, p2*, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionFFPPF#(lpFunctionPointer%, p1#, p2*, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionFFPPP#(lpFunctionPointer%, p1#, p2*, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionFP#(lpFunctionPointer%, P1*) : "BP_CallFunction1"
BP_CallFunctionFPI#(lpFunctionPointer%, p1*, p2%) : "BP_CallFunction2"
BP_CallFunctionFPII#(lpFunctionPointer%, p1*, p2%, p3%) : "BP_CallFunction3"
BP_CallFunctionFPIII#(lpFunctionPointer%, p1*, p2%, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionFPIIF#(lpFunctionPointer%, p1*, p2%, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionFPIIP#(lpFunctionPointer%, p1*, p2%, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionFPIF#(lpFunctionPointer%, p1*, p2%, p3#) : "BP_CallFunction3"
BP_CallFunctionFPIFI#(lpFunctionPointer%, p1*, p2%, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionFPIFF#(lpFunctionPointer%, p1*, p2%, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionFPIFP#(lpFunctionPointer%, p1*, p2%, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionFPIP#(lpFunctionPointer%, p1*, p2%, p3*) : "BP_CallFunction3"
BP_CallFunctionFPIPI#(lpFunctionPointer%, p1*, p2%, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionFPIPF#(lpFunctionPointer%, p1*, p2%, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionFPIPP#(lpFunctionPointer%, p1*, p2%, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionFPF#(lpFunctionPointer%, p1*, p2#) : "BP_CallFunction2"
BP_CallFunctionFPFI#(lpFunctionPointer%, p1*, p2#, p3%) : "BP_CallFunction3"
BP_CallFunctionFPFII#(lpFunctionPointer%, p1*, p2#, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionFPFIF#(lpFunctionPointer%, p1*, p2#, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionFPFIP#(lpFunctionPointer%, p1*, p2#, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionFPFF#(lpFunctionPointer%, p1*, p2#, p3#) : "BP_CallFunction3"
BP_CallFunctionFPFFI#(lpFunctionPointer%, p1*, p2#, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionFPFFF#(lpFunctionPointer%, p1*, p2#, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionFPFFP#(lpFunctionPointer%, p1*, p2#, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionFPFP#(lpFunctionPointer%, p1*, p2#, p3*) : "BP_CallFunction3"
BP_CallFunctionFPFPI#(lpFunctionPointer%, p1*, p2#, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionFPFPF#(lpFunctionPointer%, p1*, p2#, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionFPFPP#(lpFunctionPointer%, p1*, p2#, p3*, p4*) : "BP_CallFunction4"
BP_CallFunctionFPP#(lpFunctionPointer%, p1*, p2*) : "BP_CallFunction2"
BP_CallFunctionFPPI#(lpFunctionPointer%, p1*, p2*, p3%) : "BP_CallFunction3"
BP_CallFunctionFPPII#(lpFunctionPointer%, p1*, p2*, p3%, p4%) : "BP_CallFunction4"
BP_CallFunctionFPPIF#(lpFunctionPointer%, p1*, p2*, p3%, p4#) : "BP_CallFunction4"
BP_CallFunctionFPPIP#(lpFunctionPointer%, p1*, p2*, p3%, p4*) : "BP_CallFunction4"
BP_CallFunctionFPPF#(lpFunctionPointer%, p1*, p2*, p3#) : "BP_CallFunction3"
BP_CallFunctionFPPFI#(lpFunctionPointer%, p1*, p2*, p3#, p4%) : "BP_CallFunction4"
BP_CallFunctionFPPFF#(lpFunctionPointer%, p1*, p2*, p3#, p4#) : "BP_CallFunction4"
BP_CallFunctionFPPFP#(lpFunctionPointer%, p1*, p2*, p3#, p4*) : "BP_CallFunction4"
BP_CallFunctionFPPP#(lpFunctionPointer%, p1*, p2*, p3*) : "BP_CallFunction3"
BP_CallFunctionFPPPI#(lpFunctionPointer%, p1*, p2*, p3*, p4%) : "BP_CallFunction4"
BP_CallFunctionFPPPF#(lpFunctionPointer%, p1*, p2*, p3*, p4#) : "BP_CallFunction4"
BP_CallFunctionFPPPP#(lpFunctionPointer%, p1*, p2*, p3*, p4*) : "BP_CallFunction4"
