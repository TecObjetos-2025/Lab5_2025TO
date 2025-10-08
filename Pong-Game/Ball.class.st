Class {
	#name : #Ball,
	#superclass : #Object,
	#instVars : [
		'position',
		'velocity'
	],
	#category : #'Pong-Game'
}

{ #category : #'as yet unclassified' }
Ball >> handleBounceWithin: aRectangle [
    | newVelocity minY maxY| "Variable temporal"
	"Obtener los limmites superior e inferior"
	minY := aRectangle top.
	maxY := aRectangle bottom.
    newVelocity := self velocity.

    (self position y < minY or: [ self position y > maxY ])
	"Invertir la direccion vertical para simular rebote"
        ifTrue: [ newVelocity := newVelocity x @ (newVelocity y * -1) ].

    self velocity: newVelocity
]

{ #category : #initialization }
Ball >> initialize [
    "Inicializa la posición y velocidad de la bola"
    super initialize.
    position := 100 @ 100.
    velocity := 5 @ 5.
]

{ #category : #testing }
Ball >> isOutOfPlayIn: aRectangle [
    "Responder true si la pelota se ha salido por la izquierda o la derecha"
    ^ self position x < aRectangle left or: [ self position x > aRectangle right ]
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

{ #category : #accessing }
Ball >> velocity: aPoint [
    velocity := aPoint
]
