#Train and Validate (90%)
train <- Employee[1:4188,]
sum(Employee$LeaveOrNot==0) # Train Data: Gives actual Count of employees who stay with company
sum(Employee$LeaveOrNot==1) # Train Data: Gives actual Count of employees who leave the company

#Test (10% data Kept aside to Predict Leave or Not)
test <- Employee[4189:4653,] # 10% data 
sum(test$LeaveOrNot==0) # Test data: Gives actual Count of employees who stay with company
sum(test$LeaveOrNot==1) # Test data: Gives actual Count of employees who leave the company

emp_mod = glm(LeaveOrNot~.-JoiningYear,data=train,family = 'binomial') # Binary Logistic Regression on Train Data
summary(emp_mod) # Regression model Output of Train Data

test_data = predict(emp_mod,newdata = test,type = 'response') # Feeding regression model to predict test data(Leave, Stay, Uncertain)
predict=data.frame(test_data) # covert output data (probabilities) in to table format
View(predict) # To view table

sum(test_data<=0.2) #Stay
sum(test_data>0.2 & test_data<=0.7) #Uncertain
sum(test_data>0.7) #Leave

library("WriteXLS")
#write.csv(predict,"C:\\Users\\smart\\Documents\\prediction10.csv") #To save prediction probabilities in to .csv file for data visualization.

