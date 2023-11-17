library(ggplot2)

#FOR REPRODUCIBILITY
set.seed(1899273)

#FIRST RANDOM LIST
list1 <- round(rnorm(28000, mean=656, sd=91))

#RESTRICT FIRST LIST TO BE IN RANGE
list1 <- pmax(pmin(list1, 850), 350)

#SECOND RANDOM LIST
list2 <- list1 + round(rnorm(28000, mean=7, sd=34))

#RESTRICT SECOND LIST TO BE IN RANGE
list2 <- pmax(pmin(list2, 850), 350)

#CREATE DATA FRAME
s <- data.frame(matrix(ncol=2, nrow=28000))
colnames(s) <- c("Eq","Exp")
s$Eq <- list1
s$Exp <- list2

#MAKE SCATTERPLOT
plot(s$Eq, s$Exp, cex=0.2, xlim=c(300,900), ylim=c(300,900), col='blue')

#MAKE HISTOGRAMS
hist <- ggplot(s, aes(x=Exp))
hist <- hist + 
  geom_histogram(binwidth=20, alpha=0.8, fill=rgb(167/255,4/255,22/255), color=rgb(167/255,4/255,22/255)) +
  scale_x_continuous(breaks=seq(300, 900, 100)) +
  scale_y_continuous(breaks=seq(0, 4000, 1000)) +
  theme(
    axis.ticks=element_blank(),
    panel.background=element_rect(fill = "white"),
    panel.grid.major=element_line(color="white"),
  )
hist

hist2 <- ggplot(s, aes(x=Eq))
hist2 <- hist2 + 
  geom_histogram(binwidth=20, alpha=0.8, fill=rgb(167/255,4/255,22/255), color=rgb(167/255,4/255,22/255)) +
  scale_x_continuous(breaks=seq(300, 900, 100)) +
  scale_y_continuous(breaks=seq(0, 4000, 1000)) +
  theme(
    axis.ticks=element_blank(),
    panel.background=element_rect(fill = "white"),
    panel.grid.major=element_line(color="white"),
  )
hist2
