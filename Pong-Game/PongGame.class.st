Class {
	#name : #PongGame,
	#superclass : #Object,
	#instVars : [
		'ball',
		'playerOnePaddle',
		'playerTwoPaddle',
		'scoreboard',
		'bounds'
	],
	#category : #'Pong-Game'
}

{ #category : #accessing }
PongGame >> ball [
	^ ball 
]

{ #category : #accessing }
PongGame >> bounds [
    ^ bounds
]

{ #category : #'game logic' }
PongGame >> handleScoreFor: aBall [
    "Recibir aviso y decidir a quién darle el punto"
    (aBall position x < bounds center x)
        ifTrue: [ scoreboard increaseScoreForPlayerTwo ]
        ifFalse: [ scoreboard increaseScoreForPlayerOne ].
]

{ #category : #initialization }
PongGame >> initialize [
	super initialize.
	bounds := 0@0 corner: 600@400. "Un área de juego de 600x400"

	ball := Ball new.
	scoreboard := Scoreboard new.

	playerOnePaddle := Paddle new.
	playerTwoPaddle := Paddle new.

	"Ajustar las posiciones iniciales de las paletas"
	playerOnePaddle position: (bounds left + 20) @ (bounds center y).
	playerTwoPaddle position: (bounds right - 20) @ (bounds center y).
]

{ #category : #accessing }
PongGame >> playerOnePaddle [
	^ playerOnePaddle 
]

{ #category : #accessing }
PongGame >> playerTwoPaddle [
	^ playerTwoPaddle 
]

{ #category : #accessing }
PongGame >> scoreboard [
    ^ scoreboard
]

{ #category : #stepping }
PongGame >> step [
    "El 'tick' principal del juego. Avanzar un fotograma."
    ball step.
    ball handleBounceWithin: bounds.

    "NUEVA LÓGICA DE COLISIÓN (Pelota ahora se encarga)"
    ball handleCollisionsWith: { playerOnePaddle . playerTwoPaddle }.

    (ball isOutOfPlayIn: bounds) ifTrue: [
        (ball position x < bounds center x)
            ifTrue: [ scoreboard increaseScoreForPlayerTwo ]
            ifFalse: [ scoreboard increaseScoreForPlayerOne ].
        ball resetIn: bounds
    ]
]
