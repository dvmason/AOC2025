Extension { #name : 'ByteSymbol' }

{ #category : '*AOC2025' }
ByteSymbol >> identity [

	self = #+ ifTrue: [ ^ 0 ].
	self = #* ifTrue: [ ^ 1 ].
	self = #- ifTrue: [ ^ 0 ].
	self error: 'identity unknown for ', self printString
]
