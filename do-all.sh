echo "In do-all.sh"

mendixOperatorVersion=2.10.1
#os=linux-amd64
os=macos-amd64

. ./get-creds.sh

echo https://cdn.mendix.com/mendix-for-private-cloud/mxpc-cli/mxpc-cli-$mendixOperatorVersion-$os.tar.gz
wget https://cdn.mendix.com/mendix-for-private-cloud/mxpc-cli/mxpc-cli-$mendixOperatorVersion-$os.tar.gz
tar xvf mxpc-cli-$mendixOperatorVersion-$os.tar.gz

