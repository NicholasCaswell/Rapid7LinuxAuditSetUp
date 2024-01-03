##auditd script
#add more rules below, some can be found at https://github.com/Neo23x0/auditd/blob/master/audit.rules
auditctl -a always,exit -F arch=b64 -S execve -F key=execve
augenrules --load
auditctl -l
service auditd restart
service ir_agent stop
echo {"auditd-compatibility-mode":true} > /opt/rapid7/ir_agent/components/insight_agent/common/audit.conf
service ir_agent start