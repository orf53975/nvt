###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_dns_cache_snoop_net.nasl 12117 2018-10-26 10:50:36Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Eugene V. Alexeev
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2011 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.104033");
  script_version("$Revision: 12117 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 12:50:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("Nmap NSE net: dns-cache-snoop");
  script_category(ACT_INIT);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE net");
  script_dependencies("nmap_nse_net.nasl");
  script_mandatory_keys("Tools/Launch/nmap_nse_net");

  script_add_preference(name:"dns-cache-snoop.domains", value:"", type:"entry");
  script_add_preference(name:"dns-cache-snoop.mode", value:"", type:"entry");

  script_tag(name:"summary", value:"Performs DNS cache snooping against a DNS server.

There are two modes of operation, controlled by the 'dns-cache-snoop.mode' script
argument. In 'nonrecursive' mode (the default), queries are sent to the server with the
RD (recursion desired) flag set to 0. The server should respond positively to these only if it has
the domain cached. In 'timed' mode, the mean and standard deviation response times for a
cached domain are calculated by sampling the resolution of a name (www.google.com) several times.
Then, each domain is resolved and the time taken compared to the mean. If it is less than one
standard deviation over the mean, it is considered cached. The 'timed' mode inserts
entries in the cache and can only be used reliably once.

The default list of domains to check consists of the top 50 most popular sites, each site being
listed twice, once with 'www.' and once without. Use the 'dns-cache-snoop.domains' script
argument to use a different list.

SYNTAX:

dns-cache-snoop.domains:  an array of domain to check in place of
the default list.

dns-cache-snoop.mode:  which of two supported snooping methods to
use. 'nonrecursive', the default, checks if the server
returns results for non-recursive queries. Some servers may disable
this. 'timed' measures the difference in time taken to
resolve cached and non-cached hosts. This mode will pollute the DNS
cache and can only be used once reliably.");

  script_tag(name:"solution_type", value:"Mitigation");

  exit(0);
}

include("nmap.inc");

# The corresponding NSE script doesn't belong to the 'safe' category
if (safe_checks()) exit(0);

phase = 0;
if (defined_func("scan_phase")) {
  phase = scan_phase();
}

if (phase == 1) {
    argv = make_array();

    pref = script_get_preference("dns-cache-snoop.domains");
    if (!isnull(pref) && pref != "") {
        argv["dns-cache-snoop.domains"] = string('"', pref, '"');
    }
    pref = script_get_preference("dns-cache-snoop.mode");
    if (!isnull(pref) && pref != "") {
        argv["dns-cache-snoop.mode"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"dns-cache-snoop", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"dns-cache-snoop");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (dns-cache-snoop.nse) http://nmap.org:\n\n';
        if (portspec == "0") {
            security_message(data:output_banner + res[portspec], port:0);
        } else {
            v = split(portspec, sep:"/", keep:0);
            proto = v[0];
            port = v[1];
            security_message(data:output_banner + res[portspec], port:port, protocol:proto);
        }
    }
}
