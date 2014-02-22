package :nginx do
  requires :nginx_package
end

package :nginx_package do
  apt "nginx"
  verify { has_apt 'nginx' }
end

