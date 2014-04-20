apt-add-repository -y ppa:webupd8team/java
apt-get update

PRESEED_FILE=/tmp/oracle-preseed.txt
# setup preseed
( cat <<'EOP'
oracle-java7-installer shared/present-oracle-license-v1-1 note
oracle-java7-installer oracle-java7-installer/local string
oracle-java7-installer shared/accepted-oracle-license-v1-1 boolean true
EOP
 ) > /tmp/oracle-preseed.txt
debconf-set-selections /tmp/oracle-preseed.txt
apt-get -y install oracle-java7-installer

( cat <<'EOP'
export JAVA_HOME=/usr/lib/jvm/java-7-oracle/
export PATH=${JAVA_HOME}/bin:${PATH}
EOP
 ) > /tmp/set_java_home.sh

chmod 755 /tmp/set_java_home.sh
mv /tmp/set_java_home.sh /etc/profile.d/

sleep 3
