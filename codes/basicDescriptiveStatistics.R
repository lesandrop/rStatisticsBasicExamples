#vetores
ages <- c(17,18,19,18,17,20,17,18,20,18)
height <- c(1.7,1.8,1.9,1.8,1.7,1.8,1.7,1.8,1.7,1.8)

#Algumas estatísticas de age
ages
paste("Minimum: ", min(ages))
paste("Maximum: ", max(ages))
paste("Mean: ", mean(ages))
paste("Median: ", median(ages))
paste("Standard deviation: ", sd(ages))
paste("n: ", length(ages))
paste("Variance:", var(ages))
summary(ages)

#Algumas estatísticas de height
height
paste("Minimum: ", min(height))
paste("Maximum: ", max(height))
paste("Mean: ", mean(height))
paste("Median: ", median(height))
paste("Standard deviation: ", sd(height))
paste("n: ", length(height))
paste("Variance:", var(height))
summary(height)

#dataframe
df_students <- data.frame(Age=ages, Height=height)

#Algumas estatísticas de df_students
summary(df_students)