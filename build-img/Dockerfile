# 继承基础镜像
FROM php:7.3.9-apache-stretch
# 配置apache虚拟机
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
# 开放端口
EXPOSE 8080 8081
# 解压资源
ADD ctl.tar.gz_aa .
# RUN ls -Fl /var/www/html
RUN \
# 开启apache路由重写模块
	ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load; \
# 设置监听端口
	echo "Listen 8080" >> /etc/apache2/ports.conf; \
	echo "Listen 8081" >> /etc/apache2/ports.conf; \
# 解压资源和设置权限	
	tar xf ./ctl/tp5.tar -C .; \
	chmod -R 775 ./tp5; \
	tar xfz ./ctl/laravel.tar.gz_* -C .; \
	chmod 775 ./laravel/apache_logs; \
	chmod -R 777 laravel/storage; \
	chmod -R 777 laravel/bootstrap; \
	mv ./ctl/composer /usr/bin/composer; \
	chmod +x /usr/bin/composer; \
	mkdir -p test/public/; \
	mkdir test/apache_logs; \
	chmod 775 test/apache_logs