Class {
	#name : #Ball,
	#superclass : #Object,
	#instVars : [
		'position',
		'velocity'
	],
	#category : #'Pong-Game'
}

{ #category : #accessing }
Ball >> bounds [
    "Lo que ocupa la pelota"
    ^ position extent: 10@10
]

{ #category : #'game logic' }
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

{ #category : #'game logic' }
Ball >> handleCollisionsWith: aCollectionOfPaddles [
    aCollectionOfPaddles do: [ :aPaddle |
        (self bounds intersects: aPaddle bounds) ifTrue: [
            self reverseXVelocity
        ]
    ]
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

{ #category : #initialization }
Ball >> resetIn: aRectangle [
    "Poner la pelota en el centro"
    position := aRectangle center.
    "Velocidad aleatoria para variar el saque: En las posibles 4 diagonales"
    velocity := ((#(1 -1) atRandom) * 5) @ ((#(1 -1) atRandom) * 5).
]

{ #category : #'game logic' }
Ball >> reverseXVelocity [
    "Invierte la velocidad en el eje X: Para rebote horizontal"
    self velocity: (velocity x * -1) @ velocity y
]

{ #category : #stepping }
Ball >> step [
	"Suma automatica de clases Point"
	position := position + velocity
]

{ #category : #'game logic' }
Ball >> updateStateWithin: aRectangle forGame: aPongGame [
    self step.
    self handleBounceWithin: aRectangle.

    (self isOutOfPlayIn: aRectangle) ifTrue: [
        "Decirle al juego que anote"
        aPongGame handleScoreFor: self. 
        "Reiniciarse"
        self resetIn: aRectangle.
    ]
]

{ #category : #stepping }
Ball >> velocity [
	^ velocity
]

{ #category : #accessing }
Ball >> velocity: aPoint [
    velocity := aPoint
]
