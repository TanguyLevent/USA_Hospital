rankall <- function(outcome, num = "best"){
        
        options(warn = -1)
        
        ## Read outcome data
        my_data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
        m <- c("heart attack","heart failure", "pneumonia")
        l <- 1
        i <- 1
        num2 <- 0
        all_states <- sort(unique(my_data$State))
        ## Check that state and outcome are valid

        if (!any(m==outcome)) stop("invalid outcome")
        
        ## Return hospital name in that state with lowest 30-day death rate
        
        if (outcome == m[[1]]) c <- 11
        else if (outcome == m[[2]]) c <- 17
        else c <- 23
        
        my_data[,c] <- as.numeric(my_data[,c])
        my_data <- my_data[complete.cases(my_data),]
        my_data <- my_data[order(my_data[,7],my_data[,c], my_data[,2]),]
        
        
        df <- data.frame(hospital = 1:54, state = 1:54, row.names = all_states)
        
        while( i < nrow(my_data)) {

                Ongoing_state <- my_data[i,7]
                count <- sum(my_data$State == Ongoing_state)
                
                if (num == "best") num2 <-1
                else if (num == "worst") num2 <- count
                else num2 <- num
                        
                if (count < num2) {
                                
                        df[l,1] <- "<NA>"
                        df[l,2] <- Ongoing_state

                } else {
                        
                        df[l,1] <- my_data[i + num2 - 1,2]
                        df[l,2] <- Ongoing_state
               
                }
                
                i <- i + count 
                l <- l + 1
 
        }
    
        return(df)
        options(warn = 0)
        
}
