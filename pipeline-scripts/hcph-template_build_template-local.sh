#!/usr/bin/env bash -l

#########################################################################################################################################
########################################## Main program #################################################################################
#########################################################################################################################################
# How to run:
# sh pipeline-scripts/hcph-template_build_template-local.sh ~/data/hcph-template/multivar-v00/derivatives/allInRef-noskull-i4

#path_to_data="/Users/acionca/data/hcph-template/multivar-v00/derivatives/allInRef-noskull-i4"

path_to_data=$1
cd $path_to_data

first_line=$( head -n 1 templateInput-HPC.csv )
first_t1=$( cut -d "," -f 1 <<< $first_line)
first_t2=$( cut -d "," -f 2 <<< $first_line)

# Setup for building in MNI, uncomment below to use MNI template as reference
# path_to_mni="~/data/hcph-template/mni_template"
# mni_template=$path_to_mni"/mni_template-res0.8mm.nii.gz"

path_to_script="/Users/acionca/code/hcph-template/interpolation/pipeline-scripts"

bash $path_to_script/antsMultivariateTemplateConstruction2-mod.sh -d 3 -b 1 -i 4 -k 2 -A 0 -f 6x4x2x1 -s 4x2x1x0vox -q 100x100x70x20 -t Affine -m MI -c 0 -n 0 \
	-o A_tpl_ -z $first_t1 -z $first_t2 -y 0 -r 1 templateInput-HPC.csv
