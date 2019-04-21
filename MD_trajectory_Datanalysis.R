setwd('/Users/sayaneshome/Desktop/log_files/')
table1 <- read.delim('ydah_d180_smd.dat',sep =" ")
table2 <- read.delim('ydah_native_trial8_1_dipl.dat',sep =" ")
table3 <- read.delim('ydah_r426_smd01.dat',sep =" ")
table4 <- read.delim('ydah_w400_smd01.dat',sep =" ")
View(table1)
table1 <- subset(table1[1:20000,])
table4 <- subset(table4[1:20000,])
View(table1)
table1$X.1 <- NULL
table2$X.1 <- NULL
table3$X.1 <- NULL
table4$X.1 <- NULL
table4$X <- NULL
table3$X <- NULL
table2$X <- NULL
table1$X <- NULL
View(table1)

names(table1) <- c('time','position','force')
names(table2) <- c('time','position','force')
names(table3) <- c('time','position','force')
names(table4) <- c('time','position','force')
View(table1)
par("mar")
#par(c(1,1,1,1))
par(mar=c(1,1,1,1))
#plot(table1$position,table1$force,xlab = 'coordinate along z-axis',ylab = 'magnitude of force')
#plot(table1$position,table1$force,xlab = 'coordinate along z-axis',ylab = 'magnitude of force',type = 'l')
write.table(table1,'table1_v1_hpnn_native.dat')
write.table(table2,'table2_v1_dipl_f541r.dat')
write.table(table3,'table3_v1_l48f_dipl.dat')
write.table(table4,'table4_v1_f117r_dipl.dat')

table1_h <- read.delim(file = 'smd01_f117r_dipl.dat',sep = ' ')
table2_h <- read.delim(file = 'smd01_f541r_dipl.dat',sep = ' ')
table3_h <- read.delim(file = 'smd01_l48f_dipl.dat',sep = ' ')
table4_h <- read.delim(file = 'smd01_native_dipl.dat',sep = ' ')
names(table1_h) <- c('time','position','force')
names(table2_h) <- c('time','position','force')
names(table3_h) <- c('time','position','force')
names(table4_h) <- c('time','position','force')



#today
tiff('Force_dipl_HpnN.tiff', width = 15, height = 10, units = 'in', res = 500)
plot(table4_h$position[1:3500],table4_h$force[1:3500],type = 'l',col = 'blue', xlab="Position of Diploptene wrt HpnN in Z-axis",ylab="Force applied",cex = 5)
lines(table3_h$position[1:4500],table3_h$force[1:4500],type = 'l',col = 'aquamarine1')
lines(table2_h$position[1:4500],table2_h$force[1:4500],type = 'l',col = 'orange')
lines(table1_h$position[1:4000],table1_h$force[1:4000],type = 'l',col = 'orange')

axis(side = 1, lwd = 2)
axis(side = 2, lwd = 2)
title("Force-position graph in Diploptene transport")
dev.off()


table1 <- read.delim(file = 'ydah_d180_smd01.dat',sep = ' ')
table2 <- read.delim(file = 'ydah_r426_smd01.dat',sep = ' ')
table3 <- read.delim(file = 'ydah_smd01_trial8_1_native.dat',sep = ' ')
table4 <- read.delim(file = 'ydah_w400_smd01.dat',sep = ' ')

names(table1) <- c('time','position','force')
names(table2) <- c('time','position','force')
names(table3) <- c('time','position','force')
names(table4) <- c('time','position','force')

tiff('Force_time_Ydah.tiff', width = 10, height = 10, units = 'in', res = 300)
plot(table3$time[1:15000]/1000,table3$force[1:15000]+674,type = 'l',col = 'aquamarine1',xlab="Time(ps)",ylab="Force",cex = 5)
lines(table4$time[1:15000]/1000,table4$force[1:15000]+674,type = 'l',col = 'orange')
lines(table1$time[1:15000]/1000,table1$force[1:15000]+674,type = 'l',col = 'blue')

#plot(table2$time[1:20000],table2$force[1:20000],type = 'l',col = 'green') #not doing this one
axis(side = 1, lwd = 2)
axis(side = 2, lwd = 2)
title("Force-time graph in Sulfamethazine transport")

dev.off()
