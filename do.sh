# 项目构建脚本

# 镜像tag版本
version=1.0

# 构建的镜像名称
build_img="php:7.3.9-apache-stretch-$version"

# 构建镜像
function creImg(){
# 构建镜像
	cre_img="docker build -t $build_img ./build-img"
	if $cre_img
	then
		echo '镜像构建成功'
	else
		echo '镜像构建失败'
	fi
}

# 构建容器
function creCon(){
	con_name=php-env
	volume=/var/www/html/wx
	ports="-p 80:80 -p 8080:8080 -p 8081:8081"
	if [ -d $volume ]
	then
		echo
	else
		mkdir -p $volume
	fi
	cre_con="docker run -d $ports --name $con_name --privileged -v $volume $build_img"
	if $cre_con
	then
		echo '容器构建成功'
	else
		echo '容器构建失败'
	fi
}

if creImg
then
	creCon
fi