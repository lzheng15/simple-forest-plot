# Plots for SMR and 95% CI of arsenic in ecologica studies for systematic reivew

#set directory to ckid folder
#at home on mac do this:
setwd("/Users/LauraZheng/Documents/Hopkins Classes Stuff/arsenic ckd systematic review")
#work compy
setwd("C:/Users/lzheng/Documents/arsenic ckd systematic review")

#import data to R, save as .rda
ecoplots2 <-  read.csv("C:/Users/lzheng/Documents/arsenic ckd systematic review/forest-plot-eco2.csv", na=" ")
save(ecoplots2,file="ecoplots2.rda")
#load data to R
load("C:/Users/lzheng/Documents/arsenic ckd systematic review/ecoplots2.rda")

#if using the ecoplots2 data, use this for scale
scale<-c(6:1)

#pasting study and country data
study<-paste(ecoplots2$notes)
country<-paste(ecoplots2$country)

#paste together observed and expected
obs_exp<-paste((ecoplots2$Num_obs), "/",(ecoplots2$Num_exp),sep="")

#paste together SMR, and 95% CI
smr95ci<-paste(format(ecoplots2$SMR, digits=2, nsmall=2)," (",format(ecoplots2$SMR_lower,digits=2),",",format(ecoplots2$SMR_upper,digits=3),")",sep="")
#smr95ci[c(1)]<-"SMR (95% CI)"
##################################################start plotting###################################################################################

#par(mfrow=c(1,1),mar=c(4,4,4,2))    #we will plot 2 "plots" and the first one will be left blank, this is the best way to have that empty space for subgroup labels
#plot(ecoplots2$SMR,ecoplots2$cat,type='n',log="x",xlab="test ", ylab="",axes=F,cex.lab=0.7, xlim=c(0.05, 0.2))   #technically this just plots blanks again

##################################################start plotting###################################################################################
par(mar=c(10,38,10,5))
#mtext(side=2, at=2,"Ecological Studies of As and CKD outcomes", font=2,las=1,adj=0, cex=1, line=26)  #title
title(main="Ecological Studies of As and CKD outcomes")

plot(ecoplots2$SMR,ecoplots2$cat,type='n',log="x",xlab="Standardized Mortality Ratio (95% CI)", ylab="",axes=F,cex.lab=0.8, xlim=c(0.9, 3))
abline(v=1,lty=3, lwd =2, col = "black")                                            # dashed red line at OR=1
#abline(v=c(44.5),lty=3, lwd =2, col = "black")                                      # solid blue line at GFR
points(ecoplots2$SMR,ecoplots2$cat,pch=15, col = "black", cex=1.3)                  #plots the points
segments(ecoplots2$SMR_lower,ecoplots2$cat,ecoplots2$SMR_upper,ecoplots2$cat,lty=1,lwd=2, col = 1)    #plots the lines
axis(1,at=c(0.9,1.5,2.0,3.0),labels=c("0.9","1.5","2.0", "3.0"),cex.axis=0.7,font=1,line=1)             #axes


mtext(side=2, at=6, "Study",font=2, las=1,adj=0, cex=1.05, line=30)        # for Study heading
mtext(side=2, at=6, "Country",font=2, las=1,adj=0, cex=1.05, line=20)             # top heading Country
mtext(side=2, at=6, "Obs/Exp",font=2, las=1,adj=0, cex=1.05, line=13.5)             # top heading obs/expected
mtext(side=2, at=6, "SMR (95% CI)",font=2, las=1,adj=0, cex=1.05, line=8)             # top heading for SMR and 95% CI

mtext(side=2,at=scale,study,cex=1.00,font=2,las=1,adj=0, line=30)                  # headings for study
mtext(side=2,at=scale,country,cex=1.00,font=1,las=1,adj=0,line=20)                # headings for country of study
mtext(side=2,at=scale,obs_exp,cex=1.00,font=1,las=1,adj=0,line=13.5)                # gives observed/expected
mtext(side=2,at=scale,smr95ci,cex=1.00,font=1,las=1,adj=0,line=8)                # gives observed/expected


