library(ggplot2)

df_activity <- data.frame(Rank=c(1,10,100,1000,10000,1000000,10000000,100000000,10000000000,100000000000),
						  Frequency=c(99999,48999,31000,1000,999,499,310,100,10,1))

pl <- ggplot(df_activity,aes(x = Rank, y=Frequency)) +
  scale_x_log10(breaks = scales::trans_breaks("log10", function(x) 10^x), labels = scales::trans_format("log10", scales::math_format(10^.x))) +
  scale_y_log10(breaks = scales::trans_breaks("log10", function(x) 10^x), labels = scales::trans_format("log10", scales::math_format(10^.x))) +
  theme_bw(base_size = 11) + geom_point(shape=1,size=3) + ylab("Frequency (no. of days)")

print(pl)