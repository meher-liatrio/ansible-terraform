#!/bin/bash

# Generate the inventory file
cat << EOF > inventory.ini
[ec2host]
$1
EOF

# Run the playbook
ansible-playbook -i inventory.ini playbook.yaml