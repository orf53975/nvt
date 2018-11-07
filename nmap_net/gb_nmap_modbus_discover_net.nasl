###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_modbus_discover_net.nasl 12117 2018-10-26 10:50:36Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Alexander Rudakov
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
  script_oid("1.3.6.1.4.1.25623.1.0.104121");
  script_version("$Revision: 12117 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 12:50:36 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("Nmap NSE net: modbus-discover");
  script_category(ACT_INIT);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE net");
  script_dependencies("nmap_nse_net.nasl");
  script_mandatory_keys("Tools/Launch/nmap_nse_net");

  script_add_preference(name:"aggressive", value:"", type:"entry");

  script_xref(name:"URL", value:"http://www.modbus.org/docs/Modbus_Application_Protocol_V1_1b.pdf");
  script_xref(name:"URL", value:"https://www.defcon.org/images/defcon-16/dc16-presentations/defcon-16-bristow.pdf");
  script_xref(name:"URL", value:"http://code.google.com/p/modscan/");

  script_tag(name:"summary", value:"Enumerates SCADA Modbus slave ids (sids) and collects their device information.

Modbus is one of the popular SCADA protocols. This script does Modbus device information disclosure.
It tries to find legal sids (slave ids) of Modbus devices and to get additional information about
the vendor and firmware. This script is improvement of modscan python utility written by Mark
Bristow.

Information about MODBUS protocol and security issues can be found in the references.

SYNTAX:

aggressive:  - boolean value defines find all or just first sid");

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

    pref = script_get_preference("aggressive");
    if (!isnull(pref) && pref != "") {
        argv["aggressive"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"modbus-discover", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"modbus-discover");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (modbus-discover.nse) http://nmap.org:\n\n';
        if (portspec == "0") {
            log_message(data:output_banner + res[portspec], port:0);
        } else {
            v = split(portspec, sep:"/", keep:0);
            proto = v[0];
            port = v[1];
            log_message(data:output_banner + res[portspec], port:port, protocol:proto);
        }
    }
}
