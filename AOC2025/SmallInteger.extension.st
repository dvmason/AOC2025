Extension { #name : 'SmallInteger' }

{ #category : '*AOC2025' }
SmallInteger >> dupped [

	| str len |
	str := self asString.
	len := str size.
	len odd ifTrue: [  ^ false ].
	^ (str first: len / 2) = (str last: len / 2)
]

{ #category : '*AOC2025' }
SmallInteger >> repped [

	| str len |
	str := self asString.
	len := str size.
	1 to: len // 2 do: [ : l |
		len // l * l = len ifTrue: [
			(str repsOf: (str first: l)) ifTrue: [ ^ true]
			 ] ].
	^ false
]
