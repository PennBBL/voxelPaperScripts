### Read in 404 Clinical Data
data404 <- read.csv("~/voxelPaper//data//n404_dti_go1_go2_covariates.csv")
data404 <- data404[,-1]

### Read in T1QA Data
datat1qa <- read.csv("~/voxelPaper/data/n2416_t1QaData_20170306.csv")

### Read in ASLQA
datacbfqa <- read.csv("~/voxelPaper//data//n2416_PcaslQaData_20170306.csv")

##Diagnosis Information
dataHealth <- read.csv("~/voxelPaper/data/n1601_health_20161214.csv")
dataHealth <- dataHealth[c("bblid", "ltnExcludev2")]

dataSub <- merge(datat1qa, data404, by=c("bblid","scanid"))
dataSub <- merge(dataSub, datacbfqa, by=c("bblid","scanid"))
dataSub <- merge(dataSub, dataHealth, by=c("bblid"))

dataSub <- dataSub[which(dataSub$ltnExcludev2 == 0), ]
dataSub <- dataSub[which(dataSub$t1Exclude == 0), ]
dataSub <- dataSub[which(dataSub$pcaslExclude == 0), ]
dataSub <- dataSub[which(dataSub$AgeAtScan > 12*11),]

freq <- as.data.frame(table(dataSub$bblid))
bblid  <- freq$Var1[which(freq$Freq == 2)]
dataSub <- dataSub[dataSub$bblid %in% bblid,]


set.seed(1)

bblid.final <- sample(dataSub$bblid[which(dataSub$timepoint == 1 & dataSub$sex == "1")], 100)
bblid.final <- c(bblid.final,sample(dataSub$bblid[which(dataSub$timepoint == 1 & dataSub$sex == "2")], 100))

dataSub <- dataSub[dataSub$bblid %in% bblid.final,]
dataSub$AgeAtScan <- dataSub$AgeAtScan / 12
dataSub$sex <- ordered(dataSub$sex)
dataSub$race2[which(dataSub$race2 == 3)] <- 2
dataSub$race2 <- as.factor(dataSub$race2)

dataSub$time1Include <- 0
dataSub$time1Include[which(dataSub$timepoint == 1)] <- 1

dataSub$timebothInclude <- 1

#write.table(dataSub[c("bblid","scanid")],"~/voxelPaper/data/list400_bblid_scanid_.csv", row.names=F, col.names=F, sep=",")

dataPaths <- read.csv("~/voxelPaper/data/list400_paths_.csv", header=F,as.is=T)
names(dataPaths) <- c("bblid","scanid","asl.path")

dataSub <- merge(dataSub, dataPaths, by=c("bblid","scanid"))

saveRDS(dataSub, "~/voxelPaper/data/voxelPaper_SubjDataset.rds")


