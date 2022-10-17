# Delete contents of "hosts" file
truncate -s 0 ../ansible/configuration/hosts

# Fill the "hosts" file with the text below
cat << EOF >> ../ansible/configuration/hosts 

[webservers]
${website_server_ip}

EOF