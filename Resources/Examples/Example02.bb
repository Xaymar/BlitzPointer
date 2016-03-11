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
; Example 2 - Calling Functions (Beginner)
; ---------------------------------------------------------------------------- ;
; License: Creative Commons Attribution 2.0
; Author: Michael Fabian Dirks<michael.dirks@realitybends.de>
; Prerequisite: Example 1

; Since we now know how to retrieve a function pointer, how about we call it?

Include "Example_Shared.bb"
ExampleInit()

Global fpOurFunction = 0
Function OurFunction()
	If fpOurFunction = 0 Then
		fpOurFunction = BP_GetFunctionPointer()
		Return
	EndIf
	
	Text 0, 0, "Function Pointer"
	Text 0,15, "  0x" + Replace(RSet(Hex(fpOurFunction),8)," ","0")
End Function
OurFunction()

While Not KeyHit(1)
	ExampleUpdate()
	
;   BlitzPointer offers many ways of calling our function pointer. Each one
;    describes different return types, parameter count and parameter types. 
;   Let's use the one that doesn't return a value for now.
	BP_CallFunctionV fpOurFunction
;   Now if we run the program, instead of a fixed native call, we're calling a
;    function pointer instead. Pretty useful in my opinion, especially for UI,
;    networking, fake classes, etc.
;   We'll talk about the other ways of calling a function in Example 3.
	
	ExampleLoop()
Wend

End
;~IDEal Editor Parameters:
;~C#Blitz3D