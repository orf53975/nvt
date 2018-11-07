###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_macosx_HT209193_04.nasl 12203 2018-11-02 14:42:44Z bshakeel $
#
# Apple MacOSX Security Updates(HT209193)-04
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.814424");
  script_version("$Revision: 12203 $");
  script_cve_id("CVE-2018-4403", "CVE-2018-4424", "CVE-2018-4389");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-11-02 15:42:44 +0100 (Fri, 02 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-02 10:56:30 +0530 (Fri, 02 Nov 2018)");
  script_name("Apple MacOSX Security Updates(HT209193)-04");

  script_tag(name:"summary", value:"This host is installed with Apple Mac OS X
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Checks if a vulnerable version is present
  on the target host.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to,

  - An improper access restriction on files.

  - An input validation error.

  - An inconsistent user interface issue related to improper state management.");

  script_tag(name: "impact" , value:"Successful exploitation allow remote
  attackers to conduct UI spoofing, execute arbitrary code and access restricted
  files.");

  script_tag(name: "affected" , value:"Apple Mac OS X version 10.14");

  script_tag(name: "solution" , value:"Upgrade to Apple Mac OS X 10.14.1 or later.
  For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
  script_xref(name : "URL" , value : "https://support.apple.com/en-us/HT209193");
  script_xref(name : "URL" , value : "https://www.apple.com");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/osx_name", "ssh/login/osx_version");
  exit(0);
}

include("version_func.inc");
include("ssh_func.inc");

osName = get_kb_item("ssh/login/osx_name");
if(!osName){
  exit (0);
}

osVer = get_kb_item("ssh/login/osx_version");
if(!osVer || osVer !~ "^(10\.14)" || "Mac OS X" >!< osName){
  exit(0);
}

if(osVer == "10.14")
{
  report = report_fixed_ver(installed_version:osVer, fixed_version:"10.14.1");
  security_message(data:report);
  exit(0);
}
