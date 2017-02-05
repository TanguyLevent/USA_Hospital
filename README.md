# USA_Hospital

Goal of the project : Comparaison over US hospitals death ranking over several diseases (heart attack, heart failure, pneumonia)
You can choose the best, the worst, or the ranking you want to see by states (or not).

Three functions :

- best(state, disease)
- rankhospital(state, disease, rank)
- rankall(disease, rank)

The rank can be either as numeric or character for two variables : "best" or "worst".

You can test :

> best("TX", "heart attack")
[1] "CYPRESS FAIRBANKS MEDICAL CENTER"
 > best("TX", "heart failure")
 [1] "FORT DUNCAN MEDICAL CENTER"
 > best("MD", "heart attack")
 [1] "JOHNS HOPKINS HOSPITAL, THE"
 > best("MD", "pneumonia")
 [1] "GREATER BALTIMORE MEDICAL CENTER"

 > rankhospital("TX", "heart failure", 4)
 [1] "DETAR HOSPITAL NAVARRO"
 > rankhospital("MD", "heart attack", "worst")
 [1] "HARFORD MEMORIAL HOSPITAL"
 > rankhospital("MN", "heart attack", 5000)
 [1] NA

 > head(rankall("heart attack", 20), 10)
 > tail(rankall("pneumonia", "worst"), 3)
 > tail(rankall("heart failure"), 10)