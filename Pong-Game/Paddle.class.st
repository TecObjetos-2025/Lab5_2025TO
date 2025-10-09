Class {
	#name : #Paddle,
	#superclass : #Object,
	#instVars : [
		'position',
		'size'
	],
	#category : #'Pong-Game'
}

{ #category : #accessing }
Paddle >> bounds [
    "El rectángulo que ocupa la paleta"
    ^ position extent: size
]

{ #category : #initialization }
Paddle >> initialize [
	super initialize.
	position := 50 @ 200. "Posición inicial a la izquierda y al centro"
	size := 10 @ 80. "10 de ancho, 80 de alto"
]

{ #category : #actions }
Paddle >> moveDown [
    "Sumar 10 a la coordenada Y para moverse hacia abajo"
    position := position x @ (position y + 10).
]

{ #category : #'game controls' }
Paddle >> moveDownWithin: aRectangle [
    | newY |
    newY := self position y + 10.
    "Solo mover si la nueva posición inferior no se sale del límite inferior"
    ( (newY + self size y) <= aRectangle bottom) ifTrue: [
        position := self position x @ newY
    ]
]

{ #category : #actions }
Paddle >> moveUp [
    "Restar 10 a la coordenada Y para moverse hacia arriba"
    position := position x @ (position y - 10).
]

{ #category : #'game controls' }
Paddle >> moveUpWithin: aRectangle [
    | newY |
    newY := self position y - 10.
    "Solo se puede mover si la nueva posición superior no se sale del límite superior"
    (newY >= aRectangle top) ifTrue: [
        position := self position x @ newY
    ]
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
