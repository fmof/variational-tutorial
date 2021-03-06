library(ggplot2)
library(reshape)
f = function(p1,p2,range=c(-20,30,0.001)){
v = seq(range[1],range[2],range[3])
data <- data.frame(x = v, y1 = dnorm(v,p1[1],p1[2]), y2 = dnorm(v,p2[1],p2[2]))
mdata = melt(data,id=c("x"))
g = ggplot(mdata,aes(x=x,y=value)) + geom_line(size=1,aes(colour=variable)) + theme_bw() 
g + theme(legend.position="none", axis.text.y=element_blank(),axis.ticks.y=element_blank(),axis.title=element_blank())
}
second = f(c(0,0.01),c(0.1,0.01),c(-.1,.2,.00001))
print(second)
ggsave("second.png")
first = f(c(0,50),c(10,50),c(-100,100,.01)) + ylim(0,.1)
print(first)
ggsave("first.png")