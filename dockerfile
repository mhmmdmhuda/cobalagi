FROM alpine
MAINTAINER  huda (mhmmdmhuda@gmail.com)

# Install nginx
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.3/main" >> /etc/apk/repositories && \
    apk add --update nginx=1.12.1-r0 && rm -rf /var/cache/apk/*

            # Copy file
	    copy nginx/nginx.conf /etc/nginx/nginx.conf
	    copy nginx/default.conf /etc/nginx/conf.d/default.conf
	    copy website /usr/share/nginx/html

	    # Add the files
	    #ADD root /

	    # Expose the ports for nginx
	    EXPOSE 80 443

	    # Running Nginx
	    CMD ["nginx", "-g", "daemon off;"]
