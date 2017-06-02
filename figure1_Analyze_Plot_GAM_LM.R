library(mgcv)
library(voxel)


demographics <- readRDS("/home/agarza/voxelPaper/data/voxelPaper_FullSubjDataset.rds")
demographics <- demographics[which(demographics$time1Include == 1), ]

ASL <- read.csv("/home/agarza/voxelPaper/output/n337_asl.path_time1Include_smooth0/mean_pfc_4_0.01.txt", header=F)
names(ASL) <- "pfc.asl"

demographics <- cbind(demographics, ASL)

lmModel <- lm(pfc.asl ~ race2+sex+AgeAtScan*sex+pcaslRelMeanRMSMotion, data=demographics)
gamModel <-gam(pfc.asl ~ race2+sex+s(AgeAtScan)+s(AgeAtScan,by=sex)+pcaslRelMeanRMSMotion, data=demographics)
plotGAM(gamModel, "AgeAtScan", groupCovs = "sex", rawOrFitted = "raw")
