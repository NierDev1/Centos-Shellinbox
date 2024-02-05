# Este comando sempre entra como user (nao tem login)
# shellinaboxd --no-beep -t --user-css Normal:+/usr/share/shellinabox/black-on-white.css,Reverse:-/usr/share/shellinabox/white-on-black.css --service "/:user:users:/home/user:/bin/bash"
shellinaboxd --no-beep -t --user-css Normal:+/usr/share/shellinabox/black-on-white.css,Reverse:-/usr/share/shellinabox/white-on-black.css --service "/:root:users:/home:/bin/bash"

# Este tem login
# shellinaboxd --no-beep -t -s "/:LOGIN"

