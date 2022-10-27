!classDefinition: #MarsRoverObserverTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverObserverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'n 10/26/2022 23:24:34'!
east

	^ MarsRoverHeadingEast ! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'n 10/26/2022 23:24:28'!
north

	^ MarsRoverHeadingNorth ! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'n 10/26/2022 23:24:20'!
south

	^ MarsRoverHeadingSouth ! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:06:01'!
test01MarsRoverWithNoMovementsNoLogPosition	
	| marsRover logger|
	
	logger:= Logger new.
	marsRover := MarsRover at: 1@1 heading:self north. 
	marsRover addPositionObserver: [:aPosition | self observerUpdatePosition: aPosition].
	
	self assert: 0 = logger logs size.
	
	! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:06:01'!
test02MarsRoverWithOneMovementForwardHeadingNorth	
	| marsRover logger|
	
	logger:= Logger new.
	marsRover := MarsRover at: 1@1 heading:self north. 
	marsRover addPositionObserver: [:aPosition | logger observerUpdatePosition: aPosition].
	marsRover process:'f'.
	
	self assert: (1 = logger logs size and: ((logger logs at: 1) = (1@2) )).
	
	! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:06:01'!
test03MarsRoverWithTwoMovementForwardHeadingNorth	
	| marsRover logger|
	
	logger:= Logger new.
	marsRover := MarsRover at: 1@1 heading:self north. 
	marsRover addPositionObserver:[:aPosition | logger observerUpdatePosition: aPosition].
	marsRover process:'ff'.
	
	self assert: (2 = logger logs size and: ((logger logs at: 2) = (1@3) and: ((logger logs at: 1) = (1@2)))).
	
	! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:06:01'!
test04MarsRoverWithOneMovementForwardAndOneBackWardsHeadingNorth	
	| marsRover logger|
	
	logger:= Logger new.
	marsRover := MarsRover at: 1@1 heading:self north. 
	marsRover addPositionObserver:[:aPosition | logger observerUpdatePosition: aPosition].
	marsRover process:'fb'.
	
	self assert: (2 = logger logs size and: ((logger logs at: 2) = (1@1) and: ((logger logs at: 1) = (1@2)))).
	
	! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:06:01'!
test05MarsRoverWithOneMovementForwardAndOneBackWardsHeadingNorth	
	| marsRover logger|
	
	logger:= Logger new.
	marsRover := MarsRover at: 1@1 heading:self north. 
	marsRover addPositionObserver:[:aPosition | logger observerUpdatePosition: aPosition].
	marsRover process:'fb'.
	
	self assert: (2 = logger logs size and: ((logger logs at: 2) = (1@1) and: ((logger logs at: 1) = (1@2)))).
	
	! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:06:01'!
test06MarsRoverWithOneMovementForwardALeftRotationAndOneForwardsHeadingNorth	
	| marsRover logger|
	
	logger:= Logger new.
	marsRover := MarsRover at: 1@1 heading:self north. 
	marsRover addPositionObserver:[:aPosition | logger observerUpdatePosition: aPosition].
	marsRover process:'flf'.
	
	self assert: (2 = logger logs size and: ((logger logs at: 2) = (0@2) and: ((logger logs at: 1) = (1@2)))).
	
	! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:06:01'!
test07MarsRoverWithOneMovementForwardARightRotationAndOneForwardsHeadingNorth	
	| marsRover logger|
	
	logger:= Logger new.
	marsRover := MarsRover at: 1@1 heading:self north. 
	marsRover addPositionObserver: [:aPosition | logger observerUpdatePosition: aPosition].
	marsRover process:'frf'.
	
	self assert: (2 = logger logs size and: ((logger logs at: 2) = (2@2) and: ((logger logs at: 1) = (1@2)))).
	
	! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:22:10'!
test08MarsRoverWithLeftRotationHeadingNorth
	| marsRover logger|
	
	logger:= Logger new.
	marsRover := MarsRover at: 1@1 heading:self north. 
	marsRover addHeadingObserver: [:aHeading | logger observerUpdateHeading: aHeading].
	marsRover process:'l'.
	
	self assert: (1 = logger logs size and:((logger logs at: 1) = 'Oeste' )).
	
	! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:22:16'!
test09MarsRoverWithRightRotationHeadingNorth
	| marsRover logger|
	
	logger:= Logger new.
	marsRover := MarsRover at: 1@1 heading:self north. 
	marsRover addHeadingObserver: [:aHeading | logger observerUpdateHeading: aHeading].
	
	marsRover process:'r'.
	
	self assert: (1 = logger logs size and:((logger logs at: 1) = 'Este' )).
	
	! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:06:01'!
test10MarsRoverWithNoMovementHasEmptyWindow
	| marsRover window|
	
	window:= Window new.
	marsRover := MarsRover at: 1@1 heading:self north. 
	marsRover addPositionObserver: [:aPosition | window observerUpdatePosition: aPosition].
	marsRover process:''.
	self assert: window position = ''.
	
	! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:09:13'!
test11MarsRoverWithOneMovementUpdateWindowCorrectly
	| marsRover window|
	
	window:= Window new.
	marsRover := MarsRover at: 1@1 heading:self north. 
	marsRover addPositionObserver: [:aPosition | window observerUpdatePosition: aPosition].
	marsRover process:'f'.
	self assert: window position = '1@2'.
	
	! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:22:31'!
test12MarsRoverWithOneHeadingUpdateWindowCorrectly
	| marsRover window|
	
	window:= Window new.
	marsRover := MarsRover at: 1@1 heading:self north. 
	marsRover addHeadingObserver: [:aHeading | window observerUpdateHeading: aHeading].
	marsRover process:'l'.
	self assert: window heading = 'Apuntando al Oeste'.
	
	! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:25:26'!
test13MarsRoverWithOneMovementOneHeadingUpdateWindowSimultaneouslyCorrectly
	| marsRover window|
	
	window:= Window new.
	marsRover := MarsRover at: 1@1 heading:self north. 
	marsRover addHeadingObserver: [:aHeading | window observerUpdateHeading: aHeading].
	marsRover addPositionObserver: [:aPostion | window observerUpdatePosition: aPostion].
	marsRover process:'f'.
	self assert: (window heading = '' and:( window position = '1@2' )).
	marsRover process:'l'.
	self assert: (window heading = 'Apuntando al Oeste' and:( window position = '1@2' )).
	
	! !

!MarsRoverObserverTest methodsFor: 'as yet unclassified' stamp: 'n 10/26/2022 23:24:42'!
west

	^ MarsRoverHeadingWest ! !


!classDefinition: #MarsRoverTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:21:23'!
test01DoesNotMoveWhenNoCommand

	self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: '' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:12'!
test02IsAtFailsForDifferentPosition

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@2 heading: self north)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:31'!
test03IsAtFailsForDifferentHeading

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@1 heading: self south)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:17'!
test04IncrementsYAfterMovingForwardWhenHeadingNorth

	self 
		assertIsAt: 1@3 
		heading: self north 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:11'!
test06DecrementsYAfterMovingBackwardsWhenHeadingNorth

	self 
		assertIsAt: 1@1 
		heading: self north 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:59'!
test07PointToEashAfterRotatingRightWhenHeadingNorth

	self 
		assertIsAt: 1@2 
		heading: self east 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:51'!
test08PointsToWestAfterRotatingLeftWhenPointingNorth

	self 
		assertIsAt: 1@2 
		heading: self west 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:45'!
test09DoesNotProcessInvalidCommand

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: self north.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: self north) ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:39'!
test10CanProcessMoreThanOneCommand

	self 
		assertIsAt: 1@4 
		heading: self north 
		afterProcessing: 'ff' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:31'!
test11IncrementsXAfterMovingForwareWhenHeadingEast

	self 
		assertIsAt: 2@2 
		heading: self east 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:19'!
test12DecrementsXAfterMovingBackwardWhenHeadingEast

	self 
		assertIsAt: 0@2 
		heading: self east 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:14'!
test13PointsToSouthAfterRotatingRightWhenHeadingEast

		self 
		assertIsAt: 1@2 
		heading: self south 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:05'!
test14PointsToNorthAfterRotatingLeftWhenPointingEast

		self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:00'!
test15ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingSouth

	self 
		assertIsAt: 1@1 
		heading: self west 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self south 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:52'!
test16ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingWest

	self 
		assertIsAt: 0@2 
		heading: self north 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self west 
! !


!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:31'!
east

	^ MarsRoverHeadingEast ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:38'!
north

	^ MarsRoverHeadingNorth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:45'!
south

	^ MarsRoverHeadingSouth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:54'!
west

	^ MarsRoverHeadingWest ! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'HAW 10/7/2021 20:20:47'!
assertIsAt: newPosition heading: newHeadingType afterProcessing: commands whenStartingAt: startPosition heading: startHeadingType

	| marsRover |
	
	marsRover := MarsRover at: startPosition heading: startHeadingType. 
	
	marsRover process: commands.
	
	self assert: (marsRover isAt: newPosition heading: newHeadingType)! !


!classDefinition: #Logger category: 'MarsRover-WithHeading'!
Object subclass: #Logger
	instanceVariableNames: 'logs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!Logger methodsFor: 'as yet unclassified' stamp: 'n 10/26/2022 23:48:42'!
initialize
	logs:= OrderedCollection new.! !

!Logger methodsFor: 'as yet unclassified' stamp: 'n 10/26/2022 23:48:29'!
logs
	^logs.! !

!Logger methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:19:49'!
observerUpdateHeading: aCardinalDirection
	logs add:aCardinalDirection direction! !

!Logger methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:19:57'!
observerUpdatePosition: aPosition
	logs add:aPosition! !


!classDefinition: #MarsRover category: 'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head positionObserver headingObserver'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'n 10/27/2022 00:20:52'!
initializeAt: aPosition heading: aHeadingType

	position := aPosition.
	head := aHeadingType for: self.
	positionObserver:= OrderedCollection  new.
	headingObserver:= OrderedCollection  new.
	! !


!MarsRover methodsFor: 'heading' stamp: 'n 10/27/2022 00:20:12'!
addHeadingObserver: aClousure
	headingObserver add:aClousure! !

!MarsRover methodsFor: 'heading' stamp: 'n 10/27/2022 00:20:08'!
addPositionObserver: aClousure
	positionObserver add: aClousure! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:17:02'!
headEast
	
	head := MarsRoverHeadingEast for: self! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:17:12'!
headNorth
	
	head := MarsRoverHeadingNorth for: self ! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:17:17'!
headSouth
	
	head := MarsRoverHeadingSouth for: self! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:17:24'!
headWest
	
	head := MarsRoverHeadingWest for: self ! !

!MarsRover methodsFor: 'heading' stamp: 'n 10/27/2022 01:17:02'!
rotateLeft
	
	head rotateLeft.
	headingObserver do: [ :aClousure| aClousure value: head].! !

!MarsRover methodsFor: 'heading' stamp: 'n 10/27/2022 01:17:08'!
rotateRight
	
	head rotateRight.
	headingObserver do: [ :aClousure| aClousure value: head].! !


!MarsRover methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:16:32'!
isAt: aPosition heading: aHeadingType

	^position = aPosition and: [ head isHeading: aHeadingType ]! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:51'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:19'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:51'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:21'!
isRotateRightCommand: aCommand

	^aCommand = $r! !


!MarsRover methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	head moveBackward! !

!MarsRover methodsFor: 'moving' stamp: 'n 10/27/2022 00:23:48'!
moveEast
	
	position := position + (1@0).
	positionObserver do: [ :aClousure| aClousure value: position]! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	head moveForward! !

!MarsRover methodsFor: 'moving' stamp: 'n 10/27/2022 00:23:35'!
moveNorth
	
	position := position + (0@1).
	positionObserver do: [ :aClousure| aClousure value: position]! !

!MarsRover methodsFor: 'moving' stamp: 'n 10/27/2022 00:23:40'!
moveSouth
	
	position := position + (0@-1).
	positionObserver do: [ :aClousure| aClousure value: position]! !

!MarsRover methodsFor: 'moving' stamp: 'n 10/27/2022 00:23:44'!
moveWest
	
	position := position + (-1@0).
	positionObserver do: [ :aClousure| aClousure value: position]
	! !


!MarsRover methodsFor: 'command processing' stamp: 'HAW 6/30/2018 19:48:26'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'command processing' stamp: 'HAW 8/22/2019 12:08:50'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommand.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-WithHeading'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:10:30'!
at: aPosition heading: aHeadingType
	
	^self new initializeAt: aPosition heading: aHeadingType! !


!classDefinition: #MarsRoverHeading category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:15:38'!
isHeading: aHeadingType

	^self isKindOf: aHeadingType ! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'initialization' stamp: 'HAW 10/7/2021 20:11:59'!
initializeFor: aMarsRover 
	
	marsRover := aMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: 'MarsRover-WithHeading'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:11:35'!
for: aMarsRover 
	
	^self new initializeFor: aMarsRover ! !


!classDefinition: #MarsRoverHeadingEast category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveWest! !

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveEast! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'n 10/27/2022 01:21:38'!
direction
	^'Este'! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headSouth! !


!classDefinition: #MarsRoverHeadingNorth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveSouth! !

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveNorth! !


!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'n 10/27/2022 01:21:28'!
direction
	^'Norte'! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headWest! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headEast! !


!classDefinition: #MarsRoverHeadingSouth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveNorth! !

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveSouth! !


!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'n 10/27/2022 01:21:05'!
direction
	^'Sur'! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headEast! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headWest! !


!classDefinition: #MarsRoverHeadingWest category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	^marsRover moveEast! !

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveWest! !


!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'n 10/27/2022 01:20:54'!
direction
	^'Oeste'! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headSouth! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headNorth! !


!classDefinition: #Window category: 'MarsRover-WithHeading'!
Object subclass: #Window
	instanceVariableNames: 'position heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!Window methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:07:17'!
heading
	^heading! !

!Window methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:13:45'!
initialize
	position:=''.
	heading:=''! !

!Window methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:20:40'!
observerUpdateHeading: aCardinalDirection
	heading:= 'Apuntando al ', aCardinalDirection direction.
	
! !

!Window methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 01:06:01'!
observerUpdatePosition: aPosition
	position:=  (aPosition x asString),'@',(aPosition y asString).! !

!Window methodsFor: 'as yet unclassified' stamp: 'n 10/27/2022 00:55:22'!
position
	^position! !
