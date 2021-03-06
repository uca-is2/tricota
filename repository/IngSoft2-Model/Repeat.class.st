Class {
	#name : #Repeat,
	#superclass : #Card,
	#category : #'IngSoft2-Model-Card'
}

{ #category : #playing }
Repeat >> applyWithin: playersWithPositions knowing: activeCards  the: lastEffect and: finishLine of: game [
	
	|actualPosition positionWithEffect|
	self assertSomeoneRolledDice: lastEffect .
	actualPosition:= (self currentPositionOfTargetIn: playersWithPositions)lockerPosition.
	positionWithEffect := lastEffect applyEffectTo: actualPosition knowing: playersWithPositions the: target and: finishLine .
	(self currentPositionOfTargetIn: playersWithPositions) moveTo: positionWithEffect knowing: finishLine .
	game lastCardPlayed: self.
]

{ #category : #assertions }
Repeat >> assertSomeoneRolledDice: lastEffect [ 
	(lastEffect = 'No effect yet')
		ifTrue: [ InvalideRequest signal: 'Nobody rolled the dice yet' ]
]

{ #category : #playing }
Repeat >> currentPositionOfTargetIn: playersWithPositions [
	^ playersWithPositions at: target
]
