"
I am a 2-dimensional matrix, used in day 4
"
Class {
	#name : 'Matrix',
	#superclass : 'Object',
	#instVars : [
		'rows'
	],
	#category : 'AOC2025-Support',
	#package : 'AOC2025',
	#tag : 'Support'
}

{ #category : 'instance creation' }
Matrix class >> rows: aCollection [ 
	^ self new rows: aCollection; yourself
]

{ #category : 'enumerating' }
Matrix >> allDo: aBlock [ 
	rows withIndexDo: [ : collection : row |
		1 to: collection size do: [ : col | aBlock value: row @ col] ]
]

{ #category : 'accessing' }
Matrix >> at: aPoint [

	^ (rows at: aPoint x) at: aPoint y
]

{ #category : 'accessing' }
Matrix >> at: aPoint put: value [

	(rows at: aPoint x) at: aPoint y put: value
]

{ #category : 'enumerating' }
Matrix >> neighboursOf: aPoint do: aBlock [

	-1 to: 1 do: [ :xdelta |
			| row |
			row := aPoint x + xdelta.
			(row between: 1 and: rows size) ifTrue: [
					| theRow |
					theRow := rows at: row.
					-1 to: 1 do: [ :ydelta |
							| col |
							(xdelta ~= 0 or: [ ydelta ~= 0 ]) ifTrue: [
									col := aPoint y + ydelta.
									(col between: 1 and: theRow size) ifTrue: [
										aBlock value: (theRow at: col) value: row @ col] ] ] ] ]
]

{ #category : 'accessing' }
Matrix >> rows: aCollection [ 
	rows := aCollection
]
