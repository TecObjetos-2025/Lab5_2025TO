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

{ #category : #stepping }
Ball >> position [
	"Similar a return en otros lenguajes"
	^ position
]

{ #category : #stepping }
Ball >> step [
	"Suma automatica de clases Point"
	position := position + velocity
]

{ #category : #stepping }
Ball >> velocity [
	^ velocity
]
