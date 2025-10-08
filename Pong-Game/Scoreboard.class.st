Class {
	#name : #Scoreboard,
	#superclass : #Object,
	#instVars : [
		'playerOneScore',
		'playerTwoScore'
	],
	#category : #'Pong-Game'
}

{ #category : #initialization }
Scoreboard >> initialize [
	super initialize.
	playerOneScore := 0.
	playerTwoScore := 0.
]
