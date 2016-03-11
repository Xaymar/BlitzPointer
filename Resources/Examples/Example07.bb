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
; Example 7 - Callbacks
; ---------------------------------------------------------------------------- ;
; License: Creative Commons Attribution 2.0
; Author: Michael Fabian Dirks<michael.dirks@realitybends.de>
; Prerequisite: Example 5

; In my opinion, Callbacks are one of the best things that people have figured
;  out is useful. We can completely combine all our update logic into one single
;  function call without ever having to worry about how to handle a new object.
; Well, unless you are a terrible planner anyways.

Include "Example_Shared.bb"
ExampleInit()
SeedRnd MilliSecs()

; We'll begin by creating a basic Type that holds our generic object. By itself
;  this generic object does nothing, but we define custom callbacks later on.
; For optimization reasons (saves some memory) we can use a manually defined
;  index for our callbacks.

; Using an Index to store our Callbacks is more efficient that storing it for
;  each entry. By doing this we can also have multiple functions that use the
;  same structure (Update, PhysicsUpdate, Render, ...). It is wise to reserve
;  the first index to check for incorrectly created objects.
Dim CallbackIndex(10)

; Here we define our Type. Since each object has an Index, we
Type TGeneric
;    For optimization reasons and saving memory, we just store a callback index.
	Field Index
	
;    We only need to store the pointer to our Type object, nothing else.
	Field Pointer
End Type

Function TGenericUpdate()
	Local This.TGeneric
	For This = Each TGeneric
		If This\Pointer <> 0 Then
			If BP_CallFunctionII(CallbackIndex(This\Index), This\Pointer) Then
				Delete This
			EndIf
		EndIf
	Next
End Function

; TGeneric will call a function pointer with the following footprint:
;   int FUNCTION(pointer)
; We will need to implement this function footprint in every callback.

; Our first Type will hold Cubes that moves up and down.
Type TCube
	; Our TCube is represented by an actual Cube in the world, so let's store it.
	Field Entity
	; This is the original position of the Cube. Y is dynamically modified in code.
	Field PosX#, PosY#, PosZ#
	; And finally, the time it was created.
	Field Time
End Type
; Assign an index to our new Type (starting at 1)
Const CALLBACK_INDEX_TCUBE% = 1

Function TCubeCreate.TCube(X#, Y#, Z#)
	; Create our Object
	Local This.TCube = New TCube
	This\Entity = CreateCube(Example_SceneRoot)
	This\PosX = X
	This\PosY = Y
	This\PosZ = Z
	This\Time = MilliSecs()
	
	; And now store it withing TGeneric
	Local TG.TGeneric = New TGeneric
	TG\Index = CALLBACK_INDEX_TCUBE
	; To get the pointer we need (and can store), we just use Int() on the object.
	TG\Pointer = Int(This)
	
	; That's all we had to do.
	Return This
End Function

Function TCubeCallback%(This.TCube)
	If CallbackIndex(CALLBACK_INDEX_TCUBE) = 0 Then
		CallbackIndex(CALLBACK_INDEX_TCUBE) = BP_GetFunctionPointer()
		Return
	EndIf
	; Safeguard against stupidity (it affect everyone).
	If This = Null Then Return True
	
	Local TimeDiff = (MilliSecs() - This\Time)
	
	Local YOffset# = Cos((Cos(This\PosX) * 180) + (Sin(This\PosZ) * 180) + (TimeDiff / 10.0)) * 5 + 5
	PositionEntity This\Entity, This\PosX, This\PosY + YOffset, This\PosZ
	EntityAlpha This\Entity, 1.0 - (TimeDiff / 5000.0)
	
	; We will allow the object to exist for at most 5 seconds.
	If TimeDiff > 5000 Then
		TCubeDestroy(This)
		Return True
	EndIf
	Return False
End Function

Function TCubeDestroy(This.TCube)
	; Safeguard against stupidity (it affect everyone).
	If This = Null Then Return
	
	FreeEntity This\Entity
	Delete This
End Function

; And call the function once to automagically register it as a callback.
TCubeCallback(Null)

; Next up is our second Type. It will hold a simple sphere that grows over time.
Type TSphere
	; Again, represented by an actual Sphere in the world.
	Field Entity
	; And the time it was created.
	Field Time
End Type
; And we will assign the second index to it.
Const CALLBACK_INDEX_TSPHERE% = 2

Function TSphereCreate.TSphere(X#, Y#, Z#)
	; Initialize our TSphere instance.
	Local This.TSphere = New TSphere
	This\Entity = CreateSphere(32, Example_SceneRoot)
	PositionEntity This\Entity, X, Y, Z
	This\Time = MilliSecs()
	
	; And now store it withing TGeneric
	Local TG.TGeneric = New TGeneric
	TG\Index = CALLBACK_INDEX_TSPHERE
	TG\Pointer = Int(This)
	
	Return This
End Function

Function TSphereUpdate%(This.TSphere)
	If CallbackIndex(CALLBACK_INDEX_TSPHERE) = 0 Then
		CallbackIndex(CALLBACK_INDEX_TSPHERE) = BP_GetFunctionPointer()
		Return
	EndIf
	; Safeguard against stupidity (it affect everyone).
	If This = Null Then Return True
	
	Local TimeDiff = (MilliSecs() - This\Time)
	Local TimePrc# = TimeDiff / 2500.0
	
	Local Stp#, StpSize#
	Local R#, G#, B#, A#, Scale#
	;Step
	StpSize# = 0.05:Stp# = 1.0 / (1.0 - StpSize)
	R = Interp(1, 1, TimePrc * Stp)
	G = Interp(1, 1, TimePrc * Stp)
	B = Interp(1, 0, TimePrc * Stp)
	;Step
	StpSize# = 0.20:Stp# = 1.0 / (1.0 - StpSize)
	R = Interp(R, 1, (TimePrc - 0.05) * Stp)
	G = Interp(G, 0.75, (TimePrc - 0.05) * Stp)
	B = Interp(B, 0, (TimePrc - 0.05) * Stp)
	;Step
	StpSize# = 0.25:Stp# = 1.0 / (1.0 - StpSize)
	R = Interp(R, 1, (TimePrc - 0.25) * Stp)
	G = Interp(G, 0, (TimePrc - 0.25) * Stp)
	B = Interp(B, 0, (TimePrc - 0.25) * Stp)
	;Step
	StpSize# = 0.50:Stp# = 1.0 / (1.0 - StpSize)
	R = Interp(R, 0, (TimePrc - 0.50) * Stp)
	G = Interp(G, 0, (TimePrc - 0.50) * Stp)
	B = Interp(B, 0, (TimePrc - 0.50) * Stp)
	
	;AlphaStop 1 at (0.8 of 1.0)
	A = Interp(1, 0, (TimePrc - 0.8) * 5)
	
	Scale = Interp(1, 20, Sin(TimePrc * 90))
	ScaleEntity This\Entity, Scale,Scale,Scale
	EntityColor This\Entity, R * 255, G * 255, B * 255
	EntityAlpha This\Entity, A
	
	; We will allow the object to exist for at most 2.5 seconds.
	If TimeDiff > 2500 Then
		TSphereDestroy(This)
		Return True
	EndIf
	Return False
End Function
TSphereUpdate(Null)

Function TSphereDestroy(This.TSphere)
	; Safeguard against stupidity (it affect everyone).
	If This = Null Then Return
	
	FreeEntity This\Entity
	Delete This
End Function

; And finally, a terrain that we can pick a spawning position from.
Local Terrain = CreateTerrain(256, Example_SceneRoot)
ScaleEntity Terrain, 1 / 256.0, 64, 1 / 256.0
MoveEntity Terrain, -100, 0, -100
ScaleEntity Terrain, 1 / 256.0 * 201, 64, 1 / 256.0 * 201
EntityColor Terrain, 25, 92, 25
TerrainShading Terrain, True
TerrainDetail Terrain, 32767, False
EntityPickMode Terrain, 2, True 

RandomTerrain(Terrain, 256, 8, 8)

MoveEntity Example_Camera, 0, 0, -125
;HideEntity Example_Floor

While Not KeyHit(1)
	TGenericUpdate()
	
	; Space to randomize Terrain
	If KeyHit(57) Then
		RandomTerrain(Terrain, 256, Rand(1,8), Rand(1,8))
	EndIf
	
	Local ZDelta = MouseZSpeed()
	If KeyHit(2) Or ZDelta > 0 Then
		CameraPick(Example_Camera, MouseX(), MouseY())
		TCubeCreate(PickedX(), PickedY(), PickedZ())
	EndIf
	
	If KeyHit(3) Or ZDelta < 0 Then
		CameraPick(Example_Camera, MouseX(), MouseY())
		TSphereCreate(PickedX(), PickedY(), PickedZ())
	EndIf
	
	ExampleUpdate()
	ExampleLoop()
	UpdateWorld()
Wend

Function RandomTerrain(Terrain, GridSize, CellsX = 1, CellsZ = 1)
	Local CellW, CellH, CellX, CellZ, TerX, TerZ, CellPrcX#, CellPrcZ#
	Local HTL#, HTR#, HBL#, HBR#, HCC#
	
	CellW = Floor(GridSize / Float(CellsX))
	CellH = Floor(GridSize / Float(CellsZ))
	
	Local RowSize = CellsZ + 1
	Local TempBankSize = (CellsX + 1) * RowSize * 4
	Local TempBank = CreateBank(TempBankSize)
	For CellX = 0 To CellsX
		For CellZ = 0 To CellsZ
			PokeFloat TempBank, 4 * (CellX * RowSize + CellZ), Rnd(0, 1)
		Next
	Next
	
	Local OCellX, OCellZ:OCellX = -1: OCellZ = -1
	For TerX = 1 To (GridSize - 1)
		CellX = Floor(TerX / Float(CellW))
		CellPrcX = (TerX Mod CellW) / Float(CellW - 1)
		For TerZ = 1 To (GridSize - 1)
			CellZ = Floor(TerZ / Float(CellH))
			CellPrcZ = (TerZ Mod CellH) / Float(CellH - 1)
			;DebugLog CellPrcZ
			
			If CellX <> OCellX Or CellZ <> OCellZ Then
				HTL = PeekFloat(TempBank, 4 * (((CellX + 0) * RowSize + (CellZ + 0))))
				HTR = PeekFloat(TempBank, 4 * (((CellX + 1) * RowSize + (CellZ + 0))))
				HBL = PeekFloat(TempBank, 4 * (((CellX + 0) * RowSize + (CellZ + 1))))
				HBR = PeekFloat(TempBank, 4 * (((CellX + 1) * RowSize + (CellZ + 1))))
				OCellX = CellX:OCellZ = CellZ
			EndIf
			
			Local PrcX#, PrcZ#
			; Normally, you'd use a bezier curve for this.
			PrcX = (Sin(-90 + CellPrcX*180) * 0.5 + 0.5)
			PrcZ = (Sin(-90 + CellPrcZ*180) * 0.5 + 0.5)
			Local Height# = Interp(Interp(HTL, HTR, PrcX), Interp(HBL, HBR, PrcX), PrcZ)
			
			ModifyTerrain Terrain, TerX, TerZ, Height
		Next
	Next
	FreeBank TempBank
End Function

Function Min#(A#, B#)
	If B < A Then Return B
	Return A
End Function

Function Max#(A#, B#)
	If B > A Then Return B
	Return A
End Function

Function Interp#(L#, R#, Lerp#)
	Lerp = Min(Max(Lerp, 0.0), 1.0)
	Return L * (1.0 - Lerp) + R * Lerp
End Function
;~IDEal Editor Parameters:
;~C#Blitz3D