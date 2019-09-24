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
	con_name=php-ide
	ports="-p 80:80 -p 8080:8080 -p 8081:8081"
	cre_con="docker run -d $ports --name $con_name --privileged  $build_img"
	if $cre_con
	then
		echo '容器构建成功'
	else
		echo '容器构建失败'
	fi
}

# 运行脚本
function run(){
	if creImg
	then
		creCon
	fi
}

# docker run -d -p 80:80 -p 8080:8080 -p 8081:8081 --name php-ide --privileged -v /var/www/html/wx:/var/www/html/wx php:7.3.9-apache-stretch-1.0
# docker rm php-ide -f -v
# docker inspect php-ide > php-ide

run


