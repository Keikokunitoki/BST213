data <- read.csv("C:/Users/keiko/Desktop/213final/Datasets/nhanes_total.csv") 

#primary ver
data <- mutate(data, Tscore =if((RIDRETH1=="3") && (DMDHRGND=="2")){
  (DXXNKBMD -0.858)/ 0.120
}else{
  0
} )
head(data)


#if test
if ((RIDRETH1=="3") && (DMDHRGND=="2")) {                 
  (DXXNKBMD -0.858)/ 0.120
} else if ((RIDRETH1=="3") && (DMDHRGND=="1")) {
  (DXXNKBMD -0.934)/ 0.137
} else if ((RIDRETH1=="4") && (DMDHRGND=="2")) {
  (DXXNKBMD -0.950)/ 0.133
} else if ((RIDRETH1=="4") && (DMDHRGND=="1")) {
  (DXXNKBMD -1.074)/ 0.168
} else if ((RIDRETH1==c("1","2")) && (DMDHRGND=="2")) {
  (DXXNKBMD -0.874)/ 0.111
} else if ((RIDRETH1==c("1","2")) && (DMDHRGND=="1"))  {
  (DXXNKBMD -0.982)/ 0.137
} else 0

#combine
data <- mutate(data, Tscore =if ((RIDRETH1=="3") && (DMDHRGND=="2")) {                 
  (DXXNKBMD -0.858)/ 0.120
} else if ((RIDRETH1=="3") && (DMDHRGND=="1")) {
  (DXXNKBMD -0.934)/ 0.137
} else if ((RIDRETH1=="4") && (DMDHRGND=="2")) {
  (DXXNKBMD -0.950)/ 0.133
} else if ((RIDRETH1=="4") && (DMDHRGND=="1")) {
  (DXXNKBMD -1.074)/ 0.168
} else if ((RIDRETH1==c("1","2")) && (DMDHRGND=="2")) {
  (DXXNKBMD -0.874)/ 0.111
} else if ((RIDRETH1==c("1","2")) && (DMDHRGND=="1"))  {
  (DXXNKBMD -0.982)/ 0.137
}else{
  0
} )

head(data)
data$Tscore

data$Tscore <- as.numeric(data$Tscore)

write.csv(data, "C:/Users/keiko/Desktop/213final/Datasets/nhanes_T.csv", sep=";" ) 



#Add osteoporosis
data <- mutate(data, Osteo =if (Tscore<-2.5) {                 
  2
} else if ((Tscore>-2.5) && (Tscore<-1)) {
  1
} else if (Tscore>-1) {
  0
}else{
  9
} )

head(data)
data$Osteo



sdata <- mutate(sdata, Tscore =if ((RIDRETH1=="3") && (DMDHRGND=="2")) {                 
  (DXXNKBMD -0.858)/ 0.120
} else if ((RIDRETH1=="3") && (DMDHRGND=="1")) {
  (DXXNKBMD -0.934)/ 0.137
} else if ((RIDRETH1=="4") && (DMDHRGND=="2")) {
  (DXXNKBMD -0.950)/ 0.133
} else if ((RIDRETH1=="4") && (DMDHRGND=="1")) {
  (DXXNKBMD -1.074)/ 0.168
} else if ((RIDRETH1==c("1","2")) && (DMDHRGND=="2")) {
  (DXXNKBMD -0.874)/ 0.111
} else if ((RIDRETH1==c("1","2")) && (DMDHRGND=="1"))  {
  (DXXNKBMD -0.982)/ 0.137
}else{
  0
} )


write.csv(sdata, "C:/Users/keiko/Desktop/213final/Datasets/nhanes_sel_T.csv", sep=";" ) 

#re-read the datadatas <- read.csv("C:/Users/keiko/Desktop/213final/Datasets/nhanes_sel_T.csv")


#filter NA row
dataf <- data %>%  filter(!is.na(Tscore))
datasf <- datas %>%  filter(!is.na(Tscore))

#write into csv
write.csv(dataf, "C:/Users/keiko/Desktop/213final/Datasets/nhanes_fil.csv", sep=";" ) 
write.csv(datasf, "C:/Users/keiko/Desktop/213final/Datasets/nhanes_sel_fil.csv", sep=";" ) 
