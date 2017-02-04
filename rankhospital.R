rankhospital <- function (state, outcome, num = "best" ) {
        
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
        
        
        
        if (num == "best") {
                
                result <- my_data[1,2]
                message("The best hospital of healing for the ", outcome ," is : ", result)
                
        }
        else if (num == "worst") {
                
                result <- my_data[nrow(my_data),2]
                message("The worst hospital of healing for the ", outcome ," is : ", result)
        }
        else if (class(num) == "numeric") {
                
                if(num > nrow(my_data)){ 
                        
                        message("NA")
                        
                } else {
                        
                        result <- my_data[num,2]
                        message("The hospital n°",num, " which have the less mortality for the ", outcome ," is : ", result)
                }
                
        }   
        
        else message("Wrong ranking input, please correct it !")      
        
        options(warn = 0)
}
