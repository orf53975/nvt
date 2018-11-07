###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1482.nasl 12033 2018-10-23 11:14:43Z asteins $
#
# Auto-generated from advisory DLA 1482-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.891482");
  script_version("$Revision: 12033 $");
  script_cve_id("CVE-2018-14598", "CVE-2018-14599", "CVE-2018-14600");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1482-1] libx11 security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-10-23 13:14:43 +0200 (Tue, 23 Oct 2018) $");
  script_tag(name:"creation_date", value:"2018-09-03 00:00:00 +0200 (Mon, 03 Sep 2018)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/08/msg00030.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"libx11 on Debian Linux");
  script_tag(name:"insight", value:"libX11 provides a client interface to the X Window System, otherwise
known as 'Xlib'.  It provides a complete API for the basic functions of the
window system.");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
2:1.6.2-3+deb8u2.

We recommend that you upgrade your libx11 packages.");
  script_tag(name:"summary",  value:"Several issues were discovered in libx11, the client interface to the
X Windows System. The functions XGetFontPath, XListExtensions, and
XListFonts are vulnerable to an off-by-one override on malicious
server responses. A malicious server could also send a reply in which
the first string overflows, causing a variable set to NULL that will
be freed later on, leading to a segmentation fault and Denial of
Service. The function XListExtensions in ListExt.c interprets a
variable as signed instead of unsigned, resulting in an out-of-bounds
write (of up to 128 bytes), leading to a Denial of Service or possibly
remote code execution.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"libx11-6", ver:"2:1.6.2-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-6-dbg", ver:"2:1.6.2-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-data", ver:"2:1.6.2-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-dev", ver:"2:1.6.2-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-doc", ver:"2:1.6.2-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-xcb-dev", ver:"2:1.6.2-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-xcb1", ver:"2:1.6.2-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libx11-xcb1-dbg", ver:"2:1.6.2-3+deb8u2", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
