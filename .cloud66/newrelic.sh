# {{Description: This deploy hook will run the following code snippet to automate the installation of NewRelic, and requires the NEWRELIC_KEY environment variable to be set on a stack.}}

UBUNTU_VERSION=$(lsb_release -r | awk '{print $2}')


if [ -z "$NEWRELIC_KEY" ]
then
        >&2 echo "Please set your NEWRELIC_KEY environment variable"
exit 1
fi

case $UBUNTU_VERSION in
16.04 )
    printf "license_key: %s\n" "$NEWRELIC_KEY" | sudo tee -a /etc/newrelic-infra.yml
    curl https://download.newrelic.com/infrastructure_agent/gpg/newrelic-infra.gpg | sudo apt-key add -
    printf "deb [arch=amd64] https://download.newrelic.com/infrastructure_agent/linux/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/newrelic-infra.list
    sudo apt-get update
    sudo apt-get install newrelic-infra -y
    Message="New relic is installed successfully for Ubuntu 16.04"
    echo $Message
    ;;

14.04 )         
    printf "license_key: %s\n" "$NEWRELIC_KEY" | sudo tee -a /etc/newrelic-infra.yml
    curl https://download.newrelic.com/infrastructure_agent/gpg/newrelic-infra.gpg | sudo apt-key add -
    printf "deb [arch=amd64] https://download.newrelic.com/infrastructure_agent/linux/apt trusty main" | sudo tee -a /etc/apt/sources.list.d/newrelic-infra.list
    sudo apt-get update
    sudo apt-get install newrelic-infra -y
    Message="New relic is installed successfully for Ubuntu 14.04"
    echo $Message
    ;;
12.04 )
    printf "license_key: %s\n" "$NEWRELIC_KEY" | sudo tee -a /etc/newrelic-infra.yml
    curl https://download.newrelic.com/infrastructure_agent/gpg/newrelic-infra.gpg | sudo apt-key add -
    printf "deb [arch=amd64] https://download.newrelic.com/infrastructure_agent/linux/apt precise main" | sudo tee -a /etc/apt/sources.list.d/newrelic-infra.list
    sudo apt-get update
    sudo apt-get install newrelic-infra -y
    Message="New relic is installed successfully for Ubuntu 12.04"
    echo $Message
    ;;
 * )
  Message="It seems this version is not supported"
  echo $Message && exit 1
  ;;
esac
