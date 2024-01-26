# config hook path
git config core.hooksPath hooks
echo '##### CREATING SCRATCH ORG #####'
SCRATCH_ALIAS=$1
PROJECT_NAME=${PWD##*/}
SCRATCH_ALIAS="${SCRATCH_ALIAS:-$PROJECT_NAME-`git branch | grep \* | cut -d ' ' -f2`}" 
sf org create scratch --definition-file config/project-scratch-def.json --alias $SCRATCH_ALIAS --set-default
echo '##### CREATING PROFILES #####'
sf texei skinnyprofile create --target-org $SCRATCH_ALIAS
echo '##### PUSHING METADATA #####'
sf project deploy start --ignore-conflicts --target-org $SCRATCH_ALIAS
echo '##### ASSIGNING PERMISSIONS #####'
sf org assign permset --name Third_Party_Web_Components --target-org $SCRATCH_ALIAS
echo '##### IMPORTING DUMMY DATA #####'
sf texei data import --inputdir ./data --target-org $SCRATCH_ALIAS
echo '##### CLEANING STANDARD LAYOUTS #####'
sf texei source layouts cleanorg --target-org $SCRATCH_ALIAS
echo '##### OPENING SCRATCH ORG #####'
sf org open --path /lightning/n/Third_Party_Web_Component --target-org $SCRATCH_ALIAS