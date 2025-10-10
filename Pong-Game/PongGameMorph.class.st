Class {
	#name : #PongGameMorph,
	#superclass : #Morph,
	#instVars : [
		'game',
		'ballMorph',
		'p1PaddleMorph',
		'p2PaddleMorph',
		'scoreboardMorph'
	],
	#category : #'Pong-Game'
}

{ #category : #'event handling' }
PongGameMorph >> handlesKeyDown: anEvent [
    ^ true
]

{ #category : #'event handling' }
PongGameMorph >> handlesMouseOver: anEvent [
    ^ true
]

{ #category : #initialization }
PongGameMorph >> initialize [
	 | scoreText |
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

    "Crear el Morph del marcador"
    scoreboardMorph := TextMorph new.

  	 scoreText := '0 - 0' asText.  
	 scoreText addAttribute: (TextColor color: Color white).
	 scoreText addAttribute: (TextFontReference toFont: (LogicalFont familyName: 'Source Sans Pro' pointSize: 20)).

	 scoreboardMorph contents: scoreText.
	 scoreboardMorph position: self center x - 30 @ 10.

    "Añadir como sub-morph"
    self addMorph: scoreboardMorph.
]

{ #category : #'event handling' }
PongGameMorph >> keyDown: anEvent [
    "Controles para el Jugador 1 (W y S)"
    (anEvent keyCharacter = $w) ifTrue: [ game playerOnePaddle moveUpWithin: game bounds ].
    (anEvent keyCharacter = $s) ifTrue: [ game playerOnePaddle moveDownWithin: game bounds ].

    "Controles para el Jugador 2 (Flecha Arriba y Abajo)"
    (anEvent keyValue = 30) ifTrue: [ game playerTwoPaddle moveUpWithin: game bounds ].
    (anEvent keyValue = 31) ifTrue: [ game playerTwoPaddle moveDownWithin: game bounds ].
]

{ #category : #'event handling' }
PongGameMorph >> mouseEnter: anEvent [
    "Si ratón entra, pedir el foco del teclado"
    anEvent hand newKeyboardFocus: self
]

{ #category : #'event handling' }
PongGameMorph >> mouseLeave: anEvent [
    "Si el ratón sale, liberar el foco"
    anEvent hand releaseKeyboardFocus: self
]

{ #category : #stepping }
PongGameMorph >> step [
	 | scoreString scoreText |
	"Avanzar la logica del juego"
    game step.

    ballMorph position: game ball position.
    p1PaddleMorph position: game playerOnePaddle position.
    p2PaddleMorph position: game playerTwoPaddle position.

	 "Actualizar el texto del marcador"
    scoreString := game scoreboard playerOneScore asString, ' - ', game scoreboard playerTwoScore asString.

	 scoreText := scoreString asText.
	 scoreText addAttribute: (TextColor color: Color white).
	 scoreText addAttribute: (TextFontReference toFont: (LogicalFont familyName: 'Source Sans Pro' pointSize: 20)).

	 scoreboardMorph contents: scoreText.

]

{ #category : #stepping }
PongGameMorph >> stepTime [
    "Hacer 'step' cada 16 milisegundos."
    ^ 16
]
