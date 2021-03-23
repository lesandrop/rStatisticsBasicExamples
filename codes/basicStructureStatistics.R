#vetores
ages <- c(17,18,19,18,17,20,17,18,20,18)
height <- c(1.7,1.8,1.9,1.8,1.7,1.8,1.7,1.8,1.7,1.8)

#dataframe
df_students <- data.frame(Age=ages, Height=height)

#Algumas estatísticas de age
ages
min(ages)
max(ages)
mean(ages)
median(ages)
sd(ages)
summary(ages)

#Algumas estatísticas de height
height
min(height)
max(height)
mean(height)
median(height)
sd(height)
summary(height)

#Algumas estatísticas de df_students
summary(df_students)