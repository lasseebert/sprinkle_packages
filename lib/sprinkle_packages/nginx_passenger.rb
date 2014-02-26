package :nginx_passenger do
  requires :passenger
  requires :nginx_prerequisites
  requires :nginx
  requires :nginx_service
  requires :nginx_config, opts
  requires :nginx_start
end

package :passenger do
  gem 'passenger'
  verify { has_gem "passenger" }
end

package :nginx_prerequisites do
  apt "libcurl4-openssl-dev"
  verify { has_apt "libcurl4-openssl-dev" }
end

package :nginx do
  runner 'sudo passenger-install-nginx-module --auto --auto-download --prefix=/opt/nginx'

  verify { has_executable '/opt/nginx/sbin/nginx' }
end

package :nginx_config do
  if opts[:config_file]
    transfer opts[:config_file], '/opt/nginx/conf/nginx.conf', sudo: true
    runner 'sudo service nginx restart'

    verify do
      matches_local(opts[:config_file], "/opt/nginx/conf/nginx.conf")
    end
  end
end

package :nginx_service do
  transfer File.expand_path("../../../server_files/nginx_service", __FILE__), '/etc/init.d/nginx', sudo: true
  runner 'sudo update-rc.d nginx defaults 99'

  verify do
    has_file "/etc/init.d/nginx"
  end
end

package :nginx_start do
  runner 'sudo service nginx start'

  verify { has_process "nginx" }
end

