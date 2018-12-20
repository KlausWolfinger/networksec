#!/bin/bash
clear
echo "##### DNS Root Server Check"

host e.root-servers.net |  grep -v "IPv6"
host m.root-servers.net |  grep -v "IPv6"
host b.root-servers.net |  grep -v "IPv6"
host d.root-servers.net |  grep -v "IPv6"
host c.root-servers.net |  grep -v "IPv6"
host f.root-servers.net |  grep -v "IPv6"
host l.root-servers.net |  grep -v "IPv6"
host j.root-servers.net |  grep -v "IPv6"
host i.root-servers.net |  grep -v "IPv6"
host g.root-servers.net |  grep -v "IPv6"
host a.root-servers.net |  grep -v "IPv6"
host h.root-servers.net |  grep -v "IPv6"
host k.root-servers.net |  grep -v "IPv6"

