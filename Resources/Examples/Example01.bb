;	BlitzPointer - Adding Pointers to Blitz.
;	Copyright (C) 2015 Xaymar (Michael Fabian Dirks)
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

; ---------------------------------------------------------------------------- ;
; Example 1 - Retrieving Function Pointers
; ---------------------------------------------------------------------------- ;
; License: Creative Commons Attribution 2.0
; Author: Michael Fabian Dirks<michael.dirks@realitybends.de>

; If you don't know what a pointer is, I recommend googling it.

; Blitz doesn't offer native ways of getting function pointers, nor would they
;  work with anything but tailored ASM calls. So what can they be useful for?
; Here are some examples on what you can do:
;	* Footprint-only Callbacks (no longer need to override functions)
;	* Creating APIs that support multiple versions.


Include "Example_Shared.bb"
ExampleInit()

; We begin by initalizing a variable to hold our pointer. Globals work best for 
;  this task as we don't have to use a function parameter.
Global fpOurFunction = 0

; Our function can be anything we want, however we must be able to call it once
;  without effect before we can actually retrieve the function pointer. Why?
; Simple! The BP_GetFunctionPointer traces the return address for the
;  Blitz function signature - and thus can't work outside a function.
Function OurFunction()
;	Let's begin by checking if we already have the pointer. Not required, but
;	 we do it anyway to save some scanning time on every call.
	If fpOurFunction = 0 Then
;		Now let us call the above mentioned function to retrieve the pointer.
		fpOurFunction = BP_GetFunctionPointer()
;		Weether you use a Return or an Else is up to you. Return is technically
;		 faster in Blitz, as using Else causes a complex ASM construction.
		Return
	EndIf
	
;	For proof reasons, we show the pointer on the screen.
	Text 0, 0, "Function Pointer"
	Text 0,15, "  0x" + Replace(RSet(Hex(fpOurFunction),8)," ","0")
End Function
; Now we call our function once. Since there is no function pointer assigned
;  it will return almost immediately.
OurFunction()

While Not KeyHit(1)
	ExampleUpdate()
	
	OurFunction()
	
	ExampleLoop()
Wend

End
;~IDEal Editor Parameters:
;~C#Blitz3D