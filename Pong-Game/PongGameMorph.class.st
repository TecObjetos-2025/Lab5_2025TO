Class {
	#name : #PongGameMorph,
	#superclass : #Morph,
	#instVars : [
		'game'
	],
	#category : #'Pong-Game'
}

{ #category : #initialization }
PongGameMorph >> initialize [
    | ballMorph p1PaddleMorph p2PaddleMorph |
    super initialize.

    "Crear el modelo del juego"
    game := PongGame new.
    self bounds: game bounds.
    self color: Color black. "Fondo negro"

    "Crear el Morph de la pelota"
    ballMorph := Morph new.
    ballMorph color: Color white.
    ballMorph extent: 10@10. "tamaño"
    ballMorph position: game ball position.

    "Crear los Morphs de las paletas"
    p1PaddleMorph := Morph new.
    p1PaddleMorph color: Color white.
    p1PaddleMorph extent: game playerOnePaddle size.
    p1PaddleMorph position: game playerOnePaddle position.

    p2PaddleMorph := Morph new.
    p2PaddleMorph color: Color white.
    p2PaddleMorph extent: game playerTwoPaddle size.
    p2PaddleMorph position: game playerTwoPaddle position.

    "Añadir como 'sub-morphs' al tablero"
    self addMorph: ballMorph.
    self addMorph: p1PaddleMorph.
    self addMorph: p2PaddleMorph.
]
