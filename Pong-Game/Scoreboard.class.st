Class {
	#name : #Scoreboard,
	#superclass : #Object,
	#instVars : [
		'playerOneScore',
		'playerTwoScore'
	],
	#category : #'Pong-Game'
}

{ #category : #'game logic' }
Scoreboard >> increaseScoreForPlayerOne [
    playerOneScore := playerOneScore + 1
]

{ #category : #'game logic' }
Scoreboard >> increaseScoreForPlayerTwo [
    playerTwoScore := playerTwoScore + 1
]

{ #category : #initialization }
Scoreboard >> initialize [
	super initialize.
	playerOneScore := 0.
	playerTwoScore := 0.
]
