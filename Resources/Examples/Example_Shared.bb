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

Global Example_Timer
; Camera
Global Example_Camera_YawPivot
Global Example_Camera_PitchPivot
Global Example_Camera
; Scene
Global Example_SceneRoot
Global Example_SceneLight
Global Example_Floor
Global Example_Block

Function ExampleInit()
	Example_Timer = CreateTimer(60)
	
	Graphics3D 1024, 768, 32, 2
	SetBuffer BackBuffer()
	
	Example_Camera_YawPivot = CreatePivot()
	Example_Camera_PitchPivot = CreatePivot(Example_Camera_YawPivot)
	Example_Camera = CreateCamera(Example_Camera_PitchPivot)
	MoveEntity Example_Camera, 0, 0, -20
	TurnEntity Example_Camera_PitchPivot, 30, 0, 0
	
	Example_SceneRoot = CreatePivot()
	
	AmbientLight 51, 51, 51
	Example_SceneLight = CreateLight(1, Example_SceneRoot)
	RotateEntity Example_SceneLight, 70, 30, 0
	
	Example_Floor = CreateCube(Example_SceneRoot)
	EntityColor Example_Floor, 153, 255, 153
	EntityShininess Example_Floor, 1.0
	ScaleEntity Example_Floor, 100, 0.001, 100
	
	;Example_Block = CreateCube(Example_SceneRoot)
	;MoveEntity Example_Block, 0, 1, 0
End Function

Function ExampleUpdate()
	Local MX#, MY#
	
	MX = (MouseX() - 512) / 512.0
	MY = (MouseY() - 384) / 384.0
	
	If MouseHit(1) Then
		MoveMouse 512, 384
	ElseIf MouseDown(1) Then
		TurnEntity Example_Camera_YawPivot, 0, -MX, 0
		TurnEntity Example_Camera_PitchPivot, MY, 0, 0
		;MoveMouse 512, 384
	EndIf
	
	If MouseHit(2) Then
		MoveMouse 512, 384
	ElseIf MouseDown(2) Then
		MoveEntity Example_Camera, 0, 0, MY
		;MoveMouse 512, 384
	EndIf
	
	RenderWorld
End Function

Function ExampleLoop()
	Flip 0:Cls:WaitTimer(Example_Timer)
End Function
;~IDEal Editor Parameters:
;~C#Blitz3D