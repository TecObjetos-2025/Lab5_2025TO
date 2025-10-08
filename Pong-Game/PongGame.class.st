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
