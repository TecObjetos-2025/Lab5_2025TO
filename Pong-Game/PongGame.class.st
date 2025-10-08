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

{ #category : #stepping }
PongGame >> step [
    "Tick de Juego: Avanzar un fotograma"
    ball step.
    ball handleBounceWithin: bounds.

    (ball isOutOfPlayIn: bounds) ifTrue: [
        "Si la pelota sale, determinar quien anota"
        (ball position x < bounds center x) "Por donde sale?"
            ifTrue: [ scoreboard increaseScoreForPlayerTwo ] "Sale izquierda, punto para J2"
            ifFalse: [ scoreboard increaseScoreForPlayerOne ]. "Sale derecha, punto para J1"

        "Reiniciar: Nuevo saque"
        ball resetIn: bounds.
    ]
]
