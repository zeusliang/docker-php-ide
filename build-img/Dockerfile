# 继承基础镜像
FROM php:7.3.9-apache-stretch
# RUN mkdir /var/www/html/wx/
# 配置apache虚拟机
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
# 开放端口
EXPOSE 8080 8081
# 解压资源
ADD ctl.tar.gz_aa .
# RUN ls -Fl /var/www/html
RUN \
# 安装pdo的mysql扩展
	docker-php-source extract && \
    docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-enable pdo_mysql && \
    docker-php-source delete; \
# 创建逻辑卷volume
	mkdir /var/www/html/wx/; \
# 开启apache路由重写模块
	ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load; \
# 设置监听端口
	echo "Listen 8080" >> /etc/apache2/ports.conf; \
	echo "Listen 8081" >> /etc/apache2/ports.conf; \
# 解压资源和设置权限	
	tar xf ./ctl/tp5.tar -C ./wx; \
	ln -s /var/www/html/wx/tp5 /var/www/html/tp5; \
	chmod -R 775 ./tp5; \
	tar xfz ./ctl/laravel.tar.gz_* -C ./wx; \
	ln -s /var/www/html/wx/laravel /var/www/html/laravel; \
	chmod 775 ./laravel/apache_logs; \
	chmod -R 777 ./laravel/storage; \
	chmod -R 777 ./laravel/bootstrap; \
	mv ./ctl/composer /usr/bin/composer; \
	chmod +x /usr/bin/composer; \
	mkdir -p ./wx/test/public/; \
	mkdir ./wx/test/apache_logs; \
	ln -s /var/www/html/wx/test /var/www/html/test; \
	chmod 775 ./test/apache_logs; \
	date > /var/www/html/wx/time; \
	ls -Fl /var/www/html/; \
	ls -Fl /var/www/html/wx/; 
# 设置volume逻辑卷
VOLUME /var/www/html/wx/