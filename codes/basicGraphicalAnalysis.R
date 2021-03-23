#vetores
ages <- c(17,18,19,18,17,20,17,18,20,18)
height <- c(1.7,1.8,1.9,1.8,1.7,1.8,1.7,1.8,1.7,1.8)
df_students <- data.frame(Age=ages, Height=height)

#bars
plot(df_students)

#points
plot(Age ~ Height, data=df_students)
plot(Age ~ c(1:10), data=df_students)

#boxplot
boxplot(df_students)
boxplot(df_students$Age)
boxplot(df_students$Height)

#hist
hist(df_students$Height, ylab="Frequência", xlab="Altura", main="")