-- Universidade Federal de Sergipe
-- Igor Nascimento dos Santos
-- Gerência e Suporte a Sistemas
-- Teste de Sanidade com o Ghc

module Main where
import Data.List
import Data.Char
import Data.Bits
import System.IO

esquerdo x xs = [y | y <- xs, y < x]
direito x xs = [y | y <- xs, y >= x]

quicksort [] = []
quicksort (x:xs) = quicksort (esquerdo x xs) ++ [x] ++ quicksort (direito x xs)

imprimeQuick = do 
	outh <- openFile "haskell.txt" WriteMode
	let x = quicksort [14,322,43,7,54,23,0,123]
	hPrint outh x
	hClose outh

main :: IO ()
main = do imprimeQuick
