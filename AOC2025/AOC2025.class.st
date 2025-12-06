"
I have all the base methods (class side) for [Advent of Code 2025](https://adventofcode.com/2025)
"
Class {
	#name : 'AOC2025',
	#superclass : 'Object',
	#category : 'AOC2025-Main',
	#package : 'AOC2025',
	#tag : 'Main'
}

{ #category : 'AdventOfCode' }
AOC2025 class >> day01a: aString [

	| safe |
	safe := Safe new.
	aString lines do: [ :line | safe dial: line ].
	^ safe count
]

{ #category : 'AdventOfCode' }
AOC2025 class >> day01b: aString [

	| safe |
	safe := Safe new.
	aString lines do: [ :line | safe click: line ].
	^ safe count
]

{ #category : 'AdventOfCode' }
AOC2025 class >> day02a: aString [ 

	| total |
	total := 0.
	(aString splitOn: $,) do: [ : range | | parts |
		parts := range splitOn: $-.
		parts first asInteger to: parts last asInteger do: [ : n |
			n dupped ifTrue: [ total := total + n ] ] ].
	^ total
	
]

{ #category : 'AdventOfCode' }
AOC2025 class >> day02b: aString [ 

	| total |
	total := 0.
	(aString splitOn: $,) do: [ : range | | parts |
		parts := range splitOn: $-.
		parts first asInteger to: parts last asInteger do: [ : n |
			n repped ifTrue: [ total := total + n ] ] ].
	^ total
	
]

{ #category : 'AdventOfCode' }
AOC2025 class >> day03a: aString [ 

	^ (aString lines collect: #findLargestSum) sum
]

{ #category : 'AdventOfCode' }
AOC2025 class >> day03b: aString [ 

	^ (aString lines collect: #findAlternateLargestSum) sum
]

{ #category : 'AdventOfCode' }
AOC2025 class >> day04a: aString [

	| matrix count |
	matrix := Matrix rows: aString lines.
	count := 0.
	matrix allDo: [ :point |
			(matrix at: point) = $@ ifTrue: [
					| neighbours |
					neighbours := 0.
					matrix neighboursOf: point do: [ :v :p |
							$@ = v ifTrue: [ neighbours := neighbours + 1 ] ].
					neighbours < 4 ifTrue: [ count := count + 1 ] ] ].
	^ count
]

{ #category : 'AdventOfCode' }
AOC2025 class >> day04b: aString [

	| matrix count found |
	matrix := Matrix rows: aString lines.
	count := 0.
	found := true.
	[ found ] whileTrue: [
		found := false.
		matrix allDo: [ :point |
			(matrix at: point) = $@ ifTrue: [
					| neighbours |
					neighbours := 0.
					matrix neighboursOf: point do: [ :v :p |
							$@ = v ifTrue: [ neighbours := neighbours + 1 ] ].
					neighbours < 4 ifTrue: [ count := count + 1. found := true. matrix at: point put: $. ] ] ]].
	^ count
]

{ #category : 'AdventOfCode' }
AOC2025 class >> day05a: aString [

	| map adding count |
	map := RangeMap new.
	adding := true.
	count := 0.
	aString lines do: [ :line |
			adding
				ifTrue: [
						line = ''
							ifTrue: [ adding := false ]
							ifFalse: [ map add: ((line splitOn: $-) collect: #asInteger) ] ]
				ifFalse: [
				(map includes: line asInteger) ifTrue: [ count := count + 1 ] ] ].
	^ count
]

{ #category : 'AdventOfCode' }
AOC2025 class >> day05b: aString [

	| map |
	map := RangeMap new.
	aString lines do: [ :line |
		line = ''
			ifTrue: [ ^ map uniqueValues ]
			ifFalse: [ map add: ((line splitOn: $-) collect: #asInteger) ] ]

]

{ #category : 'AdventOfCode' }
AOC2025 class >> day06a: aString [

	| converted total elements operator |
	converted := aString lines collect: [ :each |
			             ((each splitOn: ' ') reject: #isEmpty) collect: [
				             :elem | elem asInteger ifNil: [ elem asSymbol ] ] ].
	total := 0.
	1 to: converted last size do: [ :column |
			elements := converted column: column.
			operator := elements last.
			total := total
			         +
			         (elements allButLast
				          inject: operator identity
				          into: operator) ].
	^ total
]

{ #category : 'AdventOfCode' }
AOC2025 class >> day06b: aString [

	| lines total operator operators data numbers |
	lines := aString lines.
	operators := lines last.
	data := lines allButLast.
	total := 0.
	numbers := OrderedCollection new.
	operators size to: 1 by: -1 do: [ :col |
			(String streamContents: [ :s |
					 data do: [ :each |
							 | c |
							 c := each at: col.
							 c isSpaceSeparator ifFalse: [ s nextPut: c ] ] ]) asInteger
				ifNotNil: [ :n | numbers add: n ].
			(operators at: col) isSpaceSeparator ifFalse: [
					operator := (operators at: col) asSymbol.
					total := total
					         + (numbers inject: operator identity into: operator).
					numbers reset ] ].
	^ total
]
