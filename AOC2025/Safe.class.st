"
I represent the combination lock on a safe, for use in day 1
"
Class {
	#name : 'Safe',
	#superclass : 'Object',
	#instVars : [
		'count',
		'position'
	],
	#category : 'AOC2025-Support',
	#package : 'AOC2025',
	#tag : 'Support'
}

{ #category : 'as yet unclassified' }
Safe >> click: code [

	code first = $L ifTrue: [ self step: code allButFirst asInteger negated ].
	code first = $R ifTrue: [ self step: code allButFirst asInteger ]
]

{ #category : 'accessing' }
Safe >> count [

	^ count
]

{ #category : 'as yet unclassified' }
Safe >> dial: code [

	code first = $L ifTrue: [ self turn: code allButFirst asInteger negated ].
	code first = $R ifTrue: [ self turn: code allButFirst asInteger ]
]

{ #category : 'initialization' }
Safe >> initialize [

	super initialize.
	count := 0.
	position := 50
]

{ #category : 'accessing' }
Safe >> step: anInteger [ 

	anInteger abs timesRepeat: [ 
		position := position + anInteger sign \\ 100.
		position = 0 ifTrue: [ count := count + 1 ] ]
]

{ #category : 'as yet unclassified' }
Safe >> turn: anInteger [ 
	position := position + anInteger \\ 100.
	position = 0 ifTrue: [ count := count + 1 ]
]
