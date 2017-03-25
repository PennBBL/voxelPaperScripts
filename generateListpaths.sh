cat /home/agarza/voxelPaper/data/fulllist_bblid_scanid_.csv | while read line 
do
  bblid=$(echo $line|cut -d',' -f1);
  scanid=$(echo $line|cut -d',' -f2);  
  path=`ls -d /data/joy/BBL/studies/pnc/processedData/pcasl/pcasl_201607291423/${bblid}/*${scanid}/norm/*ssT1Std.nii.gz`;
  echo $bblid,$scanid,$path >> /home/agarza/voxelPaper/data/fulllist_paths_.csv;
done


                                                                                                                                                                                                                                
