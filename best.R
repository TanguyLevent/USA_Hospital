best <- function(state, outcome) {
        
        options(warn = -1)
        ## Read outcome data
        my_data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
        
        s <- my_data$State
        m <- c("heart attack","heart failure", "pneumonia")
        ## Check that state and outcome are valid
        
        if (!any(s==state))  stop("invalid state")
        if (!any(m==outcome)) stop("invalid outcome")
        
        ## Return hospital name in that state with lowest 30-day death rate
        
        if (outcome == m[[1]]) c <- 11
        else if (outcome == m[[2]]) c <- 17
        else c <- 23

        my_data <- my_data[my_data$State == state,]
        my_data[,c] <- as.numeric(my_data[,c])
        my_data <- my_data[complete.cases(my_data),]
        my_data <- my_data[order(my_data[,c], my_data[,2]),]
        result <- my_data[1,2]
        
        message("The best hospital for the ", outcome ," mortality is : ", result)
        
        options(warn = 0)
}

