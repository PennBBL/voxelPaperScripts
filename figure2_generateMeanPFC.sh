##Figure 2 Generate PFC Cluster 

easythresh lmerZ_sex.LandAgeAtScan.nii.gz ../mask.nii.gz 5 0.01 /data/joy/BBL/studies/pnc/template/pnc_template_brain_2mm.nii.gz 5_0.01_sexAge
fslmaths cluster_mask_5_0.01_sexAge.nii.gz -thr 94 -uthr 94 -bin pfc_5_0.01_mask.nii.gz
fslstats -t ../fourd.nii.gz -k pfc_5_0.01_mask.nii.gz -M >> ../mean_pfc_5_0.01.txt

fslmaths lmerPadjusted_fdr_sex.LandAgeAtScan.nii.gz -sub 1 -mul -1 -mas ../mask.nii.gz -uthr .95 -bin lmerPadjusted_fdr_1minus_mask_sex_Interaction
fslmaths lmerZ_sex.LandAgeAtScan.nii.gz -mas lmerPadjusted_fdr_1minus_mask_sex_Interaction.nii.gz lmerZ_sex.LandAgeAtScan_mask

