###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for binutils FEDORA-2015-0750
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2015 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.868943");
  script_version("$Revision: 6630 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-10 08:34:32 +0200 (Mon, 10 Jul 2017) $");
  script_tag(name:"creation_date", value:"2015-01-22 05:43:45 +0100 (Thu, 22 Jan 2015)");
  script_cve_id("CVE-2014-8738", "CVE-2014-8737");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_name("Fedora Update for binutils FEDORA-2015-0750");
  script_tag(name: "summary", value: "Check the version of binutils");
  script_tag(name: "vuldetect", value: "Get the installed version with the help
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Binutils is a collection of binary utilities,
including ar (for creating, modifying and extracting from archives), as (a family of
GNU assemblers), gprof (for displaying call graph profile data), ld (the GNU linker),
nm (for listing symbols from object files), objcopy (for copying and translating object
files), objdump (for displaying information from object files), ranlib (for generating
an index for the contents of an archive), readelf (for displaying detailed information
about binary files), size (for listing the section sizes of an object or archive file),
strings (for listing printable strings from files), strip (for discarding symbols), and
addr2line (for converting addresses to file and line).");
  script_tag(name: "affected", value: "binutils on Fedora 21");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_xref(name: "FEDORA", value: "2015-0750");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2015-January/148438.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2015 Greenbone Networks GmbH");
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

if(release == "FC21")
{

  if ((res = isrpmvuln(pkg:"binutils", rpm:"binutils~2.24~30.fc21", rls:"FC21")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
