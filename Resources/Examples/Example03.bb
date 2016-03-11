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
; Example 3 - Calling Functions (Intermediate)
; ---------------------------------------------------------------------------- ;
; License: Creative Commons Attribution 2.0
; Author: Michael Fabian Dirks<michael.dirks@realitybends.de>
; Prerequisite: Example 2

; BlitzPointer offers a lot of ways to call our function pointer. Each one 
;  describes return type, parameter count and parameter types.
; So, what magic can we do with those?

; BlitzPointer supports three return types:
; ---------------------------------------------------------------------------- ;
;  Type    Id  Description      Calling Function
; ---------------------------------------------------------------------------- ;
;   void	V	Nothing          BP_CallFunctionV
;   int		I	32-bit Integer   BP_CallFunctionI
;   float	F	Floating Point   BP_CallFunctionF

; Now that we know what we can and can't do (without memory leaks at least),
;  let's try out the return types ourselves.

Include "Example_Shared.bb"
ExampleInit()

; 'void' function
Global fpVoidFunction = 0
Function VoidFunction()
	If fpVoidFunction = 0 Then
		fpVoidFunction = BP_GetFunctionPointer()
		Return
	EndIf
	Text 0, 0, "Void Return Type"
End Function
VoidFunction()

; 'int' function
Global fpIntFunction = 0
Function IntFunction%()
	If fpIntFunction = 0 Then
		fpIntFunction = BP_GetFunctionPointer()
		Return
	EndIf
	Text   0, 15, "Int Return Type"
	Return MilliSecs()
End Function
IntFunction()

; 'float' function
Global fpFloatFunction = 0
Function FloatFunction#()
	If fpFloatFunction = 0 Then
		fpFloatFunction = BP_GetFunctionPointer()
		Return
	EndIf
	Text    0, 30, "Float Return Type"
	Return MilliSecs() / 1000.0
End Function
FloatFunction()

While Not KeyHit(1)
	ExampleUpdate()
	
;	Calling the function and using the return value is really easy to do now:
	BP_CallFunctionV(fpVoidFunction)		; void returns nothing.
	Text 200, 15, BP_CallFunctionI(fpIntFunction)
	Text 200, 30, BP_CallFunctionF(fpFloatFunction)
	
	ExampleLoop()
Wend
End
;~IDEal Editor Parameters:
;~C#Blitz3D