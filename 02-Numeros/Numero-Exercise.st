!classDefinition: #NumeroTest category: 'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 4/15/2021 16:45:35'!
test27EnteroSubstractsEnteroCorrectly

	self assert: four - one equals: three! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:02'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:09'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de número inválido!!!!!!'! !


!classDefinition: #Entero category: 'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations' stamp: 'cg 9/13/2022 11:32:19'!
* aMultiplier

	^ aMultiplier multiplicarEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'cg 9/13/2022 11:22:19'!
+ anAdder

	^ anAdder sumarEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'cg 9/13/2022 11:51:55'!
- aSubtrahend

	^ aSubtrahend restarAEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'cg 9/13/2022 11:43:16'!
/ aDivisor

	^ aDivisor dividirAEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'cg 9/14/2022 10:30:04'!
dividirAEntero: dividendoEntero
" dividendoEntero / self "

	^ Fraccion with: dividendoEntero over: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'cg 9/14/2022 10:30:20'!
dividirAFraccion: dividendoFraccion
" dividendoFraccion / self "

	^ dividendoFraccion numerator / (dividendoFraccion denominator * self)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'cg 9/14/2022 10:29:23'!
fibonacci

	self subclassResponsibility ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'cg 9/14/2022 10:30:33'!
multiplicarEntero: factorEntero

	^ self class with: value * factorEntero integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'cg 9/13/2022 11:31:50'!
multiplicarFraccion: factorFraccion

	^ self * factorFraccion numerator / factorFraccion denominator! !

!Entero methodsFor: 'arithmetic operations' stamp: 'cg 9/14/2022 10:30:47'!
restarAEntero: minuendoEntero
" minuendoEntero - self "

	^ self class with: minuendoEntero integerValue - value! !

!Entero methodsFor: 'arithmetic operations' stamp: 'cg 9/14/2022 10:31:03'!
restarAFraccion: minuendoFraccion
" minuendoFraccion - self "

	^ (minuendoFraccion numerator - (self * minuendoFraccion denominator)) / minuendoFraccion denominator! !

!Entero methodsFor: 'arithmetic operations' stamp: 'cg 9/13/2022 11:20:28'!
sumarEntero: sumandoEntero

	^ self class with: value + sumandoEntero integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'cg 9/13/2022 11:21:27'!
sumarFraccion: sumandoFraccion 

	^ (self * sumandoFraccion denominator + sumandoFraccion numerator) / sumandoFraccion denominator! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'cg 9/13/2022 14:03:30'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'cg 9/13/2022 14:04:29'!
isNegative

	self subclassResponsibility! !

!Entero methodsFor: 'testing' stamp: 'cg 9/13/2022 14:04:35'!
isOne
	
	self subclassResponsibility! !

!Entero methodsFor: 'testing' stamp: 'cg 9/13/2022 14:04:42'!
isZero
	
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/15/2021 16:42:24'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos!!!!!!'! !

!Entero class methodsFor: 'instance creation' stamp: 'cg 9/13/2022 14:19:41'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	(aValue = 0) ifTrue: [ ^ Cero new initializeWith: aValue ].
	(aValue = 1) ifTrue: [ ^ Uno new initializeWith: aValue ].
	(aValue < 0) ifTrue: [ ^ EnteroNegativo new initializeWith: aValue ].
	(aValue > 0) ifTrue: [ ^ EnteroMayorAUno new initializeWith: aValue ].

	"^self new initalizeWith: aValue"! !


!classDefinition: #Cero category: 'Numero-Exercise'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Cero methodsFor: 'testing' stamp: 'cg 9/13/2022 14:04:56'!
isNegative

	^ false! !

!Cero methodsFor: 'testing' stamp: 'cg 9/13/2022 14:05:02'!
isOne

	^ false! !

!Cero methodsFor: 'testing' stamp: 'cg 9/13/2022 14:05:10'!
isZero

	^ true! !


!Cero methodsFor: 'fibonacci' stamp: 'cg 9/13/2022 14:09:11'!
fibonacci

	^ Entero with: 1! !


!Cero methodsFor: 'initialization' stamp: 'cg 9/15/2022 15:12:08'!
under: aNumerator
" aNumerator / 0 "

	^ self error: self class canNotDivideByZeroErrorDescription! !


!classDefinition: #EnteroMayorAUno category: 'Numero-Exercise'!
Entero subclass: #EnteroMayorAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroMayorAUno methodsFor: 'fibonacci' stamp: 'cg 9/13/2022 14:18:55'!
fibonacci

	| one two |

	one := Entero with: 1.
	two := Entero with: 2.

	^ (self - one) fibonacci + (self - two) fibonacci! !


!EnteroMayorAUno methodsFor: 'testing' stamp: 'cg 9/13/2022 14:05:53'!
isNegative

	^ false! !

!EnteroMayorAUno methodsFor: 'testing' stamp: 'cg 9/13/2022 14:18:04'!
isOne

	^ false! !

!EnteroMayorAUno methodsFor: 'testing' stamp: 'cg 9/13/2022 14:05:57'!
isZero

	^ false! !


!EnteroMayorAUno methodsFor: 'initialization' stamp: 'cg 9/15/2022 15:13:05'!
under: aNumerator
" aNumerator / self "

	^ Fraccion new initializeWith: aNumerator over: self! !


!classDefinition: #EnteroNegativo category: 'Numero-Exercise'!
Entero subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroNegativo methodsFor: 'testing' stamp: 'cg 9/13/2022 14:05:25'!
isNegative

	^ true! !

!EnteroNegativo methodsFor: 'testing' stamp: 'cg 9/13/2022 14:05:34'!
isOne

	^ false! !

!EnteroNegativo methodsFor: 'testing' stamp: 'cg 9/13/2022 14:05:39'!
isZero

	^ false! !


!EnteroNegativo methodsFor: 'fibonacci' stamp: 'cg 9/13/2022 14:08:21'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription! !


!EnteroNegativo methodsFor: 'initialization' stamp: 'cg 9/15/2022 15:13:48'!
under: aNumerator
" aNumerator / self "

	^ self negated under: aNumerator negated! !


!classDefinition: #Uno category: 'Numero-Exercise'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'fibonacci' stamp: 'cg 9/13/2022 14:18:43'!
fibonacci

	^ Entero with: 1! !


!Uno methodsFor: 'testing' stamp: 'cg 9/13/2022 14:18:26'!
isNegative

	^ false! !

!Uno methodsFor: 'testing' stamp: 'cg 9/13/2022 14:18:19'!
isOne

	^ true! !

!Uno methodsFor: 'testing' stamp: 'cg 9/13/2022 14:18:30'!
isZero

	^ false! !


!Uno methodsFor: 'initialization' stamp: 'cg 9/15/2022 15:11:30'!
under: aNumerator
" aNumerator / 1 "

	^ aNumerator! !


!classDefinition: #Fraccion category: 'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'cg 9/13/2022 11:39:04'!
* aMultiplier

	^ aMultiplier multiplicarFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'cg 9/13/2022 11:27:07'!
+ anAdder 

	^ anAdder sumarFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'cg 9/13/2022 11:54:34'!
- aSubtrahend

	^ aSubtrahend restarAFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'cg 9/13/2022 11:47:07'!
/ aDivisor

	^ aDivisor dividirAFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'cg 9/14/2022 10:31:25'!
dividirAEntero: dividendoEntero
" dividendoEntero / self "

	^ (dividendoEntero * denominator) / numerator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'cg 9/14/2022 10:31:36'!
dividirAFraccion: dividendoFraccion
" dividendoFraccion / self "

	^ (denominator * dividendoFraccion numerator) / (numerator * dividendoFraccion denominator)! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'cg 9/13/2022 11:38:37'!
multiplicarEntero: factorEntero

	^ (numerator * factorEntero) / denominator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'cg 9/13/2022 11:33:00'!
multiplicarFraccion: factorFraccion

	^ (numerator * factorFraccion numerator) / (denominator * factorFraccion denominator)! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'cg 9/14/2022 10:31:56'!
restarAEntero: minuendoEntero
" minuendoEntero - self "

	^ (denominator * minuendoEntero - numerator) / denominator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'cg 9/14/2022 10:32:08'!
restarAFraccion: minuendoFraccion
" minuendoFraccion - self "

	| newNumerator newDenominator |

	newNumerator := (denominator * minuendoFraccion numerator) - (numerator * minuendoFraccion denominator).
	newDenominator := denominator * minuendoFraccion denominator.

	^ newNumerator / newDenominator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'cg 9/13/2022 11:29:28'!
sumarEntero: sumandoEntero

	^ (numerator + denominator * sumandoEntero) / denominator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'cg 9/13/2022 11:24:01'!
sumarFraccion: sumandoFraccion

	| newNumerator newDenominator |

	newNumerator := (numerator * sumandoFraccion denominator) + (denominator * sumandoFraccion numerator).
	newDenominator := denominator * sumandoFraccion denominator.

	^ newNumerator / newDenominator! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'cg 9/15/2022 15:10:49'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.

	^ denominator under: numerator! !
