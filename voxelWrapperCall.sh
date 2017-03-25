qloginp5 -l h_vmem=30.5G,s_vmem=30.0G

# run after qlogin session starts
# Run GAM

subjDataName="/home/agarza/voxelPaper/data/voxelPaper_SubjDataset.rds"
OutDirRoot="/home/agarza/voxelPaper/output"
namePaths="asl.path"
maskName="/home/agarza/voxelPaper/data/n1601_PcaslCoverageMask_GM.nii.gz"
smooth=0
inclusionName="time1Include"
subjID="bblid"
covsFormula="~race2+sex+s(AgeAtScan)+s(AgeAtScan,by=sex)+pcaslRelMeanRMSMotion"
logfile="/home/agarza/voxelPaper/output/logFiles"
errfile="/home/agarza/voxelPaper/output/logFiles"

Rscript /data/joy/BBL/applications/groupAnalysis/version3/gam_voxelwise.R -c $subjDataName -o $OutDirRoot -p $namePaths -m $maskName -i $inclusionName -u $subjID -f $covsFormula -n 5 -s 0 -r TRUE -d FALSE -a "fdr"

# Run LM

subjDataName="/home/agarza/voxelPaper/data/voxelPaper_SubjDataset.rds"
OutDirRoot="/home/agarza/voxelPaper/output"
namePaths="asl.path"
maskName="/home/agarza/voxelPaper/data/n1601_PcaslCoverageMask_GM.nii.gz"
smooth=0
inclusionName="time1Include"
subjID="bblid"
covsFormula="~race2+sex+AgeAtScan*sex+pcaslRelMeanRMSMotion"
logfile="/home/agarza/voxelPaper/output/logFiles"
errfile="/home/agarza/voxelPaper/output/logFiles"

Rscript /data/joy/BBL/applications/groupAnalysis/version3/lm_voxelwise.R -c $subjDataName -o $OutDirRoot -p $namePaths -m $maskName -i $inclusionName -u $subjID -f $covsFormula -n 5 -s 0 -r TRUE -d TRUE -a "fdr"


# Run LMER

subjDataName="/home/agarza/voxelPaper/data/voxelPaper_SubjDataset.rds"
OutDirRoot="/home/agarza/voxelPaper/output"
namePaths="asl.path"
maskName="/home/agarza/voxelPaper/data/n1601_PcaslCoverageMask_GM.nii.gz"
smooth=0
inclusionName="timebothInclude"
subjID="scanid"
covsFormula="~race2+sex+AgeAtScan*sex+pcaslRelMeanRMSMotion+(1|bblid)"
logfile="/home/agarza/voxelPaper/output/logFiles"
errfile="/home/agarza/voxelPaper/output/logFiles"

Rscript /data/joy/BBL/applications/groupAnalysis/version3/lmer_voxelwise.R -c $subjDataName -o $OutDirRoot -p $namePaths -m $maskName -i $inclusionName -u $subjID -f $covsFormula -n 5 -s 0 -r TRUE -a "fdr"

# Run GAMM

subjDataName="/home/agarza/voxelPaper/data/voxelPaper_SubjDataset.rds"
OutDirRoot="/home/agarza/voxelPaper/output"
namePaths="asl.path"
maskName="/home/agarza/voxelPaper/data/n1601_PcaslCoverageMask_GM.nii.gz"
smooth=0
inclusionName="timebothInclude"
subjID="scanid"
covsFormula="~race2+sex+s(AgeAtScan)+s(AgeAtScan,by=sex)+pcaslRelMeanRMSMotion"

randomForm="~(1|bblid)"
logfile="/home/agarza/voxelPaper/output/logFiles"
errfile="/home/agarza/voxelPaper/output/logFiles"

Rscript /data/joy/BBL/applications/groupAnalysis/version3/gamm4_voxelwise.R -c $subjDataName -o $OutDirRoot -p $namePaths -m $maskName -i $inclusionName -u $subjID -f $covsFormula -e $randomForm -n 5 -s 0 -r TRUE -d TRUE -a "fdr"

###Run with Full Sample

# Run GAM

subjDataName="/home/agarza/voxelPaper/data/voxelPaper_FullSubjDataset.rds"
OutDirRoot="/home/agarza/voxelPaper/output"
namePaths="asl.path"
maskName="/home/agarza/voxelPaper/data/n1601_PcaslCoverageMask_GM.nii.gz"
smooth=0
inclusionName="time1Include"
subjID="bblid"
covsFormula="~race2+sex+s(AgeAtScan)+s(AgeAtScan,by=sex)+pcaslRelMeanRMSMotion"
logfile="/home/agarza/voxelPaper/output/logFiles"
errfile="/home/agarza/voxelPaper/output/logFiles"

Rscript /data/joy/BBL/applications/groupAnalysis/version3/gam_voxelwise.R -c $subjDataName -o $OutDirRoot -p $namePaths -m $maskName -i $inclusionName -u $subjID -f $covsFormula -n 5 -s 0 -r TRUE -d FALSE -a "fdr"

###Run with Full Sample

# Run LM

subjDataName="/home/agarza/voxelPaper/data/voxelPaper_FullSubjDataset.rds"
OutDirRoot="/home/agarza/voxelPaper/output"
namePaths="asl.path"
maskName="/home/agarza/voxelPaper/data/n1601_PcaslCoverageMask_GM.nii.gz"
smooth=0
inclusionName="time1Include"
subjID="bblid"
covsFormula="~race2+sex+AgeAtScan*sex+pcaslRelMeanRMSMotion"
logfile="/home/agarza/voxelPaper/output/logFiles"
errfile="/home/agarza/voxelPaper/output/logFiles"

Rscript /data/joy/BBL/applications/groupAnalysis/version3/lm_voxelwise.R -c $subjDataName -o $OutDirRoot -p $namePaths -m $maskName -i $inclusionName -u $subjID -f $covsFormula -n 5 -s 0 -r TRUE -d TRUE -a "fdr"

# Run LMER

subjDataName="/home/agarza/voxelPaper/data/voxelPaper_FullSubjDataset.rds"
OutDirRoot="/home/agarza/voxelPaper/output"
namePaths="asl.path"
maskName="/home/agarza/voxelPaper/data/n1601_PcaslCoverageMask_GM.nii.gz"
smooth=0
inclusionName="timebothInclude"
subjID="scanid"
covsFormula="~race2+sex+AgeAtScan*sex+pcaslRelMeanRMSMotion+(1|bblid)"
logfile="/home/agarza/voxelPaper/output/logFiles"
errfile="/home/agarza/voxelPaper/output/logFiles"

Rscript /data/joy/BBL/applications/groupAnalysis/version3/lmer_voxelwise.R -c $subjDataName -o $OutDirRoot -p $namePaths -m $maskName -i $inclusionName -u $subjID -f $covsFormula -n 5 -s 0 -r TRUE -d TRUE -a "fdr"

# Run GAMM

subjDataName="/home/agarza/voxelPaper/data/voxelPaper_FullSubjDataset.rds"
OutDirRoot="/home/agarza/voxelPaper/output"
namePaths="asl.path"
maskName="/home/agarza/voxelPaper/data/n1601_PcaslCoverageMask_GM.nii.gz"
smooth=0
inclusionName="timebothInclude"
subjID="scanid"
covsFormula="~race2+sex+s(AgeAtScan)+s(AgeAtScan,by=sex)+pcaslRelMeanRMSMotion"

randomForm="~(1|bblid)"
logfile="/home/agarza/voxelPaper/output/logFiles"
errfile="/home/agarza/voxelPaper/output/logFiles"

Rscript /data/joy/BBL/applications/groupAnalysis/version3/gamm4_voxelwise.R -c $subjDataName -o $OutDirRoot -p $namePaths -m $maskName -i $inclusionName -u $subjID -f $covsFormula -e $randomForm -n 5 -s 0 -r TRUE -d TRUE -a "fdr"

# Run GAM with unpenalized

subjDataName="/home/agarza/voxelPaper/data/voxelPaper_FullSubjDataset.rds"
OutDirRoot="/home/agarza/voxelPaper/output"
namePaths="asl.path"
maskName="/home/agarza/voxelPaper/data/n1601_PcaslCoverageMask_GM.nii.gz"
smooth=0
inclusionName="time1Include"
subjID="bblid"
covsFormula="~race2+sex+s(AgeAtScan,k=4,fx=T)+s(AgeAtScan,fx=T,k=4,by=sex)+pcaslRelMeanRMSMotion"
logfile="/home/agarza/voxelPaper/output/logFiles"
errfile="/home/agarza/voxelPaper/output/logFiles"

Rscript /data/joy/BBL/applications/groupAnalysis/version3/gam_voxelwise.R -c $subjDataName -o $OutDirRoot -p $namePaths -m $maskName -i $inclusionName -u $subjID -f $covsFormula -n 5 -s 0 -r TRUE -d TRUE -a "fdr"




