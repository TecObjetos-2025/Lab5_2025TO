Class {
	#name : #Paddle,
	#superclass : #Object,
	#instVars : [
		'position',
		'size'
	],
	#category : #'Pong-Game'
}

{ #category : #initialization }
Paddle >> initialize [
	super initialize.
	position := 50 @ 200. "Posición inicial a la izquierda y al centro"
	size := 10 @ 80. "10 de ancho, 80 de alto"
]

{ #category : #accessing }
Paddle >> position [
	^ position
]

{ #category : #accessing }
Paddle >> position: aPoint [
	position := aPoint
]

{ #category : #accessing }
Paddle >> size [ 
	^ size
]
