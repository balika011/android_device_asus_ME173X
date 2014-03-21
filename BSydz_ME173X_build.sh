#!/bin/bash

# Colors and text parameters
NC=$(tput sgr0) # No Color
Bold=$(tput bold)
Red=$(tput setaf 1)
Yellow=$(tput bold ; tput setaf 3)
BoldBlue=${Bold}$(tput setaf 4)

# we don't allow scrollback buffer
echo -e '\0033\0143'
clear



echo -e "${Yellow}===============================================${txtrst}";
echo -e "${Yellow}=                                             =${txtrst}";
echo -e "${Yellow}=                                             =${txtrst}";
echo -e "${Yellow}=                                             =${txtrst}";
echo -e "${Yellow}=                                             =${txtrst}";
echo -e "${Yellow}=        BSydz ME173X ROM Build Script        =${txtrst}";
echo -e "${Yellow}=                                             =${txtrst}";
echo -e "${Yellow}=                                             =${txtrst}";
echo -e "${Yellow}=                                             =${txtrst}";
echo -e "${Yellow}=                                             =${txtrst}";
echo -e "${Yellow}===============================================${txtrst}";

echo -e "${NC}"


# use ccache to speed up builds
export USE_CCACHE=1

# get time of startup
res1=$(date +%s.%N)

echo -e "${BoldBlue}     ==================================${txtrst}";
echo -e "${BoldBlue}     l                                l${txtrst}";
echo -e "${BoldBlue}     l                                l${txtrst}";
echo -e "${BoldBlue}     l      Building ME173X ROM       l${txtrst}";
echo -e "${BoldBlue}     l                                l${txtrst}";
echo -e "${BoldBlue}     l                                l${txtrst}";
echo -e "${BoldBlue}     ==================================${txtrst}";

echo -e "${NC}"

# setup environment
echo -e "${Red}     Setting up environment and brunching    ${txtrst}"

echo -e "${NC}"

. build/envsetup.sh && brunch cm_ME173X-eng -j4

# finished? get elapsed time
res2=$(date +%s.%N)
echo -e "${Red}               Finished Build               ${txtrst}"
echo "${Yellow}Total time elapsed: ${txtrst}${Yellow}$(echo "($res2 - $res1) / 60"|bc ) minutes ($(echo "$res2 - $res1"|bc ) seconds) ${txtrst}"

echo -e "${NC}"
