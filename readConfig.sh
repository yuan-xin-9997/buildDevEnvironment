# 支持从List文件中逐行获取数据，并赋值给变量
# 假如文件内容如下：
#   IP         Service
#   8.8.8.8    dns1
#   4.4.4.4    dns2
# 现在需求是想逐行从该文件（confing.list)中读取配置，读取一行执行一个处理逻辑，可以使用如下命令：
awk '!/^#/ {print $1,$2} ' ./config.list | while read ip service
do
	# 处理逻辑，可以执行使用变量$ip, $service
done
# 注意：上述命令会排除#开头的，另外config.list不能有空行