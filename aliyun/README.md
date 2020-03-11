## 全新手工架设环境开服食用指南

### 告别虚拟机开服🎉，告别win机装虚拟机开服🎉，告别win机+Linux机开服🎉。没错你没听错，只需要一个Linux机就可以开服。市面上最小开服的配置机器即可开服

### 唯一群号：826717146

- #### 先装一个最新的centos7.x系统64位以上（不支持CentOs6）。系统安装过程不进行演示，系统安装完成后执行以下几条命令。

```shell
# step 1:关闭系统防火墙以及selinux子系统安全设置
systemctl stop firewalld && systemctl disable firewalld
sed -i 's#SELINUX=enforcing#SElINUX=disabled#g' /etc/selinux/config

# step 2: 更新系统组件并安装必要的一些系统工具
sudo yum -y update && yum install -y epel-release yum-utils device-mapper-persistent-data lvm2 wget git vim
# Step 3: 添加软件源信息
sudo yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
# Step 4: 更新并安装Docker-CE
sudo yum makecache fast && sudo yum -y install docker-ce docker-compose && systemctl enable docker && sudo systemctl start docker && sudo reboot

sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://f0tv1cst.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

# step 5: 重启服务器完成后，执行一键执行环境下载
cd ~ && git clone https://gitee.com/yulinzhihou/docker_tlsf.git tlsf && chmod -R 777 ~/tlsf && cd ~/tlsf/aliyun && cp env-example .env
# step 6: 执行部署命令,一键安装环境，等待10-20分钟左右，出现
docker-compose up -d

# 出现如下表示已经安装完成
Successfully built cdab3aeef0cd
Successfully tagged yulinzhihou/tlsf_gs:v0.1
Creating tlsf_tlbbdb_1      ... done
Creating tlsf_webdb_1       ... done
Creating tlsf_webdb_1       ... 
Creating tlsf_game_server_1 ... done
```

- #### 服务端配置

```SHELl
# step 1: 上传billing服务到指定目录/TLsf/workspace
mkdir -p /TLsf/workspace/billing
# 将billing文件与config.json文件一同上传到以上创建的目录里面 /TLsf/workspace/billing
cd ~/tlsf && tar zxf billingSer.tar.gz -C /TLsf/workspace/billing && chown -R root:root /TLsf/workspace/billing && chmod -R 777 /TLsf/workspace/billing
# 修改config.json文件 webdb数据库的端口和用户名，密码

# step 2：上传服务端tlbb.tar.gz或者tlbb.zip并解压到指定目录/TLsf/workspace
cd ~ && tar zxf tlbb.tar.gz -C /TLsf/workspace && chmod -R 777 /TLsf/workspace
#如果是zip格式的执行下面命令
sudo yum -y install unzip && unzip tlbb.zip -d /TLsf/workspace && chmod -R 777

# step 3: 复制配置文件到服务端里面替换，LoginInfo.ini ServerInfo.ini ShareMemInfo.ini
cd ~/tlsf/aliyun/scripts && ./modify_ini_config.sh
# step 4 : 开启验证
cd ~/tlsf/aliyun/scripts && ./ssh-server.sh
# 与上面命令分开复制
cd ../billing && ./billing &

# step 5 : 开服
cd ~/tlsf/aliyun/scripts && ./ssh-server.sh
# 与上面命令分开复制
./run.sh

# 或者使用分部方式进行调试
# 打开窗口1
cd ~/tlsf/aliyun/scripts && ./ssh-server.sh
cd ../billing && ./billing &
# 打开窗口2
cd ~/tlsf/aliyun/scripts && ./ssh-server.sh
cd Server && ./shm start
# 打开窗口3
cd ~/tlsf/aliyun/scripts && ./ssh-server.sh
cd Server && ./Login
# 打开窗口4
cd ~/tlsf/aliyun/scripts && ./ssh-server.sh
cd Server && ./World
# 打开窗口5
cd ~/tlsf/aliyun/scripts && ./ssh-server.sh
cd Server && ./Server

# step 4 ：至此服务端环境全部搭建完成，loginPort 13580 gamePort 15680
# 配置登录器，或者单机登录即可
```

- #### 查看是否一键开服成功，分开窗口可以不需要查看，因为一旦报错，相关窗口就会直接有显示

```shell
# 打开窗口1
cd ~/tlsf/aliyun/scripts && ./ssh-game_server.sh
top

# 查看有如下进程，表示开服成功
top - 14:10:18 up 44 min,  0 users,  load average: 0.36, 0.29, 0.13
Tasks:  11 total,   1 running,  10 sleeping,   0 stopped,   0 zombie
Cpu(s):  7.0%us,  3.2%sy,  0.0%ni, 89.7%id,  0.0%wa,  0.0%hi,  0.1%si,  0.0%st

   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND                     👌  93 root      20   0 2719m 2.0g  48m S 47.3 25.1   2:16.55 Server                  
👌  90 root      20   0  725m 360m 3276 S 23.0  4.5   0:39.32 Login                       
👌  88 root      20   0  592m 523m  94m S  5.0  6.6   0:10.82 World                       
👌  85 root      20   0  459m 331m 209m S  0.3  4.2   0:01.94 ShareMemory                 
     1 root      20   0  4152  328  252 S  0.0  0.0   0:00.05 tail                       
    31 root      20   0 11492 1748 1392 S  0.0  0.0   0:00.04 bash                       
    42 root      20   0 11492  776  416 S  0.0  0.0   0:00.00 bash                       👌  43 root      20   0  437m  10m 2312 S  0.0  0.1   0:00.02 billing                     
    53 root      20   0 11492 1748 1388 S  0.0  0.0   0:00.03 bash                       
   138 root      20   0 11492 1668 1348 S  0.0  0.0   0:00.15 bash                       
   149 root      20   0 14940 1128  904 R  0.0  0.0   0:00.08 top          
```

- #### billing服务器配置文件参数说明

```shell
{
  "ip": "127.0.0.1",//billing服务器的ip，默认127.0.0.1即可
  "port": 21818,//billing服务器监听的端口(自定义一个未被占用的端口即可)
  "db_host": "127.0.0.1",//MySQL服务器的ip或者主机名
  "db_port": 3306,//MySQL服务器端口
  "db_user": "root",//MySQL用户名
  "db_password": "123456",//MySQL密码
  "db_name": "web",//账号数据库名(一般为web)
  "allow_old_password": false,//只有在老版本MySQL报old_password错误时,才需要设置为true
  "auto_reg": true,//用户登录的账号不存在时,是否引导用户进行注册
  "allow_ips": [],//允许的服务端连接ip,为空时表示允许任何ip,不为空时只允许指定的ip连接
  "transfer_number": 1000 //兑换参数，有的版本可能要设置为1才能正常兑换,有的则是1000
}

如果biiling和服务端位于同一台服务器的情况下，建议billing的IP使用127.0.0.1,这样可以避免绕一圈外网
本项目中附带的config.json的各项值为其默认值,如果你的配置中的值与默认值相同,则可以省略
例如你的配置只有密码和端口和上方配置不同，则可以这样写
{
	"port" : 12681,
	"db_password" : "123456"
}
如果你的配置和默认配置完全一样，则可以简写为 {}
```



- #### 配置服务端及相关参数

```shell
# 注意的是，端口 LOGIN_PORT=13580 SERVER_PORT=15680
# 如果需要改端口。则需要将对应端口进行修改
# 数据库客户端管理使用 ip:33060 ip:33061 进行连接
# 数据库密码：123456
```



- #### 清空数据操作

```shell
# step 1 : 关闭并且删除容器
docker stop aliyun_server_1 && docker rm aliyun_server_1 && docker stop aliyun_webdb_1 && docker rm aliyun_webdb_1 && docker stop aliyun_tlbbdb_1 && docker rm aliyun_tlbbdb_1
# step 2 : 删除镜像
docker image rm registry.cn-hangzhou.aliyuncs.com/yulinzhihou/tlsf_gs:v0.1 && docker image rm registry.cn-hangzhou.aliyuncs.com/yulinzhihou/tlsf_tlbbdbserver:v0.1 && docker image rm registry.cn-hangzhou.aliyuncs.com/yulinzhihou/tlsf_webdbserver:v0.1
```



- ### 换端命令

```shell
# step 1 : 关闭并且删除旧容器
docker stop aliyun_server_1 && docker rm aliyun_server_1 && docker stop aliyun_webdb_1 && docker rm aliyun_webdb_1 && docker stop aliyun_tlbbdb_1 && docker rm aliyun_tlbbdb_1
# step 2 : 上传服务端文件，解压并给相应权限
tar zxf tlbb.tar.gz -C /TLsf/workspace && chown -R root:root tlbb && chmod -R 777 /DockerTLBB/workspace
# step 3 ： 将上一版本的服务端备份，改名。
cd ~/tlsf/aliyun/script && ./modify_ini_config.sh

# 特别提醒：有时候替换的文件可能不完全兼容，需要重新解压服务端进行手动修改以下三个文件的相关配置信息。
ServerInfo.ini #修改billing的ip与端口
ShareMemInfo.ini #修改数据库ip与用户名，密码。
LoginInfo.ini #修改数据库ip与用户名，密码。

# step 4 : 运行容器环境
cd ~/tlsf/aliyun && docker-compose up -d
# 出现如下表示已经安装完成
Successfully built cdab3aeef0cd
Successfully tagged yulinzhihou/tlsf_gs:v0.1
Creating tlsf_tlbbdb_1      ... done
Creating tlsf_webdb_1       ... done
Creating tlsf_webdb_1       ... 
Creating tlsf_game_server_1 ... done


# step 5 : 开服命令走一波，如果是测试不确定的残端，建议先使用分开开服的命令进行，以查明是否有报错
# 打开窗口1
cd ~/tlsf/aliyun/scripts && ./ssh-server.sh
cd ../billing && ./billing &
# 打开窗口2
cd ~/tlsf/aliyun/scripts && ./ssh-server.sh
./run.sh
# 完成后，等待3-5分钟，开服完成。在窗口2中使用top命令查看运行情况，如果进程全部在，则表示已经开服。如果不在。则可能需要进行如下分步开服，看服务端是否出现报错情况。注：如果开服正常，可以进游戏，则可以将终端全部关闭

# 或者使用分部方式进行调试
# 打开窗口1
cd ~/tlsf/aliyun/scripts && ./ssh-server.sh
cd ../billing && ./billing &
# 打开窗口2
cd ~/tlsf/aliyun/scripts && ./ssh-server.sh
cd Server && ./shm start
# 打开窗口3
cd ~/tlsf/aliyun/scripts && ./ssh-server.sh
cd Server && ./Login
# 打开窗口4
cd ~/tlsf/aliyun/scripts && ./ssh-server.sh
cd Server && ./World
# 打开窗口5
cd ~/tlsf/aliyun/scripts && ./ssh-server.sh
cd Server && ./Server
```



