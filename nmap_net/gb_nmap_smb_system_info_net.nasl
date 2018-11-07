###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_smb_system_info_net.nasl 12127 2018-10-26 13:14:31Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Ron Bowes
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
  script_oid("1.3.6.1.4.1.25623.1.0.104023");
  script_version("$Revision: 12127 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 15:14:31 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
  script_name("Nmap NSE net: smb-system-info");
  script_category(ACT_INIT);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE net");
  script_dependencies("nmap_nse_net.nasl");
  script_mandatory_keys("Tools/Launch/nmap_nse_net");

  script_add_preference(name:"smbbasic", value:"", type:"entry");
  script_add_preference(name:"smbport", value:"", type:"entry");
  script_add_preference(name:"smbsign", value:"", type:"entry");
  script_add_preference(name:"randomseed", value:"", type:"entry");

  script_tag(name:"summary", value:"Pulls back information about the remote system from the registry. Getting all of the information
requires an administrative account, although a user account will still get a lot of it. Guest
probably won't get any, nor will anonymous.  This goes for all operating systems, including Windows
2000.

Windows Vista disables remote registry access by default, so unless it was enabled, this script
won't work.

If you know of more information stored in the Windows registry that could be interesting, post a
message to the nmap-dev mailing list and I (Ron Bowes) will add it to my todo list.  Adding new
checks to this is extremely easy.

WARNING: I have experienced crashes in 'regsvc.exe' while making registry calls against a
fully patched Windows 2000 system. I've fixed the issue that caused it, but there's no guarantee
that it (or a similar vuln in the same code) won't show up again. Since the process automatically
restarts, it doesn't negatively impact the system, besides showing a message box to the user.

SYNTAX:

smbbasic:     Forces the authentication to use basic security, as opposed to 'extended security'.
Against most modern systems, extended security should work, but there may be cases
where you want to force basic. There's a chance that you'll get better results for
enumerating users if you turn on basic authentication.

smbport:       Override the default port choice. If 'smbport' is open, it's used. It's assumed
to be the same protocol as port 445, not port 139. Since it probably isn't possible to change
Windows' ports normally, this is mostly useful if you're bouncing through a relay or something.

smbsign:       Controls whether or not server signatures are checked in SMB packets. By default, on Windows,
server signatures aren't enabled or required. By default, this library will always sign
packets if it knows how, and will check signatures if the server says to. Possible values are:

  - 'force':      Always check server signatures, even if server says it doesn't support them (will
probably fail, but is technically more secure).

  - 'negotiate': [default] Use signatures if server supports them.

  - 'ignore':    Never check server signatures. Not recommended.

  - 'disable':   Don't send signatures, at all, and don't check the server's. not recommended.
More information on signatures can be found in 'smbauth.lua'.

randomseed:    Set to a value to change the filenames/service names that are randomly generated.");

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

    pref = script_get_preference("smbbasic");
    if (!isnull(pref) && pref != "") {
        argv["smbbasic"] = string('"', pref, '"');
    }
    pref = script_get_preference("smbport");
    if (!isnull(pref) && pref != "") {
        argv["smbport"] = string('"', pref, '"');
    }
    pref = script_get_preference("smbsign");
    if (!isnull(pref) && pref != "") {
        argv["smbsign"] = string('"', pref, '"');
    }
    pref = script_get_preference("randomseed");
    if (!isnull(pref) && pref != "") {
        argv["randomseed"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"smb-system-info", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"smb-system-info");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (smb-system-info.nse) http://nmap.org:\n\n';
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
