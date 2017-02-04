rankhospital <- function (state, outcome, num ) {
        
        if (num == "best") best(state,outcome)
        else if (num == "worst") worst(state,outcome)
        else if (class(num) == "numeric") rank_number(state,outcome,num)      
        else message("Wrong ranking input, please correct it !")      

}
