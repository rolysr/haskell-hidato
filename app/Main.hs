module Main where
import Utils 
import HamiltonianTourGenerator 
import Solver

main = do
    putStrLn "---------------------------------------------------"
    putStrLn "Welcome to the Haskell Hidato Solver and Generator!"
    putStrLn "---------------------------------------------------\n"
    putStrLn "Do you want to generate and solve a random rectangular hidato (1) or a custom one (2) parsed from stdin? Please enter a number according to an option:"
    option <- getLine
    if option == "1" 
        then do
            {
                putStrLn "Option 1 selected. Please enter two integers (one by line) representing the hidato's dimensions in rows and columns...";
                n <- getLine;
                m <- getLine;
                let{boardNM = full_k_matrix (read n) (read m) 0};  
                let{solvedHidato = generateSolvedHidato boardNM (Pos 0 0)};
                let{uniqueSolutionHidato = generateHidatoWithUniqueSolution solvedHidato};
                putStrLn "The hidato unsolved that was generated is:\n"
                putStrLn (printMatrix (board uniqueSolutionHidato))
                putStrLn "\nThe hidato is solved like this:"
                putStrLn (printMatrix (board solvedHidato))
            }
             
    else if option == "2" 
        then do 
            putStrLn "Option 2 selected. Parsing the custom hidato from stdin..."
            boardNM    <- replicateM m readMany  
            let{solvedHidato = generateSolvedHidato boardNM (Pos 0 0)};
            let{uniqueSolutionHidato = generateHidatoWithUniqueSolution solvedHidato};
            putStrLn "The parsed hidato unsolved that was generated is:\n"
            putStrLn (printMatrix (board uniqueSolutionHidato))
            putStrLn "\nThe hidato is solved like this:"
            putStrLn (printMatrix (board solvedHidato))
    else
        putStrLn "Invalid option!"
    
    putStrLn "Ending program..."

    