module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
-- Si alguna suit de tests tiene "focus" adelante, solo se va a correr esa.
-- Asi que, para ir probando los puntos, agreguen focus a los demas, o saquenselo a todos:
  focus suiteDeTestsDeParteI
  suiteDeTestsDeParteIBonus
  focus suiteDeTestsDeParteII
  
suiteDeTestsDeParteI =
  describe "Parte I: Numeros" $ do

    describe "siguiente" $ do
      it "el siguiente de un numero es el numero + 1" $ do
        siguiente (-1) `shouldBe` 0
        siguiente 0 `shouldBe` 1
        siguiente 1 `shouldBe` 2

    describe "inversa" $ do
      it "la inversa de 1 es 1" $ do
        inversa 1 `shouldBe` 1
      it "la inversa de cualquier numero es el resultado de dividir 1 por ese numero" $ do
        inversa 4 `shouldBe` 0.25
        inversa 0.25 `shouldBe` 4

    describe "esPositivo" $ do
      it "es verdad para los numeros mayores a 0" $ do
        esPositivo 1 `shouldBe` True
      it "es falso para los numeros menores a 0" $ do
        esPositivo (-1) `shouldBe` False
      it "es falso para el 0" $ do
        esPositivo 0 `shouldBe` False

suiteDeTestsDeParteIBonus =
  describe "Parte 1 Bonus" $ do
    it "el perimetro de un circulo es 2 * pi * radio" $ do
      perimetroCirculo 2.5 `shouldBeEqualUpTo2Decimals` 15.70796
    it "el perimetro de un cuadrado es el lado x 4" $ do
      perimetroCuadrado 3 `shouldBe` 12
    it "la superficie de un cuadrado es el lado al cuadrado" $ do
      superficieCuadrado 3 `shouldBe` 9
    it "la superficie de un cubo es el area de una cara por la cantidad de caras (6)" $ do
      superficieCubo 3 `shouldBe` 54
    it "la superficie de un cilindro es el area de las tapas por el area de la pared del cilindro" $ do
      superficieCilindro 2 4 `shouldBeEqualUpTo2Decimals` 75.39822

suiteDeTestsDeParteII =
  describe "Parte 2: Temperaturas" $ do
    describe "celsiusAFahrenheit" $ do
      it "pasa una temperatura de celsius a fahrenheit" $ do
        celsiusAFahrenheit (-5) `shouldBe` 23
        celsiusAFahrenheit 3.2 `shouldBeEqualUpTo2Decimals` 37.76
        celsiusAFahrenheit 0 `shouldBeEqualUpTo2Decimals` 32

    describe "fahrenheitACelsius" $ do
      it "pasa una temperatura de fahrenheit a celsius" $ do
        fahrenheitACelsius 32  `shouldBe` 0
        fahrenheitACelsius (-6.5) `shouldBeEqualUpTo2Decimals` (-21.38)
        fahrenheitACelsius 0 `shouldBeEqualUpTo2Decimals` (-17.77)

    describe "fahrenheitACelsius y celsiusAFahrenheit son inversas" $ do
      it "convertir un valor en celsius a fahrenheit y luego volver a convertir a celsius retorna el valor original" $ do
        celsiusAFahrenheit 30 `shouldBe` 86
        fahrenheitACelsius 86 `shouldBe` 30
      it "convertir un valor en fahrenheit a celsius y luego volver a convertir a fahrenheit retorna el valor original" $ do
        fahrenheitACelsius 32 `shouldBe` 0
        celsiusAFahrenheit 0 `shouldBe` 32
      

    describe "haceFrioCelsius" $ do
      -- Pista: hay 3 casos a testear
      it "Es verdad cuando hacen menos de 8 grados celsius" $ do
        haceFrioCelsius (-6) `shouldBe` True
      it "Es verdad cuando hace 8 grados celsius" $ do
        haceFrioCelsius 8 `shouldBe` True
      it "Es falso cuando hacen mas de 8 grados celsius" $ do
        haceFrioCelsius 15 `shouldBe` False

    describe "haceFrioFahrenheit" $ do
      -- Pista: hay 3 casos a testear
      it "Es verdad cuando hace menos de 46.4 grados fahrenheit" $ do
         haceFrioFahrenheit 37.4 `shouldBe` True
      it "Es verdad cuando hace 46.4 grados fahrenheit" $ do
        haceFrioFahrenheit 46.4 `shouldBe` True
      it "Es falso cuando hace mas de 46.4 grados fahrenheid" $ do
        haceFrioFahrenheit 80 `shouldBe` False

escribiTestsParaEstaFuncion :: SpecWith ()
escribiTestsParaEstaFuncion = pure ()

shouldBeEqualUpTo2Decimals :: Number -> Number -> Expectation
shouldBeEqualUpTo2Decimals aNumber anotherNumber = shouldBeEqualWithErrorLessThan 0.01 aNumber anotherNumber

shouldBeEqualWithErrorLessThan :: Number -> Number -> Number -> Expectation       
shouldBeEqualWithErrorLessThan error aNumber anotherNumber
  | aNumber - anotherNumber < error = pure () -- Esto hace que el test de verde!
  | otherwise = expectationFailure (show aNumber ++ " no es igual (comparando con error < " ++ show error ++ ") a " ++ show anotherNumber)
