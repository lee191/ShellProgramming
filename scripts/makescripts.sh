#!/bin/bash
# makescripts.sh tools.sh

# -> /root/scripts/tools.sh
#   #!/bin/bash
# -> chmod 700 /root/scripts/tools.sh


if [ $# -ne 1 ]; then
    echo "Usage: $0 <scriptsfile>"
    exit 1
fi

SCRIPTSFILE=$1
SCRIPTSBASE=/root/shell

cat << EOF > $SCRIPTSBASE/$SCRIPTSFILE
#!/bin/bash


EOF
chmod 700 $SCRIPTSBASE/$SCRIPTSFILE