module Library where
import PdePreludat

-- 1. Numeros

siguiente :: Number -> Number
siguiente nro = nro + 1

esPositivo :: Number -> Bool
esPositivo nro = nro > 0

-- escriban el tipo de esta función
inversa n = 1/n

-- 2. Temperaturas

celsiusAFahrenheit :: Number -> Number
celsiusAFahrenheit celsius = implementame

fahrenheitACelsius :: Number -> Number
fahrenheitACelsius fahrenheit = implementame

-- escriban el tipo de esta función
haceFrioCelsius grados = implementame

-- escriban el tipo de esta función
haceFrioFahrenheit grados = implementame

-- 2.5 Bonus OPCIONAL
perimetroCirculo :: Number -> Number
perimetroCirculo radio = 2 * pi * radio 

perimetroCuadrado :: Number -> Number
perimetroCuadrado lado = lado * 4

superficieCuadrado :: Number -> Number
superficieCuadrado lado = lado ^ 2

superficieCubo :: Number -> Number
superficieCubo lado = lado ^ 3

superficieCilindro :: Number -> Number -> Number
superficieCilindro radio altura = (2 * pi * radio * altura) + 2 * pi * radio ^ 2
