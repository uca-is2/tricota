Class {
	#name : #Effect,
	#superclass : #Object,
	#category : #'IngSoft2-Model-Effects'
}

{ #category : #playing }
Effect >> = anObject [ 

	self class = anObject class ifTrue: [ ^true ] ifFalse: [ ^false ].	
	


]

{ #category : #playing }
Effect >> applyEffectTo: aPosition knowing: players the: currentPlayer and: finishline [ 

	Error signal: 'This message should be override'.
]
