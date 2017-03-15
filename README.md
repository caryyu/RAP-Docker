容器内的RAP版本是基于分支v0.14.3进行制作的，我把镜像放在阿里云的容器镜像仓库中，国内获取速度会较快；点击查看[镜像详细地址](https://dev.aliyun.com/detail.html?spm=5176.1972343.2.4.xU6PVK&repoId=30344i).

# 启动Redis
```shell
docker run -d --name redis3 redis:3.2
```
# 数据库说明
配置数据库的方法请参考RAP官方的部署手册配置数据库篇，点击查看[Centos中文部署文档配置数据库](https://github.com/thx/RAP/wiki/deploy_on_centos_cn)
# 启动容器
```shell
docker run -d -p 8080:8080 --name rap --link redis3:redis3 \
-e JAVA_OPTS="$JAVA_OPTS  \
-Djdbc.url=jdbc:mysql://mysql-server:3306/rap_db \
-Djdbc.username=rap_db \
-Djdbc.password=rap_db_123456 \
-Dredis.host=redis3 \
-Dredis.index=0 \
-Djava.security.egd=file:/dev/urandom" \
registry.cn-hangzhou.aliyuncs.com/caryyu/rap:0.14.3
```
## 阿里云外网镜像地址
registry.cn-hangzhou.aliyuncs.com/caryyu/rap:0.14.3
## 阿里云内网镜像地址
registry.cn-hangzhou.aliyuncs.com/caryyu/rap:0.14.3

# RAP源码说明
官方RAP的0.14.3不支持外部系统变量的覆盖，我Fork了一份并在分支v0.14.3作出了更改。
我的Github项目地址：https://github.com/caryyu/RAP/tree/v0.14.3
