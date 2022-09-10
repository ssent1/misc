bth=$(./blueutil status)
cat << EOF

# the new version of blueutil returns a numeric value, `1` = on, `0` = off, and
# the old version returned a string, `on/off`, update script to output a string

<?xml version="1.0"?>
<items>
	<item uid="com.proganica.btknx" arg="$bth" valid="yes" type="file">
		<title>Toggle Bluetooth Headphones</title>
		<subtitle>$bth</subtitle>
		<icon type="file">headphones-icon.png</icon>
	</item>
</items>
EOF
