worst <- function(state, outcome) {
        
        ## Read outcome data
        my_data <<- read.csv("outcome-of-care-measures.csv", colClasses="character")
        
        s <<- my_data$State
        m <<- c("heart attack","heart failure", "pneumonia")
        ## Check that state and outcome are valid
        
        if (!any(s==state))  stop("invalid state")
        if (!any(m==outcome)) stop("invalid outcome")
        
        ## Return hospital name in that state with lowest 30-day death rate
        
        if (outcome == m[[1]]) c <- 11
        else if (outcome == m[[2]]) c <- 17
        else c <- 23
        
        my_data <- subset(my_data, s == state & my_data[,c] != "Not Available")
        r <- rank(as.numeric(my_data[,c]))
        result <- which.max(r)
        
        message("The worth hospital for the ", outcome ," mortality is : ", my_data[result,2])
        
}
