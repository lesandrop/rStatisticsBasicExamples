#scenario
scenario <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
#Run time vectors

strategy1 <- c(11, 16, 10, 4, 8, 13, 17, 18, 5)
strategy2 <- c(14, 17, 9, 5, 7, 11, 19, 21, 4)
expRawResults <- data.frame(Strategy1=strategy1, Strategy2=strategy2)

#histogram of strategy1
hist(strategy1, ylab="Run time", xlab="Strategy", main="")

#histogram of strategy2
hist(strategy2, ylab="Run time", xlab="Strategy", main="")

#boxplot of both strategy1 and strategy2
boxplot(expRawResults, xlab="Strategy", ylab="Run time", main="")


#Comparing strategy1 and strategy2 lines per scenario
plot(strategy1 ~ scenario, type = "b", frame = FALSE, pch = 19, col = "red", xlab = "x", ylab = "y")
lines(strategy2 ~ scenario, pch = 18, col = "blue", type = "b", lty = 2)
legend("bottomleft", legend=c("Strategy 1", "Strategy 2"), col=c("red", "blue"), lty = 1:2, cex=0.8)

#Comparing strategy1 and strategy2 points
plot(strategy1~strategy2, xlab="Strategy 2", ylab="Strategy 1", main="")