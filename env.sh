export PATH=$PATH:.
echo $PATH 


## Used in configure.sh
## only required for connected mode -i and -s parameter
## mxpc-cli base-install --namespace mendix  -i $MENDIX_CONFIG_IVAL -s $MENDIX_CONFIG_SVAL --clusterMode connected  --clusterType generic
export MENDIX_CONFIG_IVAL="TODO:REPLACE-ME"
export MENDIX_CONFIG_SVAL="TODO:REPLACE-ME"

## Registry config - configure-template.yaml is updated with this information
export MENDIX_REGISTRY_PULL_URL="TODO:REPLACE-ME"
export MENDIX_REGISTRY_PUSH_URL="TODO:REPLACE-ME"
export MENDIX_REGISTRY_NAME=""
export MENDIX_AUTH_USER=""
export MENDIX_AUTH_PW=""

# Switch for Minio and Postgres install - Y or N
export INSTALL_POSTGRES_MINIO="N"
#Passwords for Postgres and Minio
export MINIO_PW=""
export POSTGRES_PW=""

# Location of the MDA file. This will be used to generate the demo.yaml by generate-yaml.sh
export MENDIX_DEMO_MDA="https:\/\/TODO:REPLACE-ME\/Main+line-0.0.0.6.mda"

# Mendix namespace
export MENDIX_NAMESPACE=mendix

# Used in do-all.sh to download the right mxpc-cli version
mendixOperatorVersion=2.10.1
os=macos-amd64
