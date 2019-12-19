
library(SASxport)
vid <- read.xport("C:/Users/keiko/Desktop/213final/Datasets/VID_H.xpt")
head (vid)
slq <- read.xport("C:/Users/keiko/Desktop/213final/Datasets/SLQ_H.xpt")
deet <- read.xport("C:/Users/keiko/Desktop/213final/Datasets/DEET_H.xpt")
puqmec <- read.xport("C:/Users/keiko/Desktop/213final/Datasets/PUQMEC_H.xpt")
FSQ <- read.xport("C:/Users/keiko/Desktop/213final/Datasets/FSQ_H.xpt")
duq <- read.xport("C:/Users/keiko/Desktop/213final/Datasets/DUQ_H.xpt")
dbq <- read.xport("C:/Users/keiko/Desktop/213final/Datasets/DBQ_H.xpt")
demo <- read.xport("C:/Users/keiko/Desktop/213final/Datasets/DEMO_H.xpt")
bmx <- read.xport("C:/Users/keiko/Desktop/213final/Datasets/BMX_H.xpt")
smq <- read.xport("C:/Users/keiko/Desktop/213final/Datasets/SMQ_H.xpt")
alq <- read.xport("C:/Users/keiko/Desktop/213final/Datasets/ALQ_H.xpt")
rxq <- read.xport("C:/Users/keiko/Desktop/213final/Datasets/RXQ_RX_H.xpt")
dsqtot <- read.xport("C:/Users/keiko/Desktop/213final/Datasets/DSQTOT_H.xpt")
paq <- read.xport("C:/Users/keiko/Desktop/213final/Datasets/PAQ_H.xpt")
mgx <- read.xport("C:/Users/keiko/Desktop/213final/Datasets/MGX_H.xpt")
dxafem <- read.xport("C:/Users/keiko/Desktop/213final/Datasets/DXXFEM_H.xpt")
dxafra <- read.xport("C:/Users/keiko/Desktop/213final/Datasets/DXXFRX_H.xpt")

data <- demo
library(tidyr)
library(dplyr)
data <- data %>% left_join(vid,by="SEQN")
data <- data %>% left_join(slq,by="SEQN")
data <- data %>% left_join(deet,by="SEQN")
data <- data %>% left_join(puqmec,by="SEQN")
data <- data %>% left_join(FSQ,by="SEQN")
data <- data %>% left_join(duq,by="SEQN")
data <- data %>% left_join(dbq,by="SEQN")
data <- data %>% left_join(bmx,by="SEQN")
data <- data %>% left_join(smq,by="SEQN")
data <- data %>% left_join(alq,by="SEQN")
data <- data %>% left_join(dsqtot,by="SEQN")
data <- data %>% left_join(paq,by="SEQN")
data <- data %>% left_join(mgx,by="SEQN")
data <- data %>% left_join(dxafem,by="SEQN")
data <- data %>% left_join(dxafra,by="SEQN")


#total data
write.csv(data, "C:/Users/keiko/Desktop/213final/Datasets/nhanes_total.csv", sep=";" ) 

data <- read.csv("C:/Users/keiko/Desktop/213final/Datasets/nhanes_total.csv") 

#select variables we are going to use
sdata <- data %>%
  select(SLD010H, URXDEE, PUQ100,DXXPRVFX, DXXNKBMD, PUQ110, FSDAD, DUQ200, DBD900, RIDAGEYR, DMDHRGND, BMXBMI, SMQ040, ALQ130, RIDRETH1, DSQTVD, LBXVIDMS, MGDCGSZ)

#selected data
write.csv(sdata, "C:/Users/keiko/Desktop/213final/Datasets/nhanes_select.csv", sep=";" ) 

