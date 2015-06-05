module Main where
import Data.List
import Data.Char
import Data.Bits

esquerdo x xs = [y | y <- xs, y < x]
direito x xs = [y | y <- xs, y >= x]

quicksort [] = []
quicksort (x:xs) = quicksort (esquerdo x xs) ++ [x] ++ quicksort (direito x xs)

imprimeQuick x = do print (quicksort x)

main = imprimeQuick [1,423,12,42,12]
