##Figure 1 Generate PFC


easythresh lmZ_sex.LandAgeAtScan.nii.gz ../mask.nii.gz 4 0.01 /data/joy/BBL/studies/pnc/template/pnc_template_brain_2mm.nii.gz 4_0.01_sexAge
fslmaths cluster_mask_4_0.01_sexAge.nii.gz -thr 9 -uthr 9 -bin pfc_4_0.01_mask.nii.gz
fslstats -t ../fourd.nii.gz -k pfc_4_0.01_mask.nii.gz -M >> ../mean_pfc_4_0.01.txt

fslmaths lmPadjusted_fdr_sex.LandAgeAtScan.nii.gz -sub 1 -mul -1 -mas ../mask.nii.gz -uthr .95 -bin lmPadjusted_fdr_1minus_mask_sex_Interaction
fslmaths lmZ_sex.LandAgeAtScan.nii.gz -mas lmPadjusted_fdr_1minus_mask_sex_Interaction.nii.gz lmZ_sex.LandAgeAtScan_mask

