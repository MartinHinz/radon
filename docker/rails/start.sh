#!/bin/bash
export SECRET_KEY_BASE=$(rake secret) && \
    #rake db:migrate && \
    rake assets:precompile --trace && \
    # the following symbolic links have to be created to bypass the asset pipeline
    # when including the specific assets of radon and radon-b
    # radon
    ln -sf ../../app/assets/images/oxford_photo.jpg public/assets/oxford_photo.jpg && \
    ln -sf ../../app/assets/images/c14_s.gif public/assets/c14_s.gif && \
    ln -sf ../../app/assets/images/c14_s.png public/assets/c14_s.png && \
    # radon-b
    ln -sf ../../app/assets/images/radon_b_image.png public/assets/radon_b_image.png && \
    ln -sf ../../app/assets/images/radon_b_logo.png public/assets/radon_b_logo.png && \
    ln -sf ../../app/assets/images/radon_b_schriftzug.png public/assets/radon_b_schriftzug.png && \
		# make env variables available to cron 
		# cron sets up an own environment that does not include the necessary
		# variables, but it sources /etc/environment
		printenv >> /etc/environment && \
		# start cron service
		service cron start && \
    # start webserver
    /opt/nginx/sbin/nginx

