bts=$(blueutil -p)
cat << EOF

# the new version of blueutil returns a numeric value, `1` = on, `0` = off, and
# the old version returned a string, `on/off`, update script to output a string

<?xml version="1.0"?>
<items>
	<item uid="com.proganica.btknx" arg="$bts" valid="yes" type="file">
		<title>Toggle Bluetooth Status</title>
		<subtitle>$bts</subtitle>
		<icon type="file">mouse-icon.png</icon>
	</item>
</items>
EOF
