server {
	listen 80 default_server;
	server_name _;

	location / {
		uwsgi_pass localhost:5000;
		include uwsgi_params;
	}

  location /prometheus {
    proxy_pass http://KnOMM-2:9090;
  }
}
