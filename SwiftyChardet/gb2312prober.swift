/*
######################## BEGIN LICENSE BLOCK ########################
# The Original Code is mozilla.org code.
#
# The Initial Developer of the Original Code is
# Netscape Communications Corporation.
# Portions created by the Initial Developer are Copyright (C) 1998
# the Initial Developer. All Rights Reserved.
#
# Contributor(s):
#   Wu Hui Yuan - port to Swift
#   Mark Pilgrim - port to Python
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
# 02110-1301  USA
######################### END LICENSE BLOCK #########################
*/

class GB2312Prober: MultiByteCharSetProber {

    var _codingSM = CodingStateMachine(GB2312_SM_MODEL)
    var _distributionAnalyzer = GB2312DistributionAnalysis()

    init() {
        super.init()
        self.reset()
    }

    override var codingSM: CodingStateMachine {
        return self._codingSM
    }

    override var distributionAnalyzer: CharDistributionAnalysis {
        return self._distributionAnalyzer
    }

    override var charsetName: String {
        return "GB2312"
    }
}