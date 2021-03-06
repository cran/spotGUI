#' checkInputBounds
#'
#' Checks whether or not the user inserted a faulty configuration for the dimension/bounds
#'
#' @param input GUi Inputs
#'
#' @return T for correct user input, F for a faulty configuration
#' @keywords internal
checkInputBounds <- function(input){
    return(!any(sapply(c(getBounds(input)[[1]],getBounds(input)[[2]]),is.na)))
}

#' checkInputObjectiveFunction
#'
#' Checks whether or not the user inserted a faulty configuration for an
#' objective Function from the R-Environment
#'
#' @param input GUI Inputs
#'
#' @return T for correct user input, F for a faulty configuration
#' @keywords internal
checkInputObjectiveFunction <- function(input){
    if(input$objectiveFunction == "smoof"){
        return(checkSmoofFunScalibility(input$smoofFunctionSelector, input))
    }else{
        objFun <- getObjectiveFunction(input, asText = T)
        if(!exists(objFun)){
            return(F)
        }
        if(!(typeof(get(objFun)) == "closure")){
            return(F)
        }
    }
    return(T)
}

#' checkInputCorrectness
#'
#' Main Input checking function, calls all subChecks and creates User-Dialogs for the respective problems.
#'
#' @param input GUi Inputs
#'
#' @return T for correct user input, F for a faulty configuration
#' @keywords internal
checkInputCorrectness <- function(input){
    inputsCorrect <- 0

    if(!checkInputBounds(input)){
        inputsCorrect <- 1
    }

    if(!checkInputObjectiveFunction(input)){
        inputsCorrect <- 2
    }

    if(inputsCorrect == 0){
        return(T)
    }else if(inputsCorrect == 1){
        showModal(modalDialog(title="Configuration Error","There is an error in your objective
                              function configuration!\nPlease Check for typos etc.
                              in your bounds and dimension amount."
                              ,footer=NULL,easyClose=T))
        return(F)
    }else if(inputsCorrect == 2){
        showModal(modalDialog(title="Configuration Error","There is an error in the objective
                              function you specified!\n
                              Maybe it does not exist or is faulty, please check for typos.\n\n
                              If you are using a 'smoof'-function, please make sure that you don't
                              acceed the maximum amount of dimensions of the given function."
                              ,footer=NULL,easyClose=T))
        return(F)
    }else{
        showModal(modalDialog(title="Configuration Error","There seems to be an error in your setup
                              ,please make sure that your configuration is correct."
                              ,footer=NULL,easyClose=T))
        return(F)
    }
}
