module Library where
import PdePreludat

-- 1. Numeros

siguiente :: Number -> Number
siguiente numero = numero + 1

esPositivo :: Number -> Bool
esPositivo numero 
 | numero > 0 = True
 | numero < 0 = False
 | otherwise = False
-- escriban el tipo de esta función n = implementame 

inversa :: Number -> Number
inversa n = 1 / n

-- 2. Temperaturas

celsiusAFahrenheit :: Number -> Number
celsiusAFahrenheit celsius = (celsius * 1.8) +32

fahrenheitACelsius :: Number -> Number
fahrenheitACelsius fahrenheit = (fahrenheit - 32) / 1.8

-- escriban el tipo de esta función
haceFrioCelsius :: Number -> Bool
haceFrioCelsius grados 
 | grados < 8 = True
 | grados == 8 = True
 | otherwise = False

-- escriban el tipo de esta función
haceFrioFahrenheit :: Number -> Bool
haceFrioFahrenheit grados  
 | grados < 46.4 = True
 | grados == 46.4 = True
 |otherwise = False
-- 2.5 Bonus OPCIONAL
perimetroCirculo :: Number -> Number
perimetroCirculo radio = 2 * pi * radio 

perimetroCuadrado :: Number -> Number
perimetroCuadrado lado = lado * 4

superficieCuadrado :: Number -> Number
superficieCuadrado lado = lado ^ 2

superficieCubo :: Number -> Number
superficieCubo lado = 6 * superficieCuadrado lado

superficieCilindro :: Number -> Number -> Number
superficieCilindro radio altura = (2 * pi * radio * altura) + 2 * pi * radio ^ 2
