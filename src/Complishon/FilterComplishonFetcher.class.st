Class {
	#name : #FilterComplishonFetcher,
	#superclass : #ComplishonFetcher,
	#instVars : [
		'complishon',
		'filterBlock'
	],
	#category : #'Complishon-Core'
}

{ #category : #accessing }
FilterComplishonFetcher >> complishon: aComplishonToFilter [ 

	complishon := aComplishonToFilter
]

{ #category : #accessing }
FilterComplishonFetcher >> entriesInContext: aContext do: aBlockClosure [
	
	complishon context: aContext.
	complishon entriesInContext: aContext do: [ :each |
		(filterBlock value: each)
			ifTrue: [ aBlockClosure value: each ] ]
]

{ #category : #accessing }
FilterComplishonFetcher >> filterBlock: aBlockClosure [ 
	
	filterBlock := aBlockClosure
]

{ #category : #filtering }
FilterComplishonFetcher >> narrowFilterBlock: aBlock [

	self filterBlock: aBlock
]

{ #category : #resetting }
FilterComplishonFetcher >> reset [
	
	super reset.
	complishon reset.
]

{ #category : #filtering }
FilterComplishonFetcher >> select: aBlockClosure [

	"Do not filter over a filter.
	Instead, create a new filter over the original fetcher"
	
	^ complishon select: aBlockClosure
]

{ #category : #filtering }
FilterComplishonFetcher >> withoutFilter [
	
	^ complishon
]
