# OpenVAS Vulnerability Test
# $Id: deb_2531_1.nasl 9352 2018-04-06 07:13:02Z cfischer $
# Description: Auto-generated from advisory DSA 2531-1 (xen)
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# or at your option, GNU General Public License version 3,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

include("revisions-lib.inc");
tag_insight = "Several denial-of-service vulnerabilities have been discovered in Xen,
the popular virtualization software. The Common Vulnerabilities and
Exposures project identifies the following issues:

CVE-2012-3432

Guest mode unprivileged code, which has been granted the privilege to
access MMIO regions, may leverage that access to crash the whole guest.
Since this be used to crash a client from within, this vulnerability is
consider with low impact.

CVE-2012-3433

A guest kernel can cause the host to become unresponsive for a period
of time, potentially leading to a DoS. Since an attacker with full
control in the guest can impact on the host, this vulnerability is
consider with high impact.

For the stable distribution (squeeze), this problem has been fixed in
version 4.0.1-5.3.

For the unstable distribution (sid), this problem has been fixed in
version 4.1.3-1.

We recommend that you upgrade your xen packages.";
tag_summary = "The remote host is missing an update to xen
announced via advisory DSA 2531-1.";

tag_solution = "https://secure1.securityspace.com/smysecure/catid.html?in=DSA%202531-1";

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.71820");
 script_cve_id("CVE-2012-3432", "CVE-2012-3433");
 script_tag(name:"cvss_base", value:"4.9");
 script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:C");
 script_version("$Revision: 9352 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2012-08-30 11:32:13 -0400 (Thu, 30 Aug 2012)");
 script_name("Debian Security Advisory DSA 2531-1 (xen)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("Debian Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-deb.inc");
res = "";
report = "";
if((res = isdpkgvuln(pkg:"libxen-dev", ver:"4.0.1-5.3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"libxenstore3.0", ver:"4.0.1-5.3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"xen-docs-4.0", ver:"4.0.1-5.3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"xen-hypervisor-4.0-amd64", ver:"4.0.1-5.3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"xen-hypervisor-4.0-i386", ver:"4.0.1-5.3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"xen-utils-4.0", ver:"4.0.1-5.3", rls:"DEB6.0")) != NULL) {
    report += res;
}
if((res = isdpkgvuln(pkg:"xenstore-utils", ver:"4.0.1-5.3", rls:"DEB6.0")) != NULL) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
