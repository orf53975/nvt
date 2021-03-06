###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1578.nasl 12357 2018-11-15 07:21:54Z cfischer $
#
# Auto-generated from advisory DLA 1578-1 using nvtgen 1.0
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
  script_oid("1.3.6.1.4.1.25623.1.0.891578");
  script_version("$Revision: 12357 $");
  script_cve_id("CVE-2016-1238", "CVE-2017-15705", "CVE-2018-11780", "CVE-2018-11781");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1578-1] spamassassin security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-11-15 08:21:54 +0100 (Thu, 15 Nov 2018) $");
  script_tag(name:"creation_date", value:"2018-11-15 00:00:00 +0100 (Thu, 15 Nov 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/11/msg00016.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB8\.[0-9]+");
  script_tag(name:"affected", value:"spamassassin on Debian Linux");
  script_tag(name:"insight", value:"SpamAssassin is a very powerful and fully configurable spam filter
with numerous features including automatic white-listing, RBL
testing, Bayesian analysis, header and body text analysis. It is
designed to be called from a user's .procmail or .forward file, but
can also be integrated into a Mail Transport Agent (MTA).");
  script_tag(name:"solution", value:"For Debian 8 'Jessie', these problems have been fixed in version
3.4.2-0+deb8u1. Upstream strongly advocates upgrading to the latest
upstream version so we are following that recommendation and
backported the version published as part of the 9.6 stretch release,
which also fixes many critical bugs.

We recommend that you upgrade your spamassassin packages.");
  script_tag(name:"summary",  value:"Multiple vulnerabilities were found in Spamassassin, which could lead
to Remote Code Execution and Denial of Service attacks under certain
circumstances.

CVE-2016-1238

Many Perl programs do not properly remove . (period) characters
from the end of the includes directory array, which might allow
local users to gain privileges via a Trojan horse module under the
current working directory.

CVE-2017-15705

A denial of service vulnerability was identified that exists in
Apache SpamAssassin before 3.4.2. The vulnerability arises with
certain unclosed tags in emails that cause markup to be handled
incorrectly leading to scan timeouts. This can cause carefully
crafted emails that might take more scan time than expected
leading to a Denial of Service.

CVE-2018-11780

A potential Remote Code Execution bug exists with the PDFInfo
plugin in Apache SpamAssassin before 3.4.2.

CVE-2018-11781

Apache SpamAssassin 3.4.2 fixes a local user code injection in the
meta rule syntax.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"sa-compile", ver:"3.4.2-0+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"spamassassin", ver:"3.4.2-0+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"spamc", ver:"3.4.2-0+deb8u1", rls_regex:"DEB8\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
