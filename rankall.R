rankall <- function(outcome, num){
        
        ## Read outcome data
        my_data <<- read.csv("outcome-of-care-measures.csv", colClasses="character")
        
        s <<- my_data$State
        m <<- c("heart attack","heart failure", "pneumonia")
        ## Check that state and outcome are valid
        
        if (!any(s==state))  stop("invalid state")
        if (!any(m==outcome)) stop("invalid outcome")
        
        
}