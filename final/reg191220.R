#filter age 50 or more
data50 <- dataf %>% filter(RIDAGEYR>=50)

#replace missing values
data50$SLD010H <- replace(data50$SLD010H , data50$SLD010H ==99, NA)
data50$DBD900 <- replace(data50$DBD900 , data50$DBD900 ==9999, NA)
data50$ALQ130 <- replace(data50$ALQ130 , data50$ALQ130 ==999, NA)
plot(data50$RIDAGEYR, data50$DBD900)


#binary
data50 <-  mutate(data50, Ost = if_else(Tscore >-2.5, true = 0, false = 1))

#write
write.csv(data50, "C:/Users/keiko/Desktop/213final/Datasets/nhanes_50.csv", sep=";" ) 

#selected file
datas50 <- data50 %>%
  select(Tscore, Ost, SLD010H, URXDEE, PUQ100,DXXPRVFX, DXXNKBMD,PAQ722, BPXSY2, DIQ010, LBXTC, DMDEDUC2, INDHHIN2,  PUQ110, FSDAD, DUQ200, DBD900, RIDAGEYR, DMDHRGND, BMXBMI, SMQ040, ALQ130, RIDRETH1, DSQTVD, OSQ130, LBXVIDMS, MGDCGSZ)

write.csv(datas50, "C:/Users/keiko/Desktop/213final/Datasets/nhanes_s50.csv" ) 





fitf <- lm(Tscore~ FSDAD + RIDAGEYR + DMDHRGND + BMXBMI + DXXPRVFX +SMQ040 + ALQ130 + RIDRETH1 + DSQTVD +DSQTCALC+ LBXVIDMS + MGDCGSZ, data=data50)
summary(fitf)


fitp <- lm(Tscore~ DBD900 + RIDAGEYR + DMDHRGND + BMXBMI + DXXPRVFX +SMQ040 + ALQ130 + RIDRETH1 + DSQTVD +DSQTCALC+ LBXVIDMS + MGDCGSZ, data=data50)
summary(fitp)


fit <- lm(Tscore~ SLD010H + RIDAGEYR + DMDHRGND + BMXBMI + DXXPRVFX +SMQ040 + ALQ130 + RIDRETH1 + DSQTVD +DSQTCALC+ LBXVIDMS + MGDCGSZ, data=data50)
summary(fit)


#interaction
fit1 <- lm(Tscore~ DBD900 + RIDAGEYR + DMDHRGND + BMXBMI + DXXPRVFX +SMQ040 + ALQ130 + RIDRETH1 + DSQTVD +DSQTCALC+ LBXVIDMS + MGDCGSZ + RIDAGEYR:DBD900 + BMXBMI:DBD900, data=data50)
summary(fit1)












mylogit <- glm(admit ~ gre + gpa + rank, data = mydata, family = "binomial")

logp <- glm(Ost~ DBD900 + RIDAGEYR + DMDHRGND + BMXBMI + DXXPRVFX +SMQ040 + ALQ130 + RIDRETH1 + DSQTVD +DSQTCALC+ LBXVIDMS + MGDCGSZ, data=data50, family = "binomial")
summary(logp)


logp <- glm(Ost~ DBD900 + RIDAGEYR + DMDHRGND + BMXBMI + DXXPRVFX +SMQ040 + ALQ130 + RIDRETH1 + DSQTVD +DSQTCALC+ LBXVIDMS + MGDCGSZ, data=data50, family = "binomial")
summary(logp)

logs <- glm(Ost~ SLD010H + RIDAGEYR + DMDHRGND + BMXBMI + DXXPRVFX +SMQ040 + ALQ130 + RIDRETH1 + DSQTVD +DSQTCALC+ LBXVIDMS + MGDCGSZ, data=data50, family = "binomial")
summary(logs)

logp <- glm(Ost~ FSDAD + RIDAGEYR + DMDHRGND + BMXBMI + DXXPRVFX +SMQ040 + ALQ130 + RIDRETH1 + DSQTVD +DSQTCALC+ LBXVIDMS + MGDCGSZ, data=data50, family = "binomial")
summary(logp)