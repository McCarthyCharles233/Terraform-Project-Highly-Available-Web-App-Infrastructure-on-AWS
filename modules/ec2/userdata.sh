#!/bin/bash
apt update
apt install -y apache2

# Create a simple HTML file with the portfolio content and display the images
INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head><title>My Terraform Project</title></head>
<body>
  <h1>Terraform Project Server</h1>
  <p>Instance ID: $INSTANCE_ID</p>
</body>
</html>
EOF

# Start Apache and enable it on boot
systemctl start apache2
systemctl enable apache2