# Toggles systemd resolved DNSOverTLS value between "yes" and "opportunistic"
function toggle_dnstls
  set -l current (grep "DNSOverTLS=" /etc/systemd/resolved.conf | cut -s -f 2 -d '=')

  if test "$current" = "yes"
    sudo sed -i "/^DNSOverTLS=/c\DNSOverTLS=opportunistic" /etc/systemd/resolved.conf
  else
    sudo sed -i "/^DNSOverTLS=/c\DNSOverTLS=yes" /etc/systemd/resolved.conf
  end

  sudo systemctl restart systemd-resolved
end
