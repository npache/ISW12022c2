!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/7/2022 15:43:49'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self executing: [ customerBook addCustomerNamed: 'John Lennon' ] shouldNotTakeMoreThan: 50 * millisecond! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/7/2022 15:44:10'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	
	self executing: [ customerBook removeCustomerNamed: paulMcCartney ] shouldNotTakeMoreThan: 100 * millisecond ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/7/2022 15:44:58'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self
		ifExecuting: [ customerBook addCustomerNamed: '' ]
		failsWithError: Error 
		thenExecute: [ :anError | 
						self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
						self assert: customerBook isEmpty
						]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/7/2022 15:58:15'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.

	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.

	self
		ifExecuting: [ customerBook removeCustomerNamed: 'Paul McCartney' ] 
		failsWithError: NotFound 
		thenExecute: [ :anError | 
						self checkIf: customerBook numberOfCustomersIs: 1.
						self checkIf: customerBook includesCustomerNamed: johnLennon
						]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/7/2022 19:24:01'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	
	paulMcCartney := 'Paul McCartney'.
	
	self 
		executing: [ self addCustomer: paulMcCartney andSuspendCustomer: paulMcCartney in: customerBook ]
		shouldPass:
			[ self
				checkIf: customerBook
				numberOfActiveCustomersIs: 0
				andNumberOfSuspendedCustomersIs: 1
				andNumberOfCustomersIs: 1.
			self assert: (customerBook includesCustomerNamed: paulMcCartney).
			]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/7/2022 19:24:24'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	
	paulMcCartney := 'Paul McCartney'.
		
	self
		executing:
			[ self addCustomer: paulMcCartney andSuspendCustomer: paulMcCartney in: customerBook.
			customerBook removeCustomerNamed: paulMcCartney
			]
		shouldPass:
			[ self
				checkIf: customerBook 
				numberOfActiveCustomersIs: 0
				andNumberOfSuspendedCustomersIs: 0
				andNumberOfCustomersIs: 0.
			self deny: (customerBook includesCustomerNamed: paulMcCartney)
			]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/7/2022 16:15:18'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	
	johnLennon := 'John Lennon'.
	
	self
		ifExecuting: [ self addCustomer: johnLennon andSuspendCustomer: 'George Harrison' in: customerBook ]
		failsWithError: CantSuspend
		thenExecute:
			[ :anError | 
				self checkIf: customerBook numberOfCustomersIs: 1.
				self checkIf: customerBook includesCustomerNamed: johnLennon
			]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'cg 9/7/2022 19:24:44'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	
	johnLennon := 'John Lennon'.
	
	self
		ifExecuting:
			[ self addCustomer: johnLennon andSuspendCustomer: johnLennon in: customerBook.
			customerBook suspendCustomerNamed: johnLennon
			]
		failsWithError: CantSuspend
		thenExecute:
			[ :anError |
				self checkIf: customerBook numberOfCustomersIs: 1.
				self checkIf: customerBook includesCustomerNamed: johnLennon
			]! !


!CustomerBookTest methodsFor: 'customerBookOperations' stamp: 'cg 9/7/2022 16:00:15'!
addCustomer: aCustomer andSuspendCustomer: anotherCustomer in: aCustomerBook

	aCustomerBook addCustomerNamed: aCustomer.
	aCustomerBook suspendCustomerNamed: anotherCustomer! !


!CustomerBookTest methodsFor: 'executionChecks' stamp: 'cg 9/5/2022 23:41:25'!
executing: aClosure shouldNotTakeMoreThan: anAmountOfTimeInMilliseconds

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < anAmountOfTimeInMilliseconds 
! !

!CustomerBookTest methodsFor: 'executionChecks' stamp: 'cg 9/6/2022 00:15:33'!
executing: aClosure shouldPass: conditions

	aClosure value.
	conditions value! !

!CustomerBookTest methodsFor: 'executionChecks' stamp: 'cg 9/6/2022 10:23:50'!
ifExecuting: aClosure failsWithError: error thenExecute: anotherClosure

	[ aClosure value. self fail ]
		on: error
		do: anotherClosure! !


!CustomerBookTest methodsFor: 'customerBookChecks' stamp: 'cg 9/7/2022 15:47:03'!
checkIf: aCustomerBook includesCustomerNamed: aName

	self assert: (aCustomerBook includesCustomerNamed: aName)! !

!CustomerBookTest methodsFor: 'customerBookChecks' stamp: 'cg 9/7/2022 15:48:27'!
checkIf: aCustomerBook numberOfActiveCustomersIs: aNumber

	self assert: aNumber equals: aCustomerBook numberOfActiveCustomers! !

!CustomerBookTest methodsFor: 'customerBookChecks' stamp: 'cg 9/7/2022 15:54:34'!
checkIf: aCustomerBook
numberOfActiveCustomersIs: aNumberOfActiveCustomers
andNumberOfSuspendedCustomersIs: aNumberOfSuspendedCustomers
andNumberOfCustomersIs: aNumberOfCustomers

	self checkIf: aCustomerBook numberOfActiveCustomersIs: aNumberOfActiveCustomers.	
	self checkIf: aCustomerBook numberOfSuspendedCustomersIs: aNumberOfSuspendedCustomers.	
	self checkIf: aCustomerBook numberOfCustomersIs: aNumberOfCustomers.	! !

!CustomerBookTest methodsFor: 'customerBookChecks' stamp: 'cg 9/7/2022 15:50:09'!
checkIf: aCustomerBook numberOfCustomersIs: aNumber

	self assert: aNumber equals: aCustomerBook numberOfCustomers! !

!CustomerBookTest methodsFor: 'customerBookChecks' stamp: 'cg 9/7/2022 15:49:02'!
checkIf: aCustomerBook numberOfSuspendedCustomersIs: aNumber

	self assert: aNumber equals: aCustomerBook numberOfSuspendedCustomers! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'cg 9/7/2022 19:25:54'!
initialize

	active := OrderedCollection new.
	suspended := OrderedCollection new.! !


!CustomerBook methodsFor: 'find & remove' stamp: 'NP 9/7/2022 12:18:04'!
findActiveCustomer: aName
	^active findFirst:[:each| each=aName].
! !

!CustomerBook methodsFor: 'find & remove' stamp: 'NP 9/7/2022 12:42:41'!
findAndRemoveActiveCustomer: aName
 	|index|
	index:= self findActiveCustomer: aName.
	(index =0) ifFalse:[
		active removeAt:index.
		^aName.
		].
	^nil
	
	


! !

!CustomerBook methodsFor: 'find & remove' stamp: 'NP 9/7/2022 12:42:22'!
findAndRemoveSuspendedCustomer: aName
 	|index|
	index:= self findSuspendedCustomer: aName.
	(index =0) ifFalse:[
		suspended removeAt:index.
		^aName.
		].
	^nil
	
	


! !

!CustomerBook methodsFor: 'find & remove' stamp: 'NP 9/7/2022 12:10:14'!
findSuspendedCustomer: aName
	
	^suspended findFirst:[:each| each=aName]
! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'cg 9/7/2022 19:28:44'!
removeCustomerNamed: aName 
 
	| activeName suspendedName |
	
	activeName := self findAndRemoveActiveCustomer: aName.
	activeName ifNotNil: [ ^ activeName ].

	suspendedName := self findAndRemoveSuspendedCustomer: aName.	
	suspendedName ifNotNil: [ ^ suspendedName ].

	^ NotFound signal! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/11/2022 07:18:12'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/11/2022 07:18:16'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
