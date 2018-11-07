###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap6_http_robots_txt.nasl 11966 2018-10-18 13:56:21Z cfischer $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Eddie Bell
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.803574");
  script_version("$Revision: 11966 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-10-18 15:56:21 +0200 (Thu, 18 Oct 2018) $");
  script_tag(name:"creation_date", value:"2013-02-28 19:01:03 +0530 (Thu, 28 Feb 2013)");
  script_name("Nmap NSE 6.01: http-robots.txt");
  script_category(ACT_ATTACK);
  script_tag(name:"qod_type", value:"remote_analysis");
  script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
  script_family("Nmap NSE");
  script_dependencies("nmap_nse.nasl", "find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_mandatory_keys("Tools/Launch/nmap_nse", "Tools/Present/nmap6.01");

  script_add_preference(name:"http.pipeline", value:"", type:"entry");
  script_add_preference(name:"http.useragent", value:"", type:"entry");
  script_add_preference(name:"http-max-cache-size", value:"", type:"entry");

  script_tag(name:"summary", value:"Checks for disallowed entries in '/robots.txt' on a web server.

The higher the verbosity or debug level, the more disallowed entries are shown.


SYNTAX:

http.pipeline:  If set, it represents the number of HTTP requests that'll be
pipelined (ie, sent in a single request). This can be set low to make
debugging easier, or it can be set high to test how a server reacts (its
chosen max is ignored).

TODO
Implement cache system for http pipelines



http.useragent:  The value of the User-Agent header field sent with
requests. By default it is
''Mozilla/5.0 (compatible; Nmap Scripting Engine; http://nmap.org/book/nse.html)''.
A value of the empty string disables sending the User-Agent header field.



http-max-cache-size:  The maximum memory size (in bytes) of the cache.");

  exit(0);
}

include ("http_func.inc");

i = 0;

port = get_http_port(default:80);

pref = script_get_preference("http.pipeline");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'http.pipeline', '=', pref, '"');
}
pref = script_get_preference("http.useragent");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'http.useragent', '=', pref, '"');
}
pref = script_get_preference("http-max-cache-size");
if (!isnull(pref) && pref != "") {
  args[i++] = string('"', 'http-max-cache-size', '=', pref, '"');
}

argv = make_list("nmap", "--script=http-robots.txt.nse", "-p", port, get_host_ip());

if(i > 0) {
  scriptArgs = "--script-args=";
  foreach arg(args) {
    scriptArgs += arg + ",";
  }
  argv = make_list(argv, scriptArgs);
}

if(TARGET_IS_IPV6())
  argv = make_list(argv, "-6");

timing_policy = get_kb_item("Tools/nmap/timing_policy");
if(timing_policy =~ '^-T[0-5]$')
  argv = make_list(argv, timing_policy);

source_iface = get_preference("source_iface");
if(source_iface =~ '^[0-9a-zA-Z:_]+$') {
  argv = make_list(argv, "-e");
  argv = make_list(argv, source_iface);
}

res = pread(cmd:"nmap", argv:argv);

if(res)
{
  foreach line (split(res))
  {
    if(ereg(pattern:"^\|",string:line)) {
      result +=  substr(chomp(line),2) + '\n';
    }

    error = eregmatch(string:line, pattern:"^nmap: (.*)$");
    if (error) {
      msg = string('Nmap command failed with following error message:\n', line);
      log_message(data : msg, port:port);
    }
  }

  if("http-robots.txt" >< result) {
    msg = string('Result found by Nmap Security Scanner (http-robots.txt.nse) ',
                'http://nmap.org:\n\n', result);
    log_message(data : msg, port:port);
  }
}
else
{
  msg = string('Nmap command failed entirely:\n', 'nmap ', argv);
  log_message(data: msg, port:port);
}
