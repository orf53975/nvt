###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2018_7a9777480c_CuraEngine-lulzbot_fc28.nasl 11228 2018-09-05 02:44:21Z ckuersteiner $
#
# Fedora Update for CuraEngine-lulzbot FEDORA-2018-7a9777480c
#
# Authors:
# System Generated Check
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.875001");
  script_version("$Revision: 11228 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-05 04:44:21 +0200 (Wed, 05 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-08-26 07:17:39 +0200 (Sun, 26 Aug 2018)");
  script_cve_id("CVE-2018-1000537");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for CuraEngine-lulzbot FEDORA-2018-7a9777480c");
  script_tag(name:"summary", value:"Check the version of CuraEngine-lulzbot");
  script_tag(name:"vuldetect", value:"Checks if a vulnerable version is present on the target host.");
  script_tag(name:"insight", value:"CuraEngine-lulzbot is a C++ console application for 3D printing G-code generation. It
has been made as a better and faster alternative to the old Skeinforge engine.

This is just a console application for G-code generation. For a full graphical
application look at cura-lulzbot which is the graphical frontend for CuraEngine-lulzbot.
");
  script_tag(name:"affected", value:"CuraEngine-lulzbot on Fedora 28");
  script_tag(name:"solution", value:"Please install the updated packages.");

  script_xref(name:"FEDORA", value:"2018-7a9777480c");
  script_xref(name:"URL" , value:"https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/LWGT4LGAHNUWGFLDDOKPRNCLSJOQFS42");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC28")
{

  if ((res = isrpmvuln(pkg:"CuraEngine-lulzbot", rpm:"CuraEngine-lulzbot~3.2.23~1.fc28", rls:"FC28")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99);
  exit(0);
}
