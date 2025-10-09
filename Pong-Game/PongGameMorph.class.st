Class {
	#name : #PongGameMorph,
	#superclass : #Morph,
	#instVars : [
		'game'
	],
	#category : #'Pong-Game'
}

{ #category : #initialization }
PongGameMorph >> initialize [
	super initialize.

	"Crear la instancia del juego"
	game := PongGame new.

	"Configurar la apariencia del Morph"
	self bounds: game bounds. "El tamaño del morph es el área de juego"
	self color: Color black. "Fondo negro"
]
