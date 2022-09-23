!classDefinition: #CrewTest category: 'ISW1-2022-2C-1erParcial'!
TestCase subclass: #CrewTest
	instanceVariableNames: 'crewPosition treePosition mapSize islandWithDigAt2At2 mapWithDigAt2At2 crewOfIslandWithDigAt2At2 islandWithDigAt3At3 mapWithDigAt3At3 crewOfIslandDigAt3At3'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!CrewTest methodsFor: 'tests' stamp: 'np 9/22/2022 19:25:05'!
createCrewAt: aIsland with:aMap andCrewPositionsAt: crewPositions.

		^Crew at: aIsland 
		composedBy: (OrderedCollection with: (Corsario with: aMap) with: Filibustero new with: Bucanero new)
		at: crewPositions.! !

!CrewTest methodsFor: 'tests' stamp: 'np 9/22/2022 19:20:50'!
createIslandWithSize: aSize andTreesAt: treesPosition andDigsAt: digsPosition 
 	^Island sized: aSize treesAt: (OrderedCollection with: treesPosition) digsAt: (OrderedCollection with:digsPosition).
	
	! !

!CrewTest methodsFor: 'tests' stamp: 'np 9/22/2022 19:51:20'!
denyThat: anIsland hasCreatAt:aPositionWithoutCrew andAssertThatHasCrewAt: aPositionWithCrew
	self deny: (anIsland hasCrewAt: aPositionWithoutCrew).
	self assert: (anIsland hasCrewAt: aPositionWithCrew)! !

!CrewTest methodsFor: 'tests' stamp: 'np 9/22/2022 19:36:17'!
move: aCrew to: aPos andBuryTreasureAt:  aPosToBury
	aCrew moveTo: aPos.
	aCrew buryTreasureAt: aPosToBury.

! !

!CrewTest methodsFor: 'tests' stamp: 'np 9/22/2022 20:18:25'!
setUp
	
	crewPosition := 1@1.
	treePosition := 1@2.
	mapSize:= 3@3.
	islandWithDigAt3At3 := self createIslandWithSize: mapSize andTreesAt: treePosition andDigsAt: 3@3. 
	mapWithDigAt3At3 := Map of: islandWithDigAt3At3 crewStartsAt: crewPosition.
	crewOfIslandDigAt3At3 := self  createCrewAt: islandWithDigAt3At3 with: mapWithDigAt3At3 andCrewPositionsAt: crewPosition.
	
	islandWithDigAt2At2 := self createIslandWithSize: mapSize andTreesAt: treePosition andDigsAt: 2@2. 
	mapWithDigAt2At2 := Map of: islandWithDigAt2At2 crewStartsAt: crewPosition.
	
	crewOfIslandWithDigAt2At2 := self  createCrewAt: islandWithDigAt2At2 with: mapWithDigAt2At2 andCrewPositionsAt: crewPosition.
! !

!CrewTest methodsFor: 'tests' stamp: 'np 9/22/2022 20:18:25'!
test01MovingCrewToTreePlaceDoesNotMove


	crewOfIslandDigAt3At3 moveTo: treePosition.
	self denyThat: islandWithDigAt3At3 hasCreatAt:treePosition andAssertThatHasCrewAt: crewPosition.
	! !

!CrewTest methodsFor: 'tests' stamp: 'np 9/22/2022 20:18:25'!
test02MovingCrewToTreePlaceFilibusteroRemovesTree

		
	self deny: (islandWithDigAt3At3 isEmptyAt: treePosition).
				
	crewOfIslandDigAt3At3 moveTo: treePosition.

	self assert: (islandWithDigAt3At3 isEmptyAt: treePosition).
	
	self denyThat: islandWithDigAt3At3 hasCreatAt:treePosition andAssertThatHasCrewAt: crewPosition.
	! !

!CrewTest methodsFor: 'tests' stamp: 'np 9/22/2022 20:18:25'!
test03MovingCrewToFreePlace

	|  nextPosition |
	
	nextPosition := 2@1.
	
	self assert: (islandWithDigAt3At3 isEmptyAt: nextPosition).
	
	crewOfIslandDigAt3At3 moveTo: nextPosition.

self denyThat: islandWithDigAt3At3 hasCreatAt:crewPosition andAssertThatHasCrewAt: nextPosition.
	! !

!CrewTest methodsFor: 'tests' stamp: 'np 9/22/2022 20:18:25'!
test04MovingCrewToFreePlaceCorsarioWritesDirectionInMap

	|nextPosition|
	
	nextPosition := 2@1.
	
	self assert: mapWithDigAt3At3 isEmpty.

	crewOfIslandDigAt3At3 moveTo: nextPosition.

	self assert: mapWithDigAt3At3 stepsSize equals: 1. 
	self assert: mapWithDigAt3At3 lastPosition equals: nextPosition.
! !

!CrewTest methodsFor: 'tests' stamp: 'np 9/22/2022 20:18:09'!
test05CrewCannotBuryTreasureIfBucaneroCannotDig
	
	crewOfIslandWithDigAt2At2  moveTo: 2@1.
	
	self 
		should: [ crewOfIslandWithDigAt2At2  buryTreasureAt: 3@1 ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :error | 
			self assert: error messageText equals: Bucanero cannotDigErrorDescription.
			self deny: mapWithDigAt2At2  hasTreasureMark ]
			
	
	
	
! !

!CrewTest methodsFor: 'tests' stamp: 'np 9/22/2022 20:18:09'!
test06CrewCanBuryTreasureIfBucaneroCanDig

	

	
	self move: crewOfIslandWithDigAt2At2  to: 2@1 andBuryTreasureAt:  2@2.

	
	self assert: mapWithDigAt2At2  hasTreasureMark.
	
			
	
	
	
! !

!CrewTest methodsFor: 'tests' stamp: 'np 9/22/2022 20:18:09'!
test07CaptainCanUseMap

	|pirate|
	crewOfIslandWithDigAt2At2  := self  createCrewAt: islandWithDigAt2At2  with: mapWithDigAt2At2  andCrewPositionsAt: crewPosition.
	
	self move: crewOfIslandWithDigAt2At2  to: 2@1 andBuryTreasureAt:  2@2.


	pirate := Bucanero new.
	pirate aCaptainIWasMeantToBe.
	
	self assert: (pirate searchTreasureIn: islandWithDigAt2At2  with: mapWithDigAt2At2 )! !

!CrewTest methodsFor: 'tests' stamp: 'np 9/22/2022 20:18:09'!
test08SimplePirateCannotUseMap

	|pirate |
	
	
	self move: crewOfIslandWithDigAt2At2 to: 2@1 andBuryTreasureAt:  2@2.


	pirate := Bucanero new.
	
	self 
		should: [ pirate searchTreasureIn: islandWithDigAt2At2  with: mapWithDigAt2At2  ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: 'I am a simple pirate!!'
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CrewTest class' category: 'ISW1-2022-2C-1erParcial'!
CrewTest class
	instanceVariableNames: 'setUp treePosition'!


!classDefinition: #Crew category: 'ISW1-2022-2C-1erParcial'!
Object subclass: #Crew
	instanceVariableNames: 'island pirates'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Crew methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 18:50:55'!
buryTreasureAt: aPosition

	pirates do: [ :aPirate | aPirate buryTreasureAt: aPosition in: island].
	! !

!Crew methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 22:53:00'!
initializeWith: anIsland pirates: aPirates at: aPosition

	island := anIsland.
	pirates := aPirates.
	
	island crewAt: aPosition.! !

!Crew methodsFor: 'as yet unclassified' stamp: 'n 9/22/2022 18:12:25'!
moveTo: aPosition

	| acc  |
	
	acc := true.
	
	
	pirates do:[ :pirate |acc:=acc & ( pirate canMoveTo: aPosition in: island)].
	
	"nos movemos si todos pueden moverse"
	acc ifTrue: [ island crewAt: aPosition ].
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Crew class' category: 'ISW1-2022-2C-1erParcial'!
Crew class
	instanceVariableNames: ''!

!Crew class methodsFor: 'as yet unclassified' stamp: 'HAW 9/18/2022 19:21:29'!
at: anIsland composedBy: aCrew at: aPosition

	^ self new initializeWith: anIsland pirates: aCrew at: aPosition ! !


!classDefinition: #Island category: 'ISW1-2022-2C-1erParcial'!
Object subclass: #Island
	instanceVariableNames: 'boardSize treesAt digsAt crewAt treasureAt'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Island methodsFor: 'as yet unclassified' stamp: 'n 9/22/2022 17:37:35'!
clearTerrainAt: aPosition

	^treesAt remove: (treesAt detect:[:pos|(aPosition = pos) ]).

	
! !

!Island methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 15:37:10'!
crewAt: aPosition

	crewAt := aPosition.! !

!Island methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 20:32:15'!
digsAt
	^digsAt! !

!Island methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 15:45:56'!
hasCrewAt: aPosition

	^ crewAt = aPosition.! !

!Island methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 15:23:00'!
initializeSized: size treesAt: treesPositions digsAt: digsPositions

	boardSize := size.
	treesAt := treesPositions.
	digsAt := digsPositions.
! !

!Island methodsFor: 'as yet unclassified' stamp: 'n 9/22/2022 17:35:43'!
isEmptyAt: aPosition
	
	^ (treesAt anySatisfy:[:pos | (aPosition = pos)]) not.! !

!Island methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 15:27:44'!
receiveTreasureAt: aPosition

	treasureAt := aPosition.! !

!Island methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 20:39:31'!
terrainAt: aPosition
	
	^Terrain terrainTypeAt: aPosition in: self. 
	
	
! !

!Island methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 20:32:08'!
treesAt
	^treesAt! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Island class' category: 'ISW1-2022-2C-1erParcial'!
Island class
	instanceVariableNames: ''!

!Island class methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 15:46:50'!
sized: size treesAt: treesPositions digsAt: digsPositions

	^ self new initializeSized: size treesAt: treesPositions digsAt: digsPositions 
! !


!classDefinition: #Map category: 'ISW1-2022-2C-1erParcial'!
Object subclass: #Map
	instanceVariableNames: 'island startPosition steps treasureMarkPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Map methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 19:00:56'!
hasTreasureMark

	^ treasureMarkPosition isNil not.
	
	! !

!Map methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 16:30:31'!
initializeWith: anIsland crewStartsAt: aPosition

	island := anIsland.
	startPosition := aPosition.
	steps := OrderedCollection new.
	
	! !

!Map methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 16:43:52'!
isEmpty

	^ steps isEmpty
	
	! !

!Map methodsFor: 'as yet unclassified' stamp: 'n 9/22/2022 17:26:59'!
lastPosition
	
	
	
	^steps inject: startPosition into:[:aPosition :aStep| aStep+aPosition ].
	
	! !

!Map methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 16:39:01'!
nextStep: step

	^ steps add: step.
	
	! !

!Map methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 16:32:23'!
stepsSize

	^ steps size.
	
	! !

!Map methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 19:01:06'!
treasureMarkAt: aPosition

	treasureMarkPosition := aPosition.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Map class' category: 'ISW1-2022-2C-1erParcial'!
Map class
	instanceVariableNames: ''!

!Map class methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 16:28:38'!
of: island crewStartsAt: aPosition.

	^ self new initializeWith: island crewStartsAt: aPosition.! !


!classDefinition: #Pirate category: 'ISW1-2022-2C-1erParcial'!
Object subclass: #Pirate
	instanceVariableNames: 'rank'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Pirate methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 18:38:53'!
aCaptainIWasMeantToBe

	rank := Captain new.! !

!Pirate methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 18:50:55'!
buryTreasureAt: aPosition in: island
	self subclassResponsibility ! !

!Pirate methodsFor: 'as yet unclassified' stamp: 'n 9/22/2022 17:56:46'!
canMoveTo: aPosition in: island
	self subclassResponsibility ! !

!Pirate methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 20:04:15'!
initialize
	rank:= SimplePirate new.! !

!Pirate methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 18:47:55'!
searchTreasureIn: island with: map
	"No borro los parametros porque asumo que pueden servir para la implementacion cuando rank=Captain. Pero no se usan asi que podria borrarlos tranquilamente"
	^rank isAbleToSearchTreasureIn: island with: map.! !


!classDefinition: #Bucanero category: 'ISW1-2022-2C-1erParcial'!
Pirate subclass: #Bucanero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Bucanero methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:12:04'!
buryTreasureAt: aPosition in: island
	
	^(island terrainAt: aPosition) bucaneroBuryIn: island at:aPosition by: self.! !

!Bucanero methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:02:15'!
canMoveTo: aPosition in: island
	
	^(island terrainAt: aPosition) bucaneroMoveIn: island at:aPosition.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bucanero class' category: 'ISW1-2022-2C-1erParcial'!
Bucanero class
	instanceVariableNames: ''!

!Bucanero class methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 17:12:39'!
cannotDigErrorDescription

	^ 'Arrgh!! I cannot dig this type of terrain!!'.! !


!classDefinition: #Corsario category: 'ISW1-2022-2C-1erParcial'!
Pirate subclass: #Corsario
	instanceVariableNames: 'map'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Corsario methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:11:15'!
buryTreasureAt: aPosition in: island

	^(island terrainAt: aPosition) corsarioBuryIn: island at:aPosition by: self! !

!Corsario methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:02:34'!
canMoveTo: aPosition in: island
	
	^(island terrainAt: aPosition) corsarioMoveIn: island at:aPosition by: self.! !

!Corsario methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 22:43:57'!
drawDirectionTo: aPosition

	map nextStep: aPosition - (map lastPosition).
	
! !

!Corsario methodsFor: 'as yet unclassified' stamp: 'FRT 9/17/2022 19:01:22'!
drawTreasureMarkAt: aPosition

	map nextStep: aPosition - map lastPosition.
	map treasureMarkAt: aPosition.
	
! !

!Corsario methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 20:01:45'!
initializeWith: aMap

	map := aMap! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Corsario class' category: 'ISW1-2022-2C-1erParcial'!
Corsario class
	instanceVariableNames: ''!

!Corsario class methodsFor: 'as yet unclassified' stamp: 'FRT 9/15/2022 21:46:08'!
with: aMap

	^ self new initializeWith: aMap.! !


!classDefinition: #Filibustero category: 'ISW1-2022-2C-1erParcial'!
Pirate subclass: #Filibustero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Filibustero methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 18:50:55'!
buryTreasureAt: aPosition in: island! !

!Filibustero methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:02:46'!
canMoveTo: aPosition in: island
	
	^(island terrainAt: aPosition) filibusteroMoveIn: island at:aPosition.
	! !


!classDefinition: #Rank category: 'ISW1-2022-2C-1erParcial'!
Object subclass: #Rank
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Rank methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 18:46:56'!
isAbleToSearchTreasureIn: island with: map
	self subclassResponsibility ! !


!classDefinition: #Captain category: 'ISW1-2022-2C-1erParcial'!
Rank subclass: #Captain
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Captain methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 18:47:02'!
isAbleToSearchTreasureIn: island with: map
	 ^ true "Aye, Aye!! La implementación está fuera del scope del parcial."! !


!classDefinition: #SimplePirate category: 'ISW1-2022-2C-1erParcial'!
Rank subclass: #SimplePirate
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!SimplePirate methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 18:47:06'!
isAbleToSearchTreasureIn: island with: map
	self error: 'I am a simple pirate!!'! !


!classDefinition: #Terrain category: 'ISW1-2022-2C-1erParcial'!
Object subclass: #Terrain
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Terrain methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:11:37'!
bucaneroBuryIn: island at:aPosition by: aPirate
	self subclassResponsibility 
	! !

!Terrain methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:01:48'!
bucaneroMoveIn: island at:aPosition.
	
	self subclassResponsibility ! !

!Terrain methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:05:06'!
corsarioBuryIn: island at:aPosition by: aPirate
	self subclassResponsibility ! !

!Terrain methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:01:34'!
corsarioMoveIn: island at:aPosition by: aPirate	
	self subclassResponsibility ! !

!Terrain methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:01:16'!
filibusteroMoveIn: island at:aPosition
	self subclassResponsibility 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Terrain class' category: 'ISW1-2022-2C-1erParcial'!
Terrain class
	instanceVariableNames: ''!

!Terrain class methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 20:29:25'!
canHandle: aPosition in: anIsland

	self subclassResponsibility ! !

!Terrain class methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 20:53:16'!
terrainTypeAt: aPosition in: anIsland
	^(self subclasses detect: [:aTerrainClass | aTerrainClass canHandle: aPosition in: anIsland]) new.! !


!classDefinition: #Diggable category: 'ISW1-2022-2C-1erParcial'!
Terrain subclass: #Diggable
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Diggable methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:12:17'!
bucaneroBuryIn: island at:aPosition by: aPirate
	island receiveTreasureAt: aPosition 
	! !

!Diggable methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:01:48'!
bucaneroMoveIn: island at:aPosition.
	^true	! !

!Diggable methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:05:35'!
corsarioBuryIn: island at:aPosition by: aPirate
	aPirate drawTreasureMarkAt: aPosition ! !

!Diggable methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:01:34'!
corsarioMoveIn: island at:aPosition by: aPirate	
	^true! !

!Diggable methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:01:16'!
filibusteroMoveIn: island at:aPosition
	^true
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Diggable class' category: 'ISW1-2022-2C-1erParcial'!
Diggable class
	instanceVariableNames: ''!

!Diggable class methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 20:37:28'!
canHandle: aPosition in: anIsland
	^ anIsland digsAt includes: aPosition! !


!classDefinition: #Empty category: 'ISW1-2022-2C-1erParcial'!
Terrain subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Empty methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:11:49'!
bucaneroBuryIn: island at:aPosition by: aPirate
	self subclassResponsibility 
	! !

!Empty methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:01:48'!
bucaneroMoveIn: island at:aPosition.
	^true	! !

!Empty methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:12:28'!
corsarioBuryIn: island at:aPosition by: aPirate
	 self error: 'Arrgh!! I cannot dig this type of terrain!!'! !

!Empty methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:01:34'!
corsarioMoveIn: island at:aPosition by: aPirate	
	
		aPirate drawDirectionTo: aPosition.
		^true
	! !

!Empty methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:01:16'!
filibusteroMoveIn: island at:aPosition.
	^true	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Empty class' category: 'ISW1-2022-2C-1erParcial'!
Empty class
	instanceVariableNames: ''!

!Empty class methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 20:38:09'!
canHandle: aPosition in: anIsland

	^ ((anIsland digsAt includes: aPosition )not) and: ((anIsland treesAt includes: aPosition )not) ! !


!classDefinition: #Tree category: 'ISW1-2022-2C-1erParcial'!
Terrain subclass: #Tree
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ISW1-2022-2C-1erParcial'!

!Tree methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:12:47'!
bucaneroBuryIn: island at:aPosition by: aPirate
	self error: 'Arrgh!! I cannot dig this type of terrain!!' ! !

!Tree methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:01:48'!
bucaneroMoveIn: island at:aPosition
	 ^false
	! !

!Tree methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:10:51'!
corsarioBuryIn: island at:aPosition by: aPirate
	! !

!Tree methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:01:34'!
corsarioMoveIn: island at:aPosition by: aPirate	

	^false 

	! !

!Tree methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 21:01:16'!
filibusteroMoveIn: island at:aPosition

		island clearTerrainAt: aPosition.
		^false
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Tree class' category: 'ISW1-2022-2C-1erParcial'!
Tree class
	instanceVariableNames: ''!

!Tree class methodsFor: 'as yet unclassified' stamp: 'np 9/22/2022 20:37:44'!
canHandle: aPosition in: anIsland

	^anIsland treesAt includes: aPosition! !
