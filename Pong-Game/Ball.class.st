Class {
	#name : #Ball,
	#superclass : #Object,
	#instVars : [
		'position',
		'velocity'
	],
	#category : #'Pong-Game'
}

{ #category : #initialization }
Ball >> initialize [
    "Inicializa la posición y velocidad de la bola"
    super initialize.
    position := 100 @ 100.
    velocity := 5 @ 5.
]
