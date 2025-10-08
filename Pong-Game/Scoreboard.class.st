Class {
	#name : #Scoreboard,
	#superclass : #Object,
	#instVars : [
		'playerOneScore',
		'playerTwoScore'
	],
	#category : #'Pong-Game'
}

{ #category : #'as yet unclassified' }
Scoreboard >> increaseScoreForPlayerOne [
    playerOneScore := playerOneScore + 1
]

{ #category : #'as yet unclassified' }
Scoreboard >> increaseScoreForPlayerTwo [
    playerTwoScore := playerTwoScore + 1
]

{ #category : #initialization }
Scoreboard >> initialize [
	super initialize.
	playerOneScore := 0.
	playerTwoScore := 0.
]
