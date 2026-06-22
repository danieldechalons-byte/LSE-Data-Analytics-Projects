#Load data
myData = read.csv("/Users/danieldechalons/LSE Data Analysis Course/Course Section 3/Assignment /turtle_reviews_clean.csv", stringsAsFactors = TRUE)

# Create Training and Testing Samples
require(caret)

#create test/training partitions using caret package function
set.seed(107)
inTrain <- createDataPartition(
  y = myData$loyalty_points,
  ## the outcome data are needed
  p = .75,
  ## The percentage of data in the
  ## training set
  list = FALSE
)

training <- myData[ inTrain,]
testing  <- myData[-inTrain,]
nrow(training)
#> [1] 157
nrow(testing)


# complex multiple regression
myLoyaltyModel = lm(loyalty_points ~ age + education + gender + remuneration + spending_score, data = training)
summary(myLoyaltyModel)
plot(myLoyaltyModel)
resultdf = data.frame(actuals = training$loyalty_points, fit = myLoyaltyModel$fitted.values)
plot(resultdf$actuals, resultdf$fit)

# predict on test sample
predictModel = predict(myLoyaltyModel, testing, interval = "prediction")
summary(predictModel)

# simplistic multiple regression - in order to test individual fields
myLoyaltyModelSimple = lm(loyalty_points ~ remuneration + spending_score, data = myData)
myLoyaltyModelSimple = lm(loyalty_points ~ spending_score + remuneration, data = myData)
summary(myLoyaltyModelSimple)
plot(myLoyaltyModelSimple)
simpleresultdf = data.frame(actuals = myData$loyalty_points, fit = myLoyaltyModelSimple$fitted.values)
plot(simpleresultdf$actuals, simpleresultdf$fit)


#investigating Least Squares 
plsFit <- train(
  loyalty_points ~ age + education + gender + remuneration + spending_score,
  data = training,
  method = "pls",
  ## Center and scale the predictors for the training
  ## set and all future samples.
  preProc = c("center", "scale")
)

plsFit

# Classification and Regression Tree

require(rpart)

# Regression Tree with rpart
# grow tree
fit <- rpart(loyalty_points ~ age + education + gender + remuneration + spending_score,
             data=myData)
#fit <- rpart(loyalty_points ~ education ,  data=myData)
#fit <- rpart(loyalty_points ~ age,
 #            data=myData)

printcp(fit) # display the results
plotcp(fit) # visualize cross-validation results
summary(fit) # detailed summary of splits

# plot tree
plot(fit, uniform=TRUE,
     main="Classification Tree for Loyalty Points", cex = 0.8)
text(fit, use.n=TRUE, all=TRUE, cex=.8)



#Categorical Tree
# 1. Load the data
data <- myData

# 2. Create 5 categories for loyalty_points using quintiles
quintiles <- quantile(data$loyalty_points, probs = seq(0, 1, 0.2), na.rm = TRUE)

data$loyalty_class <- cut(
  data$loyalty_points,
  breaks = quintiles,
  include.lowest = TRUE,
  labels = c("Very Low", "Low", "Medium", "High", "Very High")
)

# Convert to factor
data$loyalty_class <- as.factor(data$loyalty_class)

# 3. Fit classification tree
tree_model <- rpart(loyalty_class ~ remuneration + spending_score + gender,
                    data = data,
                    method = "class")

#tree_model <- rpart(loyalty_class ~ gender,
#                    data = data,
#                    method = "class")

# 4. Print model summary
print(tree_model)
summary(tree_model)

# 5. Plot the tree
#rpart.plot(tree_model, type = 3, extra = 104,
 #          fallen.leaves = TRUE, main = "Classification Tree for Loyalty Points (5 categories)")

# plot tree
plot(tree_model, uniform=TRUE,
     main="Classification Tree for Loyalty Points", cex = 0.8)
text(tree_model, use.n=TRUE, all=TRUE, cex=.8)
print(tree_model$variable.importance)


reg_tree <- rpart(loyalty_points ~ remuneration + spending_score + gender,
                  data = data,
                  method = "anova")   # "anova" = regression tree

# 3. Print model summary
print(reg_tree)
summary(reg_tree)

# 4. Plot the regression tree
plot(reg_tree, uniform=TRUE,
     main="Regression Tree for Loyalty Points", cex = 0.8)
text(reg_tree, use.n=TRUE, all=TRUE, cex=.8)

