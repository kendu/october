#!/bin/bash

################################################################################
#                                                                              #
#                                 {o,o}                                        #
#                                 |)__)                                        #
#                                 -"-"-                                        #
#                                                                              #
################################################################################
#
# The first time setup script
#
##############################---VARIABLES---###################################

REAL_USER_ID=$( id -u ${USER} )

################################################################################

#################################---ENV---######################################

set +x
set +u
set +e

################################################################################

###############################---EXECUTION---##################################

echo "
******************************************************************************

Hello, I'm your little helper for first time setup
"


if which fig;
then
    echo ""
    echo "Fig found."
else
    echo ""
    echo "> Fig not found on the system. Please install fig first.
    The recommended way of installation is via pip"
fi;

#Run the integration script
docker run \
--rm \
-v $(pwd):/opt/web \
-w /opt/web  \
kendu/projectbuilder \
bash -c "/opt/web/provision/preBuild ${REAL_USER_ID}"

if [[ -z $(fig ps -q) ]]; then
    echo "> Raising containers (and leaving them running in the background)"
    fig up -d
else
    echo "> Starting any stopped containers"
    fig start
fi;

#Provision
./provision/provisionDeploy

#Start proxy
docker run \
    -d \
    --restart always \
    --name proxy \
    -p 80:80 \
    -v /var/run/docker.sock:/tmp/docker.sock \
    jwilder/nginx-proxy || true

echo "> All done."

exit 0;

################################################################################
