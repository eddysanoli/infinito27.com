# Replace the contents of "ansible/hosts" with the content below
cat << EOF >> ../ansible/configuration/hosts 

[webservers]
${website_server_ip}