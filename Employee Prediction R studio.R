
datasets <- trainValTest(Employee, val = 0.2, test = 0.2)
train <- Employee[1:4188,]
sum(Employee$LeaveOrNot==0)
sum(Employee$LeaveOrNot==1)

val <- datasets[[2]]
test <- Employee[4189:4653,]
sum(test$LeaveOrNot==0)
sum(test$LeaveOrNot==1)
emp_mod = glm(LeaveOrNot~.-JoiningYear,data=train,family = 'binomial')
summary(emp_mod)
test_data = predict(emp_mod,newdata = test,type = 'response')
predict=data.frame(test_data)
view(predict)
sum(test_data<0.4)
sum(test_data>0.7)
library("WriteXLS")
write.csv(predict,"C:\\Users\\smart\\Documents\\prediction.csv")

