###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpressmu_mult_xss_vuln.nasl 4227 2016-10-07 05:45:35Z teissa $
#
# WordPress MU Multiple XSS Vulnerabilities - Oct08
#
# Authors:
# Veerendra GG <veerendragg@secpod.com>
#
# Copyright:
# Copyright (c) 2008 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = "cpe:/a:wordpress:wordpress_mu";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.800125");
  script_version("$Revision: 4227 $");
  script_tag(name:"last_modification", value:"$Date: 2016-10-07 07:45:35 +0200 (Fri, 07 Oct 2016) $");
  script_tag(name:"creation_date", value:"2008-11-05 06:52:23 +0100 (Wed, 05 Nov 2008)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_cve_id("CVE-2008-4671");
  script_bugtraq_id(31482);
  script_name("WordPress MU Multiple XSS Vulnerabilities - Oct08");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/32060");
  script_xref(name : "URL" , value : "http://www.juniper.fi/security/auto/vulnerabilities/vuln28845.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2008 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");
  script_require_ports("Services/www", 80);

  script_tag(name : "impact" , value : "Successful attack could lead to execution of arbitrary HTML and
  script code in the context of an affected site and attackers can steal
  cookie-based authentication credentials.
  Impact Level: Application");
  script_tag(name : "affected" , value : "WordPress MU before 2.6 on all running platform.");
  script_tag(name : "insight" , value : "The flaws are due to the 's' and 'ip_address' parameters in
  wp-admin/wp-blogs.php which is not properly sanitized before being returned
  to the user.");
  script_tag(name : "solution" , value : "Update to Version 2.6 or later.
  http://wordpress.org/");
  script_tag(name : "summary" , value : "The host is running WordPress MU, which is prone to Multiple
  XSS Vulnerabilities.");

  script_tag(name:"qod_type", value:"remote_banner");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!port = get_app_port(cpe:CPE)) exit(0);
if(!ver = get_app_version(cpe:CPE, port:port)) exit(0);

if(version_is_less(version:ver, test_version:"2.6")){
    security_message(port:port);
    exit(0);
}

exit(99);