###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_http_favicon_net.nasl 12127 2018-10-26 13:14:31Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Vlatko Kosturjak
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
  script_oid("1.3.6.1.4.1.25623.1.0.104004");
  script_version("$Revision: 12127 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-26 15:14:31 +0200 (Fri, 26 Oct 2018) $");
  script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("Nmap NSE net: http-favicon");
  script_category(ACT_INIT);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE net");
  script_dependencies("nmap_nse_net.nasl");
  script_mandatory_keys("Tools/Launch/nmap_nse_net");

  script_add_preference(name:"http.pipeline", value:"", type:"entry");
  script_add_preference(name:"http.useragent", value:"", type:"entry");
  script_add_preference(name:"http-max-cache-size", value:"", type:"entry");
  script_add_preference(name:"favicon.root", value:"", type:"entry");
  script_add_preference(name:"favicon.uri", value:"", type:"entry");

  script_tag(name:"summary", value:"Gets the favicon ('favorites icon') from a web page and matches it against a database of the icons
of known web applications. If there is a match, the name of the application is printed. Otherwise
the MD5 hash of the icon data is printed.

If the script argument 'favicon.uri' is given, that relative URI is always used to find
the favicon. Otherwise, first the page at the root of the web server is retrieved and parsed for a
'<link rel='icon'>' element. If that fails, the icon is looked for in
'/favicon.ico'. If a '<link>' favicon points to a different host or port, it
is ignored.


SYNTAX:

http.pipeline:  If set, it represents the number of HTTP requests that'll be
pipelined (ie, sent in a single request). This can be set low to make
debugging easier, or it can be set high to test how a server reacts (its
chosen max is ignored).


http.useragent:  The value of the User-Agent header field sent with
requests. By default it is
''Mozilla/5.0 (compatible; Nmap Scripting Engine; http://nmap.org/book/nse.html)''.
A value of the empty string disables sending the User-Agent header field.



http-max-cache-size:  The maximum memory size (in bytes) of the cache.



favicon.root:  Web server path to search for favicon.



favicon.uri:  URI that will be requested for favicon.");

  exit(0);
}

include("nmap.inc");

phase = 0;
if (defined_func("scan_phase")) {
  phase = scan_phase();
}

if (phase == 1) {
    argv = make_array();

    pref = script_get_preference("http.pipeline");
    if (!isnull(pref) && pref != "") {
        argv["http.pipeline"] = string('"', pref, '"');
    }
    pref = script_get_preference("http.useragent");
    if (!isnull(pref) && pref != "") {
        argv["http.useragent"] = string('"', pref, '"');
    }
    pref = script_get_preference("http-max-cache-size");
    if (!isnull(pref) && pref != "") {
        argv["http-max-cache-size"] = string('"', pref, '"');
    }
    pref = script_get_preference("favicon.root");
    if (!isnull(pref) && pref != "") {
        argv["favicon.root"] = string('"', pref, '"');
    }
    pref = script_get_preference("favicon.uri");
    if (!isnull(pref) && pref != "") {
        argv["favicon.uri"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"http-favicon", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"http-favicon");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (http-favicon.nse) http://nmap.org:\n\n';
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
