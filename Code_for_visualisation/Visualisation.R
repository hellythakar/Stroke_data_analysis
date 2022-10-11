library(readxl)
Stroke <- read_excel("Stroke.xlsx")
View(Stroke)

#Import Dataset from the folder

#How many people have Stroke or no stroke? 
Figure1 <- ggplot(Stroke, aes(stroke)) + xlim(0, 1)
Figure1 + stat_bin(aes(ymax = ..count..), binwidth = 0.1, geom = "area") +   ggtitle("How many people have Stroke?")+
  theme(plot.title = element_text(hjust = .5)) + geom_text(stat = "count", aes(label = after_stat(count)), vjust = -1) + theme_gray()

#Dataset Description

library(ggplot2)
library(ggpubr)
theme_set(theme_pubr())
bp1 = ggplot(Stroke, aes (gender)) + geom_bar(fill = "indianred4") + geom_text(stat = "count", aes(label = after_stat(count)), vjust = -1) + theme_gray()
bp2 =ggplot(Stroke, aes (hypertension)) + geom_bar(fill = "indianred3") + geom_text(stat = "count", aes(label = after_stat(count)), vjust = -1) + theme_gray()
figure2 <- ggarrange(bp1, bp2, ncol = 2, nrow = 1)
figure2

library(ggplot2)
library(ggpubr)
theme_set(theme_pubr())
bp3 =ggplot(Stroke, aes (heart_disease)) + geom_bar(fill = "indianred4")+ geom_text(stat = "count", aes(label = after_stat(count)), vjust = -1) + theme_gray()
bp4 =ggplot(Stroke, aes (ever_married)) + geom_bar(fill = "indianred3") + geom_text(stat = "count", aes(label = after_stat(count)), vjust = -1) + theme_gray()
figure3 <- ggarrange(bp3, bp4, ncol = 2, nrow = 1)
figure3

library(ggplot2)
library(ggpubr)
theme_set(theme_pubr())
bp5 =ggplot(Stroke, aes (work_type)) + geom_bar(fill = "indianred") + geom_text(stat = "count", aes(label = after_stat(count)), vjust = -1) + theme_gray()
bp6 =ggplot(Stroke, aes (Residence_type)) + geom_bar(fill = "brown4") + geom_text(stat = "count", aes(label = after_stat(count)), vjust = -1) + theme_gray()
figure4 <- ggarrange(bp5, bp6, ncol = 2, nrow = 1)
figure4

library(ggplot2)
library(ggpubr)
theme_set(theme_pubr())
bp7 =ggplot(Stroke, aes (smoking_status)) + geom_bar(fill = "brown3") + geom_text(stat = "count", aes(label = after_stat(count)), vjust = -1) + theme_gray()
bp8 =ggplot(Stroke, aes (stroke)) + geom_bar(fill = "brown2") + geom_text(stat = "count", aes(label = after_stat(count)), vjust = -1) + theme_gray()
figure5 <- ggarrange(bp7, bp8, ncol = 2, nrow = 1)
figure5

#Age VS Gender
library(ggplot2)
Figure6 <- ggplot(Stroke,aes(age)) 
Figure6 + geom_bar(aes(fill = gender), position  = "dodge") + theme_gray()



# Question 1: Do factors such as age, BMI, glucose level affect the stroke variable?
  
summary(Stroke)
library(ggplot2)
library(ggpubr)
theme_set(theme_pubr())
scp1 = ggplot(Stroke) + geom_point(aes(x=age, y=bmi, color=as.factor(stroke))) + geom_smooth(aes(x=age, y=bmi, color=as.factor(stroke))) + theme_gray()
scp2 = ggplot(Stroke) + geom_point(aes(x=age, y=avg_glucose_level, color=as.factor(stroke))) + geom_smooth(aes(x=age, y=avg_glucose_level, color=as.factor(stroke))) + theme_gray()
scp3 = ggplot(Stroke) + geom_point(aes(x=bmi, y=avg_glucose_level, color=as.factor(stroke))) + geom_smooth(aes(x=bmi, y=avg_glucose_level, color=as.factor(stroke))) + theme_gray()
figure7 <- ggarrange(scp3, scp2, scp1,
                     labels = c("A", "B", "C"),
                     ncol = 2, nrow = 2)

figure7

#Question 2: Work type, married status, residence type, smoking status, gender does these factors also affect the stroke?
  
library(ggplot2)
library(ggpubr)
theme_set(theme_pubr())
p1 = ggplot(Stroke,aes(stroke)) + geom_bar(aes(fill = gender), position = "dodge")+ theme_gray()
p2 = ggplot(Stroke,aes(stroke)) + geom_bar(aes(fill = ever_married), position = "dodge") + theme_gray() 
p3 = ggplot(Stroke,aes(stroke)) + geom_bar(aes(fill = work_type), position = "dodge") + theme_gray()
p4 = ggplot(Stroke,aes(stroke)) + geom_bar(aes(fill = Residence_type), position = "dodge") + theme_gray()
p5 = ggplot(Stroke,aes(stroke)) + geom_bar(aes(fill = smoking_status), position = "dodge") + theme_gray()
figure8 <- ggarrange(p1 , p2, p3, p4, p5,  ncol = 2, nrow = 3) 
figure8



#Question 3: How is the stroke distribution compared to gender?
Figure9 = ggplot() + 
  geom_density(data=Stroke, aes(x=gender  , group=as.factor(stroke),fill=as.factor(stroke)),
               size=1,alpha=0.5, adjust=2)  +   ggtitle("Distribution of stroke with respect to gender")+
  theme(plot.title = element_text(hjust = .5)) +
  theme_bw() + theme_gray() +
  ylab("Density")+ labs(fill=' ',x="Gender") +   
  scale_fill_brewer(palette = "Dark2",labels = c("No stroke", "Stroke"))

Figure9


Figure10 <- ggplot(Stroke,aes(gender)) + geom_bar(aes(fill = as.factor(stroke)), position = "dodge")+
  geom_text(stat = "count", aes(label = after_stat(count)), vjust = -1)+ theme_gray()
Figure10

#Question 4: Does Heart disease and hypertension affect the stroke variable?

library(ggplot2)
library(ggpubr)
theme_set(theme_pubr())
h1 = ggplot(Stroke,aes(heart_disease, fill = as.factor(stroke)))+
  geom_histogram(aes(y = ..density..))+
  facet_wrap(~as.factor(stroke))+
  ggtitle("Distribution of heart disease by Stroke")+
  theme(plot.title = element_text(hjust = .5))  + theme_gray()

h2 = ggplot(Stroke, aes(hypertension))+
  geom_density(col = "black")+
  geom_histogram(aes(y=..density..), alpha = .3, fill = "blue")+
  facet_grid(as.factor(stroke)~.)+
  ggtitle("Distribution of hypertension by Stroke")+
  theme(plot.title = element_text(hjust = .5)) + theme_gray()
Figure11 <- ggarrange(h1 , h2 ,  ncol = 2, nrow = 1)
Figure11


library(ggplot2)
library(ggpubr)
theme_set(theme_pubr())
h1 = ggplot(Stroke,aes(heart_disease, fill = as.factor(stroke)))+
  geom_histogram(aes(y = ..density..))+
  facet_wrap(~as.factor(stroke))+  geom_text(stat = "count", aes(label = after_stat(count)), vjust = -1)+
  ggtitle("Distribution of heart disease by Stroke")+
  theme(plot.title = element_text(hjust = .5))  + theme_gray()

h2 = ggplot(Stroke, aes(hypertension))+
  geom_density(col = "black")+
  geom_histogram(aes(y=..density..), alpha = .3, fill = "blue")+
  facet_grid(as.factor(stroke)~.) +  geom_text(stat = "count", aes(label = after_stat(count)), vjust = -1)+
  ggtitle("Distribution of hypertension by Stroke")+
  theme(plot.title = element_text(hjust = .5)) + theme_gray()
Figure12 <- ggarrange(h1 , h2 ,  ncol = 2, nrow = 1)
Figure12
