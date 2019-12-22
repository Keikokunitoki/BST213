library(readxl)
data <- read_excel("C:/Users/keiko/Desktop/213final/Datasets/nhanes_s50.xlsx")


data$education <- replace(data$education , data$education ==9, NA)
data$DM <- replace(data$DM , data$DM ==9, NA)
data$DM <- replace(data$DM , data$DM ==7, NA) #refused
data$income <- replace(data$income , data$income ==77, NA) #refused
data$income <- replace(data$income , data$income ==99, NA)
data$predonisone <- replace(data$predonisone , data$predonisone ==9, NA)

class(data$BP)
data$sleep <- as.numeric(data$sleep)
data$BP <- as.numeric(data$BP)
data$Tchol <- as.numeric(data$Tchol)
data$BMI <- as.numeric(data$BMI)
data$Vd25OH23 <- as.numeric(data$Vd25OH23)
data$grip <- as.numeric(data$grip)
data$income <- as.numeric(data$income)
data$alchol <- as.numeric(data$alchol)
data$SMQ040 <- as.numeric(data$SMQ040)


write.csv(data, "C:/Users/keiko/Desktop/213final/Datasets/nhanes_s50m.csv") 

write.excel(object, file = "excel_output.xlsx", indicator = "all",
            MSE = FALSE, CV = FALSE, split = FALSE)

lr1 <- glm(Ost ~ sleep + age + sex + prevfra + BP + DM + Tchol + education + income + BMI + SMQ040 +alchol + race + predonisone + Vd25OH23 + grip, data = data, family = "binomial")
summary(lr1)


hist(data$age)
hist(data$sex)
hist(data$prevfra)
hist(data$BP)
hist(data$DM)
hist(data$Tchol)
hist(data$income)
hist(data$education)
hist(data$BMI)
hist(data$SMQ040)
hist(data$alchol)
hist(data$race)
hist(data$predonisone)
hist(data$Vd25OH23)
hist(data$grip)


lr2 <- glm(Ost ~ sleep + age + prevfra + BP + DM + Tchol + education + income + BMI + alchol + race + predonisone + Vd25OH23 + grip, data = data, family = "binomial")
summary(lr2)

lr3 <- glm(Ost ~ sleep + age + prevfra +  DM + Tchol + education + income + BMI + race + predonisone + grip, data = data, family = "binomial")
summary(lr3)

lr4 <- glm(Ost ~ sleep + age + prevfra  + Tchol +  income + BMI + race + predonisone + grip, data = data, family = "binomial")
summary(lr4)

lr4 <- glm(Ost ~ sleep + age + prevfra  + Tchol + BMI + race + predonisone + grip, data = data, family = "binomial")
summary(lr4)
