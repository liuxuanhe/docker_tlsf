### Docker Env Bug
#### 1、tlbb环境问题汇总

- 问题1，`Server/Config` 目录下，配置文件 `ShareMemInfo.ini` 文本编码格式不能为utf-8,只能 `GBK` 编码格式，linux下查看为 `ShareMemInfo.ini: ISO-8859 text, with CRLF line terminators` 不然 `./shm start` 启动不了，各种报错
