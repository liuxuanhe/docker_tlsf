#sed -i '1,38s/IP0=\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}/IP0=127.0.0.1/g' /TLsf/workspace/tlbb/Server/Config/ServerInfo.ini
#sed -i '1,38s/Port0=[0-9]\{1,5\}/Port0=21818/g' /TLsf/workspace/tlbb/Server/Config/ServerInfo.ini
#sed -i '40,66s/IP0=\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}/IP0=127.0.0.1/g' /TLsf/workspace/tlbb/Server/Config/ServerInfo.ini
#sed -i '40,66s/Port0=[0-9]\{1,5\}/Port0=15680/g' /TLsf/workspace/tlbb/Server/Config/ServerInfo.ini
#sed -i '68,$s/IP0=\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}/IP0=127.0.0.1/g' /TLsf/workspace/tlbb/Server/Config/ServerInfo.ini
#sed -i '68,$s/Port0=[0-9]\{1,5\}/Port0=13580/g' /TLsf/workspace/tlbb/Server/Config/ServerInfo.ini
#
#
#sed -i 's/DBIP=\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}/DBIP=tlbbdb/g' /TLsf/workspace/tlbb/Server/Config/LoginInfo.ini
#sed -i 's/DBPort=[0-9]\{1,5\}/DBPort=3306/g' /TLsf/workspace/tlbb/Server/Config/LoginInfo.ini
#
#sed -i '/^DBName=\(\.\)\{1,\}/d' /TLsf/workspace/tlbb/Server/Config/LoginInfo.ini
#sed -i '5aDBName=tlbbdb' /TLsf/workspace/tlbb/Server/Config/LoginInfo.ini
#
#sed -i '/^DBUser=\(\.\)\{1,\}/d' /TLsf/workspace/tlbb/Server/Config/LoginInfo.ini
#sed -i '6aDBUser=root' /TLsf/workspace/tlbb/Server/Config/LoginInfo.ini
#
#sed -i '/^DBPassword=\(\.\)\{1,\}/d' /TLsf/workspace/tlbb/Server/Config/LoginInfo.ini
#sed -i '7iDBPassword=123456' /TLsf/workspace/tlbb/Server/Config/LoginInfo.ini
#
#sed -i 's/DBIP=\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}/DBIP=127.0.0.1/g' /TLsf/workspace/tlbb/Server/Config/ShareMemInfo.ini
#sed -i 's/DBPort=[0-9]\{1,5\}/DBPort=3306/g' /TLsf/workspace/tlbb/Server/Config/ShareMemInfo.ini
#
#sed -i '/^DBName=\(\.\)\{1,\}/d' /TLsf/workspace/tlbb/Server/Config/ShareMemInfo.ini
#sed -i '4aDBName=tlbbdb' /TLsf/workspace/tlbb/Server/Config/ShareMemInfo.ini
#
#sed -i '/^DBUser=*/d' /TLsf/workspace/tlbb/Server/Config/ShareMemInfo.ini
#sed -i '5aDBUser=root' /TLsf/workspace/tlbb/Server/Config/ShareMemInfo.ini
#
#sed -i '/^DBPassword=*/d' /TLsf/workspace/tlbb/Server/Config/ShareMemInfo.ini
#sed -i '6iDBPassword=123456' /TLsf/workspace/tlbb/Server/Config/ShareMemInfo.ini
#
#yum -y install dos2unix && dos2unix /TLsf/workspace/tlbb/Server/Config/ShareMemInfo.ini && dos2unix /TLsf/workspace/tlbb/Server/Config/LoginInfo.ini
tar zxf ini.tar.gz -C /TLsf/workspace/tlbb/Server/Config && chmod -R 777 /TLsf/workspace && chown -R root:root /TLsf/workspace