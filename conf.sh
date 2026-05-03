for i in {1..2}; do
	mkdir /var/www/web-$i

	touch /var/www/web-$i/index.html
	
	cat <<-'EOF' > /etc/nginx/sites-available/web-$i
	server {
		listen 808$i;
		root /var/www/web-$i;
		index index.html;
		
		location / {
			try_files $uri $uri/ =404;
				}
			}
	EOF

	cat <<-'EOF'> /var/www/web-$i/index.html
	hello from web-$i
	EOF

	chmod 755 /var/www/web-$i
	
	ln -s /etc/nginx/sites-available/web-$i /etc/nginx/sites-enabled/
done
