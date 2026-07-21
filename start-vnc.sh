#!/bin/sh
set -eu

: "${VNC_PASSWORD:?VNC_PASSWORD を指定してください}"

mkdir -p "$HOME/.vnc"
umask 077
printf '%s\n' "$VNC_PASSWORD" | tigervncpasswd -f > "$HOME/.vnc/passwd"

cat > "$HOME/.vnc/xstartup" <<'EOF'
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

google-chrome \
  --no-sandbox \
  --disable-dev-shm-usage \
  --disable-features=DnsOverHttps \
  --dns-prefetch-disable \
  --no-first-run \
  --disable-gpu &

exec startxfce4
EOF
chmod 700 "$HOME/.vnc/xstartup"

exec tigervncserver :0 \
  -fg \
  -localhost no \
  -rfbport 5900 \
  -geometry "${VNC_GEOMETRY:-1440x900}" \
  -depth "${VNC_DEPTH:-24}" \
  -SecurityTypes VncAuth
