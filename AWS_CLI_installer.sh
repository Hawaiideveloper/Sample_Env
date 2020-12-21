#!/bin/bash


curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws


#See if $PATH contains ~/bin (output will be empty if it doesn't)
echo $PATH | grep ~/bin
echo "Did you see a path above?"

#Add ~/bin to $PATH if necessary
export PATH=~/bin:$PATH   
echo "if not, it was added here ^ "


# Activate the new installed package
source ~/.bash_profile
echo "it has been sourced and is ready for use"


# Check that it is installed correctly
aws --version


echo "curl -LJO https://raw.githubusercontent.com/Hawaiideveloper/Sample_Env/blob/main/aws_creds_configure_step2.sh && chmod +x aws_creds_configure_step2.sh && ./aws_creds_configure_step2.sh"

echo "The above script can be pasted if you want to configure your credentials immediately"

