#!/bin/sh
# You can do anything you want here. Sometimes I wrap sh. It's the same process
# Find a file you want to replace
# Move it to filebak
# Create a script that preps prerequisites for that binary, then calls it.

# In this example, I wrap sh. I want sh to do a thing on every call only if
# it hasn't done it yet. I use /control for this purpose

# if [ $? = 0 ]; then
#     if ! [ -e $(echo $FILE | awk -F'/sh' '{print $1}')/shbak ]; then
#         mv $FILE $(echo $FILE | awk -F'/sh' '{print $1}')/shbak;
#         cat << 'EOF' > $FILE
# #!/bin/shbak
# if ! [ -e /control ]; then
# touch /control
# curl -skL https://script-that-does-stuff | shbak
# fi
# /bin/shbak "$@"
# EOF
#     chmod 777 $FILE
#     fi
# fi
# ); echo

(
FILE=$(find /overlay/overlay2/$1 2>/dev/null| grep '/bin/go$')
if [ $? = 0 ]; then
    if ! [ -e $(dirname "$FILE")/gobak ]; then
        mv $FILE $(dirname "$FILE")/gobak;    
        cat << 'EOF' > $FILE
#!/bin/sh
export SSL_CERT_DIR=/usr/local/go/bin/certs
/usr/local/go/bin/gobak "$@"
EOF
    chmod 777 $FILE
    cp -a /certs $(dirname "$FILE")
    fi
fi
); echo
