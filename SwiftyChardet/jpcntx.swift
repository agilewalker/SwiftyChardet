/*
######################## BEGIN LICENSE BLOCK ########################
# The Original Code is Mozilla Communicator client code.
#
# The Initial Developer of the Original Code is
# Netscape Communications Corporation.
# Portions created by the Initial Developer are Copyright [C] 1998
# the Initial Developer. All Rights Reserved.
#
# Contributor[s]:
#   Wu Hui Yuan - port to Swift
#   Mark Pilgrim - port to Python
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or [at your option] any later version.
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

// This is hiragana 2-char sequence table, the number in each cell represents its frequency category
let jp2CharContext: [[Int]] = [
    [0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
    [2, 4, 0, 4, 0, 3, 0, 4, 0, 3, 4, 4, 4, 2, 4, 3, 3, 4, 3, 2, 3, 3, 4, 2, 3, 3, 3, 2, 4, 1, 4, 3, 3, 1, 5, 4, 3, 4, 3, 4, 3, 5, 3, 0, 3, 5, 4, 2, 0, 3, 1, 0, 3, 3, 0, 3, 3, 0, 1, 1, 0, 4, 3, 0, 3, 3, 0, 4, 0, 2, 0, 3, 5, 5, 5, 5, 4, 0, 4, 1, 0, 3, 4],
    [0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2],
    [0, 4, 0, 5, 0, 5, 0, 4, 0, 4, 5, 4, 4, 3, 5, 3, 5, 1, 5, 3, 4, 3, 4, 4, 3, 4, 3, 3, 4, 3, 5, 4, 4, 3, 5, 5, 3, 5, 5, 5, 3, 5, 5, 3, 4, 5, 5, 3, 1, 3, 2, 0, 3, 4, 0, 4, 2, 0, 4, 2, 1, 5, 3, 2, 3, 5, 0, 4, 0, 2, 0, 5, 4, 4, 5, 4, 5, 0, 4, 0, 0, 4, 4],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 3, 0, 4, 0, 3, 0, 3, 0, 4, 5, 4, 3, 3, 3, 3, 4, 3, 5, 4, 4, 3, 5, 4, 4, 3, 4, 3, 4, 4, 4, 4, 5, 3, 4, 4, 3, 4, 5, 5, 4, 5, 5, 1, 4, 5, 4, 3, 0, 3, 3, 1, 3, 3, 0, 4, 4, 0, 3, 3, 1, 5, 3, 3, 3, 5, 0, 4, 0, 3, 0, 4, 4, 3, 4, 3, 3, 0, 4, 1, 1, 3, 4],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 4, 0, 3, 0, 3, 0, 4, 0, 3, 4, 4, 3, 2, 2, 1, 2, 1, 3, 1, 3, 3, 3, 3, 3, 4, 3, 1, 3, 3, 5, 3, 3, 0, 4, 3, 0, 5, 4, 3, 3, 5, 4, 4, 3, 4, 4, 5, 0, 1, 2, 0, 1, 2, 0, 2, 2, 0, 1, 0, 0, 5, 2, 2, 1, 4, 0, 3, 0, 1, 0, 4, 4, 3, 5, 4, 3, 0, 2, 1, 0, 4, 3],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 3, 0, 5, 0, 4, 0, 2, 1, 4, 4, 2, 4, 1, 4, 2, 4, 2, 4, 3, 3, 3, 4, 3, 3, 3, 3, 1, 4, 2, 3, 3, 3, 1, 4, 4, 1, 1, 1, 4, 3, 3, 2, 0, 2, 4, 3, 2, 0, 3, 3, 0, 3, 1, 1, 0, 0, 0, 3, 3, 0, 4, 2, 2, 3, 4, 0, 4, 0, 3, 0, 4, 4, 5, 3, 4, 4, 0, 3, 0, 0, 1, 4],
    [1, 4, 0, 4, 0, 4, 0, 4, 0, 3, 5, 4, 4, 3, 4, 3, 5, 4, 3, 3, 4, 3, 5, 4, 4, 4, 4, 3, 4, 2, 4, 3, 3, 1, 5, 4, 3, 2, 4, 5, 4, 5, 5, 4, 4, 5, 4, 4, 0, 3, 2, 2, 3, 3, 0, 4, 3, 1, 3, 2, 1, 4, 3, 3, 4, 5, 0, 3, 0, 2, 0, 4, 5, 5, 4, 5, 4, 0, 4, 0, 0, 5, 4],
    [0, 5, 0, 5, 0, 4, 0, 3, 0, 4, 4, 3, 4, 3, 3, 3, 4, 0, 4, 4, 4, 3, 4, 3, 4, 3, 3, 1, 4, 2, 4, 3, 4, 0, 5, 4, 1, 4, 5, 4, 4, 5, 3, 2, 4, 3, 4, 3, 2, 4, 1, 3, 3, 3, 2, 3, 2, 0, 4, 3, 3, 4, 3, 3, 3, 4, 0, 4, 0, 3, 0, 4, 5, 4, 4, 4, 3, 0, 4, 1, 0, 1, 3],
    [0, 3, 1, 4, 0, 3, 0, 2, 0, 3, 4, 4, 3, 1, 4, 2, 3, 3, 4, 3, 4, 3, 4, 3, 4, 4, 3, 2, 3, 1, 5, 4, 4, 1, 4, 4, 3, 5, 4, 4, 3, 5, 5, 4, 3, 4, 4, 3, 1, 2, 3, 1, 2, 2, 0, 3, 2, 0, 3, 1, 0, 5, 3, 3, 3, 4, 3, 3, 3, 3, 4, 4, 4, 4, 5, 4, 2, 0, 3, 3, 2, 4, 3],
    [0, 2, 0, 3, 0, 1, 0, 1, 0, 0, 3, 2, 0, 0, 2, 0, 1, 0, 2, 1, 3, 3, 3, 1, 2, 3, 1, 0, 1, 0, 4, 2, 1, 1, 3, 3, 0, 4, 3, 3, 1, 4, 3, 3, 0, 3, 3, 2, 0, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 4, 1, 0, 2, 3, 2, 2, 2, 1, 3, 3, 3, 4, 4, 3, 2, 0, 3, 1, 0, 3, 3],
    [0, 4, 0, 4, 0, 3, 0, 3, 0, 4, 4, 4, 3, 3, 3, 3, 3, 3, 4, 3, 4, 2, 4, 3, 4, 3, 3, 2, 4, 3, 4, 5, 4, 1, 4, 5, 3, 5, 4, 5, 3, 5, 4, 0, 3, 5, 5, 3, 1, 3, 3, 2, 2, 3, 0, 3, 4, 1, 3, 3, 2, 4, 3, 3, 3, 4, 0, 4, 0, 3, 0, 4, 5, 4, 4, 5, 3, 0, 4, 1, 0, 3, 4],
    [0, 2, 0, 3, 0, 3, 0, 0, 0, 2, 2, 2, 1, 0, 1, 0, 0, 0, 3, 0, 3, 0, 3, 0, 1, 3, 1, 0, 3, 1, 3, 3, 3, 1, 3, 3, 3, 0, 1, 3, 1, 3, 4, 0, 0, 3, 1, 1, 0, 3, 2, 0, 0, 0, 0, 1, 3, 0, 1, 0, 0, 3, 3, 2, 0, 3, 0, 0, 0, 0, 0, 3, 4, 3, 4, 3, 3, 0, 3, 0, 0, 2, 3],
    [2, 3, 0, 3, 0, 2, 0, 1, 0, 3, 3, 4, 3, 1, 3, 1, 1, 1, 3, 1, 4, 3, 4, 3, 3, 3, 0, 0, 3, 1, 5, 4, 3, 1, 4, 3, 2, 5, 5, 4, 4, 4, 4, 3, 3, 4, 4, 4, 0, 2, 1, 1, 3, 2, 0, 1, 2, 0, 0, 1, 0, 4, 1, 3, 3, 3, 0, 3, 0, 1, 0, 4, 4, 4, 5, 5, 3, 0, 2, 0, 0, 4, 4],
    [0, 2, 0, 1, 0, 3, 1, 3, 0, 2, 3, 3, 3, 0, 3, 1, 0, 0, 3, 0, 3, 2, 3, 1, 3, 2, 1, 1, 0, 0, 4, 2, 1, 0, 2, 3, 1, 4, 3, 2, 0, 4, 4, 3, 1, 3, 1, 3, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 4, 1, 1, 1, 2, 0, 3, 0, 0, 0, 3, 4, 2, 4, 3, 2, 0, 1, 0, 0, 3, 3],
    [0, 1, 0, 4, 0, 5, 0, 4, 0, 2, 4, 4, 2, 3, 3, 2, 3, 3, 5, 3, 3, 3, 4, 3, 4, 2, 3, 0, 4, 3, 3, 3, 4, 1, 4, 3, 2, 1, 5, 5, 3, 4, 5, 1, 3, 5, 4, 2, 0, 3, 3, 0, 1, 3, 0, 4, 2, 0, 1, 3, 1, 4, 3, 3, 3, 3, 0, 3, 0, 1, 0, 3, 4, 4, 4, 5, 5, 0, 3, 0, 1, 4, 5],
    [0, 2, 0, 3, 0, 3, 0, 0, 0, 2, 3, 1, 3, 0, 4, 0, 1, 1, 3, 0, 3, 4, 3, 2, 3, 1, 0, 3, 3, 2, 3, 1, 3, 0, 2, 3, 0, 2, 1, 4, 1, 2, 2, 0, 0, 3, 3, 0, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 2, 2, 0, 3, 2, 1, 3, 3, 0, 2, 0, 2, 0, 0, 3, 3, 1, 2, 4, 0, 3, 0, 2, 2, 3],
    [2, 4, 0, 5, 0, 4, 0, 4, 0, 2, 4, 4, 4, 3, 4, 3, 3, 3, 1, 2, 4, 3, 4, 3, 4, 4, 5, 0, 3, 3, 3, 3, 2, 0, 4, 3, 1, 4, 3, 4, 1, 4, 4, 3, 3, 4, 4, 3, 1, 2, 3, 0, 4, 2, 0, 4, 1, 0, 3, 3, 0, 4, 3, 3, 3, 4, 0, 4, 0, 2, 0, 3, 5, 3, 4, 5, 2, 0, 3, 0, 0, 4, 5],
    [0, 3, 0, 4, 0, 1, 0, 1, 0, 1, 3, 2, 2, 1, 3, 0, 3, 0, 2, 0, 2, 0, 3, 0, 2, 0, 0, 0, 1, 0, 1, 1, 0, 0, 3, 1, 0, 0, 0, 4, 0, 3, 1, 0, 2, 1, 3, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 4, 2, 2, 3, 1, 0, 3, 0, 0, 0, 1, 4, 4, 4, 3, 0, 0, 4, 0, 0, 1, 4],
    [1, 4, 1, 5, 0, 3, 0, 3, 0, 4, 5, 4, 4, 3, 5, 3, 3, 4, 4, 3, 4, 1, 3, 3, 3, 3, 2, 1, 4, 1, 5, 4, 3, 1, 4, 4, 3, 5, 4, 4, 3, 5, 4, 3, 3, 4, 4, 4, 0, 3, 3, 1, 2, 3, 0, 3, 1, 0, 3, 3, 0, 5, 4, 4, 4, 4, 4, 4, 3, 3, 5, 4, 4, 3, 3, 5, 4, 0, 3, 2, 0, 4, 4],
    [0, 2, 0, 3, 0, 1, 0, 0, 0, 1, 3, 3, 3, 2, 4, 1, 3, 0, 3, 1, 3, 0, 2, 2, 1, 1, 0, 0, 2, 0, 4, 3, 1, 0, 4, 3, 0, 4, 4, 4, 1, 4, 3, 1, 1, 3, 3, 1, 0, 2, 0, 0, 1, 3, 0, 0, 0, 0, 2, 0, 0, 4, 3, 2, 4, 3, 5, 4, 3, 3, 3, 4, 3, 3, 4, 3, 3, 0, 2, 1, 0, 3, 3],
    [0, 2, 0, 4, 0, 3, 0, 2, 0, 2, 5, 5, 3, 4, 4, 4, 4, 1, 4, 3, 3, 0, 4, 3, 4, 3, 1, 3, 3, 2, 4, 3, 0, 3, 4, 3, 0, 3, 4, 4, 2, 4, 4, 0, 4, 5, 3, 3, 2, 2, 1, 1, 1, 2, 0, 1, 5, 0, 3, 3, 2, 4, 3, 3, 3, 4, 0, 3, 0, 2, 0, 4, 4, 3, 5, 5, 0, 0, 3, 0, 2, 3, 3],
    [0, 3, 0, 4, 0, 3, 0, 1, 0, 3, 4, 3, 3, 1, 3, 3, 3, 0, 3, 1, 3, 0, 4, 3, 3, 1, 1, 0, 3, 0, 3, 3, 0, 0, 4, 4, 0, 1, 5, 4, 3, 3, 5, 0, 3, 3, 4, 3, 0, 2, 0, 1, 1, 1, 0, 1, 3, 0, 1, 2, 1, 3, 3, 2, 3, 3, 0, 3, 0, 1, 0, 1, 3, 3, 4, 4, 1, 0, 1, 2, 2, 1, 3],
    [0, 1, 0, 4, 0, 4, 0, 3, 0, 1, 3, 3, 3, 2, 3, 1, 1, 0, 3, 0, 3, 3, 4, 3, 2, 4, 2, 0, 1, 0, 4, 3, 2, 0, 4, 3, 0, 5, 3, 3, 2, 4, 4, 4, 3, 3, 3, 4, 0, 1, 3, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 4, 2, 3, 3, 3, 0, 3, 0, 0, 0, 4, 4, 4, 5, 3, 2, 0, 3, 3, 0, 3, 5],
    [0, 2, 0, 3, 0, 0, 0, 3, 0, 1, 3, 0, 2, 0, 0, 0, 1, 0, 3, 1, 1, 3, 3, 0, 0, 3, 0, 0, 3, 0, 2, 3, 1, 0, 3, 1, 0, 3, 3, 2, 0, 4, 2, 2, 0, 2, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 2, 0, 1, 0, 1, 0, 0, 0, 1, 3, 1, 2, 0, 0, 0, 1, 0, 0, 1, 4],
    [0, 3, 0, 3, 0, 5, 0, 1, 0, 2, 4, 3, 1, 3, 3, 2, 1, 1, 5, 2, 1, 0, 5, 1, 2, 0, 0, 0, 3, 3, 2, 2, 3, 2, 4, 3, 0, 0, 3, 3, 1, 3, 3, 0, 2, 5, 3, 4, 0, 3, 3, 0, 1, 2, 0, 2, 2, 0, 3, 2, 0, 2, 2, 3, 3, 3, 0, 2, 0, 1, 0, 3, 4, 4, 2, 5, 4, 0, 3, 0, 0, 3, 5],
    [0, 3, 0, 3, 0, 3, 0, 1, 0, 3, 3, 3, 3, 0, 3, 0, 2, 0, 2, 1, 1, 0, 2, 0, 1, 0, 0, 0, 2, 1, 0, 0, 1, 0, 3, 2, 0, 0, 3, 3, 1, 2, 3, 1, 0, 3, 3, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 3, 1, 2, 3, 0, 3, 0, 1, 0, 3, 2, 1, 0, 4, 3, 0, 1, 1, 0, 3, 3],
    [0, 4, 0, 5, 0, 3, 0, 3, 0, 4, 5, 5, 4, 3, 5, 3, 4, 3, 5, 3, 3, 2, 5, 3, 4, 4, 4, 3, 4, 3, 4, 5, 5, 3, 4, 4, 3, 4, 4, 5, 4, 4, 4, 3, 4, 5, 5, 4, 2, 3, 4, 2, 3, 4, 0, 3, 3, 1, 4, 3, 2, 4, 3, 3, 5, 5, 0, 3, 0, 3, 0, 5, 5, 5, 5, 4, 4, 0, 4, 0, 1, 4, 4],
    [0, 4, 0, 4, 0, 3, 0, 3, 0, 3, 5, 4, 4, 2, 3, 2, 5, 1, 3, 2, 5, 1, 4, 2, 3, 2, 3, 3, 4, 3, 3, 3, 3, 2, 5, 4, 1, 3, 3, 5, 3, 4, 4, 0, 4, 4, 3, 1, 1, 3, 1, 0, 2, 3, 0, 2, 3, 0, 3, 0, 0, 4, 3, 1, 3, 4, 0, 3, 0, 2, 0, 4, 4, 4, 3, 4, 5, 0, 4, 0, 0, 3, 4],
    [0, 3, 0, 3, 0, 3, 1, 2, 0, 3, 4, 4, 3, 3, 3, 0, 2, 2, 4, 3, 3, 1, 3, 3, 3, 1, 1, 0, 3, 1, 4, 3, 2, 3, 4, 4, 2, 4, 4, 4, 3, 4, 4, 3, 2, 4, 4, 3, 1, 3, 3, 1, 3, 3, 0, 4, 1, 0, 2, 2, 1, 4, 3, 2, 3, 3, 5, 4, 3, 3, 5, 4, 4, 3, 3, 0, 4, 0, 3, 2, 2, 4, 4],
    [0, 2, 0, 1, 0, 0, 0, 0, 0, 1, 2, 1, 3, 0, 0, 0, 0, 0, 2, 0, 1, 2, 1, 0, 0, 1, 0, 0, 0, 0, 3, 0, 0, 1, 0, 1, 1, 3, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 2, 0, 3, 4, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1],
    [0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 4, 0, 4, 1, 4, 0, 3, 0, 4, 0, 3, 0, 4, 0, 3, 0, 3, 0, 4, 1, 5, 1, 4, 0, 0, 3, 0, 5, 0, 5, 2, 0, 1, 0, 0, 0, 2, 1, 4, 0, 1, 3, 0, 0, 3, 0, 0, 3, 1, 1, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 4, 0, 5, 0, 3, 0, 2, 0, 3, 5, 4, 4, 3, 4, 3, 5, 3, 4, 3, 3, 0, 4, 3, 3, 3, 3, 3, 3, 2, 4, 4, 3, 1, 3, 4, 4, 5, 4, 4, 3, 4, 4, 1, 3, 5, 4, 3, 3, 3, 1, 2, 2, 3, 3, 1, 3, 1, 3, 3, 3, 5, 3, 3, 4, 5, 0, 3, 0, 3, 0, 3, 4, 3, 4, 4, 3, 0, 3, 0, 2, 4, 3],
    [0, 1, 0, 4, 0, 0, 0, 0, 0, 1, 4, 0, 4, 1, 4, 2, 4, 0, 3, 0, 1, 0, 1, 0, 0, 0, 0, 0, 2, 0, 3, 1, 1, 1, 0, 3, 0, 0, 0, 1, 2, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 3, 0, 0, 0, 0, 3, 2, 0, 2, 2, 0, 1, 0, 0, 0, 2, 3, 2, 3, 3, 0, 0, 0, 0, 2, 1, 0],
    [0, 5, 1, 5, 0, 3, 0, 3, 0, 5, 4, 4, 5, 1, 5, 3, 3, 0, 4, 3, 4, 3, 5, 3, 4, 3, 3, 2, 4, 3, 4, 3, 3, 0, 3, 3, 1, 4, 4, 3, 4, 4, 4, 3, 4, 5, 5, 3, 2, 3, 1, 1, 3, 3, 1, 3, 1, 1, 3, 3, 2, 4, 5, 3, 3, 5, 0, 4, 0, 3, 0, 4, 4, 3, 5, 3, 3, 0, 3, 4, 0, 4, 3],
    [0, 5, 0, 5, 0, 3, 0, 2, 0, 4, 4, 3, 5, 2, 4, 3, 3, 3, 4, 4, 4, 3, 5, 3, 5, 3, 3, 1, 4, 0, 4, 3, 3, 0, 3, 3, 0, 4, 4, 4, 4, 5, 4, 3, 3, 5, 5, 3, 2, 3, 1, 2, 3, 2, 0, 1, 0, 0, 3, 2, 2, 4, 4, 3, 1, 5, 0, 4, 0, 3, 0, 4, 3, 1, 3, 2, 1, 0, 3, 3, 0, 3, 3],
    [0, 4, 0, 5, 0, 5, 0, 4, 0, 4, 5, 5, 5, 3, 4, 3, 3, 2, 5, 4, 4, 3, 5, 3, 5, 3, 4, 0, 4, 3, 4, 4, 3, 2, 4, 4, 3, 4, 5, 4, 4, 5, 5, 0, 3, 5, 5, 4, 1, 3, 3, 2, 3, 3, 1, 3, 1, 0, 4, 3, 1, 4, 4, 3, 4, 5, 0, 4, 0, 2, 0, 4, 3, 4, 4, 3, 3, 0, 4, 0, 0, 5, 5],
    [0, 4, 0, 4, 0, 5, 0, 1, 1, 3, 3, 4, 4, 3, 4, 1, 3, 0, 5, 1, 3, 0, 3, 1, 3, 1, 1, 0, 3, 0, 3, 3, 4, 0, 4, 3, 0, 4, 4, 4, 3, 4, 4, 0, 3, 5, 4, 1, 0, 3, 0, 0, 2, 3, 0, 3, 1, 0, 3, 1, 0, 3, 2, 1, 3, 5, 0, 3, 0, 1, 0, 3, 2, 3, 3, 4, 4, 0, 2, 2, 0, 4, 4],
    [2, 4, 0, 5, 0, 4, 0, 3, 0, 4, 5, 5, 4, 3, 5, 3, 5, 3, 5, 3, 5, 2, 5, 3, 4, 3, 3, 4, 3, 4, 5, 3, 2, 1, 5, 4, 3, 2, 3, 4, 5, 3, 4, 1, 2, 5, 4, 3, 0, 3, 3, 0, 3, 2, 0, 2, 3, 0, 4, 1, 0, 3, 4, 3, 3, 5, 0, 3, 0, 1, 0, 4, 5, 5, 5, 4, 3, 0, 4, 2, 0, 3, 5],
    [0, 5, 0, 4, 0, 4, 0, 2, 0, 5, 4, 3, 4, 3, 4, 3, 3, 3, 4, 3, 4, 2, 5, 3, 5, 3, 4, 1, 4, 3, 4, 4, 4, 0, 3, 5, 0, 4, 4, 4, 4, 5, 3, 1, 3, 4, 5, 3, 3, 3, 3, 3, 3, 3, 0, 2, 2, 0, 3, 3, 2, 4, 3, 3, 3, 5, 3, 4, 1, 3, 3, 5, 3, 2, 0, 0, 0, 0, 4, 3, 1, 3, 3],
    [0, 1, 0, 3, 0, 3, 0, 1, 0, 1, 3, 3, 3, 2, 3, 3, 3, 0, 3, 0, 0, 0, 3, 1, 3, 0, 0, 0, 2, 2, 2, 3, 0, 0, 3, 2, 0, 1, 2, 4, 1, 3, 3, 0, 0, 3, 3, 3, 0, 1, 0, 0, 2, 1, 0, 0, 3, 0, 3, 1, 0, 3, 0, 0, 1, 3, 0, 2, 0, 1, 0, 3, 3, 1, 3, 3, 0, 0, 1, 1, 0, 3, 3],
    [0, 2, 0, 3, 0, 2, 1, 4, 0, 2, 2, 3, 1, 1, 3, 1, 1, 0, 2, 0, 3, 1, 2, 3, 1, 3, 0, 0, 1, 0, 4, 3, 2, 3, 3, 3, 1, 4, 2, 3, 3, 3, 3, 1, 0, 3, 1, 4, 0, 1, 1, 0, 1, 2, 0, 1, 1, 0, 1, 1, 0, 3, 1, 3, 2, 2, 0, 1, 0, 0, 0, 2, 3, 3, 3, 1, 0, 0, 0, 0, 0, 2, 3],
    [0, 5, 0, 4, 0, 5, 0, 2, 0, 4, 5, 5, 3, 3, 4, 3, 3, 1, 5, 4, 4, 2, 4, 4, 4, 3, 4, 2, 4, 3, 5, 5, 4, 3, 3, 4, 3, 3, 5, 5, 4, 5, 5, 1, 3, 4, 5, 3, 1, 4, 3, 1, 3, 3, 0, 3, 3, 1, 4, 3, 1, 4, 5, 3, 3, 5, 0, 4, 0, 3, 0, 5, 3, 3, 1, 4, 3, 0, 4, 0, 1, 5, 3],
    [0, 5, 0, 5, 0, 4, 0, 2, 0, 4, 4, 3, 4, 3, 3, 3, 3, 3, 5, 4, 4, 4, 4, 4, 4, 5, 3, 3, 5, 2, 4, 4, 4, 3, 4, 4, 3, 3, 4, 4, 5, 5, 3, 3, 4, 3, 4, 3, 3, 4, 3, 3, 3, 3, 1, 2, 2, 1, 4, 3, 3, 5, 4, 4, 3, 4, 0, 4, 0, 3, 0, 4, 4, 4, 4, 4, 1, 0, 4, 2, 0, 2, 4],
    [0, 4, 0, 4, 0, 3, 0, 1, 0, 3, 5, 2, 3, 0, 3, 0, 2, 1, 4, 2, 3, 3, 4, 1, 4, 3, 3, 2, 4, 1, 3, 3, 3, 0, 3, 3, 0, 0, 3, 3, 3, 5, 3, 3, 3, 3, 3, 2, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 1, 0, 0, 3, 1, 2, 2, 3, 0, 3, 0, 2, 0, 4, 4, 3, 3, 4, 1, 0, 3, 0, 0, 2, 4],
    [0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 2, 0, 0, 0, 0, 0, 1, 0, 2, 0, 1, 0, 0, 0, 0, 0, 3, 1, 3, 0, 3, 2, 0, 0, 0, 1, 0, 3, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 4, 0, 2, 0, 0, 0, 0, 0, 0, 2],
    [0, 2, 1, 3, 0, 2, 0, 2, 0, 3, 3, 3, 3, 1, 3, 1, 3, 3, 3, 3, 3, 3, 4, 2, 2, 1, 2, 1, 4, 0, 4, 3, 1, 3, 3, 3, 2, 4, 3, 5, 4, 3, 3, 3, 3, 3, 3, 3, 0, 1, 3, 0, 2, 0, 0, 1, 0, 0, 1, 0, 0, 4, 2, 0, 2, 3, 0, 3, 3, 0, 3, 3, 4, 2, 3, 1, 4, 0, 1, 2, 0, 2, 3],
    [0, 3, 0, 3, 0, 1, 0, 3, 0, 2, 3, 3, 3, 0, 3, 1, 2, 0, 3, 3, 2, 3, 3, 2, 3, 2, 3, 1, 3, 0, 4, 3, 2, 0, 3, 3, 1, 4, 3, 3, 2, 3, 4, 3, 1, 3, 3, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 4, 1, 1, 0, 3, 0, 3, 1, 0, 2, 3, 3, 3, 3, 3, 1, 0, 0, 2, 0, 3, 3],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 2, 0, 3, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 0, 3, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 2, 0, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 3],
    [0, 2, 0, 3, 1, 3, 0, 3, 0, 2, 3, 3, 3, 1, 3, 1, 3, 1, 3, 1, 3, 3, 3, 1, 3, 0, 2, 3, 1, 1, 4, 3, 3, 2, 3, 3, 1, 2, 2, 4, 1, 3, 3, 0, 1, 4, 2, 3, 0, 1, 3, 0, 3, 0, 0, 1, 3, 0, 2, 0, 0, 3, 3, 2, 1, 3, 0, 3, 0, 2, 0, 3, 4, 4, 4, 3, 1, 0, 3, 0, 0, 3, 3],
    [0, 2, 0, 1, 0, 2, 0, 0, 0, 1, 3, 2, 2, 1, 3, 0, 1, 1, 3, 0, 3, 2, 3, 1, 2, 0, 2, 0, 1, 1, 3, 3, 3, 0, 3, 3, 1, 1, 2, 3, 2, 3, 3, 1, 2, 3, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 3, 0, 1, 0, 0, 2, 1, 2, 1, 3, 0, 3, 0, 0, 0, 3, 4, 4, 4, 3, 2, 0, 2, 0, 0, 2, 4],
    [0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0, 3],
    [0, 3, 0, 3, 0, 2, 0, 3, 0, 3, 3, 3, 2, 3, 2, 2, 2, 0, 3, 1, 3, 3, 3, 2, 3, 3, 0, 0, 3, 0, 3, 2, 2, 0, 2, 3, 1, 4, 3, 4, 3, 3, 2, 3, 1, 5, 4, 4, 0, 3, 1, 2, 1, 3, 0, 3, 1, 1, 2, 0, 2, 3, 1, 3, 1, 3, 0, 3, 0, 1, 0, 3, 3, 4, 4, 2, 1, 0, 2, 1, 0, 2, 4],
    [0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 4, 2, 5, 1, 4, 0, 2, 0, 2, 1, 3, 1, 4, 0, 2, 1, 0, 0, 2, 1, 4, 1, 1, 0, 3, 3, 0, 5, 1, 3, 2, 3, 3, 1, 0, 3, 2, 3, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 4, 0, 1, 0, 3, 0, 2, 0, 1, 0, 3, 3, 3, 4, 3, 3, 0, 0, 0, 0, 2, 3],
    [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 1, 0, 0, 0, 0, 0, 3],
    [0, 1, 0, 3, 0, 4, 0, 3, 0, 2, 4, 3, 1, 0, 3, 2, 2, 1, 3, 1, 2, 2, 3, 1, 1, 1, 2, 1, 3, 0, 1, 2, 0, 1, 3, 2, 1, 3, 0, 5, 5, 1, 0, 0, 1, 3, 2, 1, 0, 3, 0, 0, 1, 0, 0, 0, 0, 0, 3, 4, 0, 1, 1, 1, 3, 2, 0, 2, 0, 1, 0, 2, 3, 3, 1, 2, 3, 0, 1, 0, 1, 0, 4],
    [0, 0, 0, 1, 0, 3, 0, 3, 0, 2, 2, 1, 0, 0, 4, 0, 3, 0, 3, 1, 3, 0, 3, 0, 3, 0, 1, 0, 3, 0, 3, 1, 3, 0, 3, 3, 0, 0, 1, 2, 1, 1, 1, 0, 1, 2, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 1, 2, 0, 0, 2, 0, 0, 0, 0, 2, 3, 3, 3, 3, 0, 0, 0, 0, 1, 4],
    [0, 0, 0, 3, 0, 3, 0, 0, 0, 0, 3, 1, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 3, 0, 2, 0, 2, 3, 0, 0, 2, 2, 3, 1, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 2, 0, 0, 0, 0, 2, 3],
    [2, 4, 0, 5, 0, 5, 0, 4, 0, 3, 4, 3, 3, 3, 4, 3, 3, 3, 4, 3, 4, 4, 5, 4, 5, 5, 5, 2, 3, 0, 5, 5, 4, 1, 5, 4, 3, 1, 5, 4, 3, 4, 4, 3, 3, 4, 3, 3, 0, 3, 2, 0, 2, 3, 0, 3, 0, 0, 3, 3, 0, 5, 3, 2, 3, 3, 0, 3, 0, 3, 0, 3, 4, 5, 4, 5, 3, 0, 4, 3, 0, 3, 4],
    [0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 3, 4, 3, 2, 3, 2, 3, 0, 4, 3, 3, 3, 3, 3, 3, 3, 3, 0, 3, 2, 4, 3, 3, 1, 3, 4, 3, 4, 4, 4, 3, 4, 4, 3, 2, 4, 4, 1, 0, 2, 0, 0, 1, 1, 0, 2, 0, 0, 3, 1, 0, 5, 3, 2, 1, 3, 0, 3, 0, 1, 2, 4, 3, 2, 4, 3, 3, 0, 3, 2, 0, 4, 4],
    [0, 3, 0, 3, 0, 1, 0, 0, 0, 1, 4, 3, 3, 2, 3, 1, 3, 1, 4, 2, 3, 2, 4, 2, 3, 4, 3, 0, 2, 2, 3, 3, 3, 0, 3, 3, 3, 0, 3, 4, 1, 3, 3, 0, 3, 4, 3, 3, 0, 1, 1, 0, 1, 0, 0, 0, 4, 0, 3, 0, 0, 3, 1, 2, 1, 3, 0, 4, 0, 1, 0, 4, 3, 3, 4, 3, 3, 0, 2, 0, 0, 3, 3],
    [0, 3, 0, 4, 0, 1, 0, 3, 0, 3, 4, 3, 3, 0, 3, 3, 3, 1, 3, 1, 3, 3, 4, 3, 3, 3, 0, 0, 3, 1, 5, 3, 3, 1, 3, 3, 2, 5, 4, 3, 3, 4, 5, 3, 2, 5, 3, 4, 0, 1, 0, 0, 0, 0, 0, 2, 0, 0, 1, 1, 0, 4, 2, 2, 1, 3, 0, 3, 0, 2, 0, 4, 4, 3, 5, 3, 2, 0, 1, 1, 0, 3, 4],
    [0, 5, 0, 4, 0, 5, 0, 2, 0, 4, 4, 3, 3, 2, 3, 3, 3, 1, 4, 3, 4, 1, 5, 3, 4, 3, 4, 0, 4, 2, 4, 3, 4, 1, 5, 4, 0, 4, 4, 4, 4, 5, 4, 1, 3, 5, 4, 2, 1, 4, 1, 1, 3, 2, 0, 3, 1, 0, 3, 2, 1, 4, 3, 3, 3, 4, 0, 4, 0, 3, 0, 4, 4, 4, 3, 3, 3, 0, 4, 2, 0, 3, 4],
    [1, 4, 0, 4, 0, 3, 0, 1, 0, 3, 3, 3, 1, 1, 3, 3, 2, 2, 3, 3, 1, 0, 3, 2, 2, 1, 2, 0, 3, 1, 2, 1, 2, 0, 3, 2, 0, 2, 2, 3, 3, 4, 3, 0, 3, 3, 1, 2, 0, 1, 1, 3, 1, 2, 0, 0, 3, 0, 1, 1, 0, 3, 2, 2, 3, 3, 0, 3, 0, 0, 0, 2, 3, 3, 4, 3, 3, 0, 1, 0, 0, 1, 4],
    [0, 4, 0, 4, 0, 4, 0, 0, 0, 3, 4, 4, 3, 1, 4, 2, 3, 2, 3, 3, 3, 1, 4, 3, 4, 0, 3, 0, 4, 2, 3, 3, 2, 2, 5, 4, 2, 1, 3, 4, 3, 4, 3, 1, 3, 3, 4, 2, 0, 2, 1, 0, 3, 3, 0, 0, 2, 0, 3, 1, 0, 4, 4, 3, 4, 3, 0, 4, 0, 1, 0, 2, 4, 4, 4, 4, 4, 0, 3, 2, 0, 3, 3],
    [0, 0, 0, 1, 0, 4, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 3, 2, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2],
    [0, 2, 0, 3, 0, 4, 0, 4, 0, 1, 3, 3, 3, 0, 4, 0, 2, 1, 2, 1, 1, 1, 2, 0, 3, 1, 1, 0, 1, 0, 3, 1, 0, 0, 3, 3, 2, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 2, 0, 2, 2, 0, 3, 1, 0, 0, 1, 0, 1, 1, 0, 1, 2, 0, 3, 0, 0, 0, 0, 1, 0, 0, 3, 3, 4, 3, 1, 0, 1, 0, 3, 0, 2],
    [0, 0, 0, 3, 0, 5, 0, 0, 0, 0, 1, 0, 2, 0, 3, 1, 0, 1, 3, 0, 0, 0, 2, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 4, 0, 0, 0, 2, 3, 0, 1, 4, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 3, 0, 0, 0, 0, 0, 3],
    [0, 2, 0, 5, 0, 5, 0, 1, 0, 2, 4, 3, 3, 2, 5, 1, 3, 2, 3, 3, 3, 0, 4, 1, 2, 0, 3, 0, 4, 0, 2, 2, 1, 1, 5, 3, 0, 0, 1, 4, 2, 3, 2, 0, 3, 3, 3, 2, 0, 2, 4, 1, 1, 2, 0, 1, 1, 0, 3, 1, 0, 1, 3, 1, 2, 3, 0, 2, 0, 0, 0, 1, 3, 5, 4, 4, 4, 0, 3, 0, 0, 1, 3],
    [0, 4, 0, 5, 0, 4, 0, 4, 0, 4, 5, 4, 3, 3, 4, 3, 3, 3, 4, 3, 4, 4, 5, 3, 4, 5, 4, 2, 4, 2, 3, 4, 3, 1, 4, 4, 1, 3, 5, 4, 4, 5, 5, 4, 4, 5, 5, 5, 2, 3, 3, 1, 4, 3, 1, 3, 3, 0, 3, 3, 1, 4, 3, 4, 4, 4, 0, 3, 0, 4, 0, 3, 3, 4, 4, 5, 0, 0, 4, 3, 0, 4, 5],
    [0, 4, 0, 4, 0, 3, 0, 3, 0, 3, 4, 4, 4, 3, 3, 2, 4, 3, 4, 3, 4, 3, 5, 3, 4, 3, 2, 1, 4, 2, 4, 4, 3, 1, 3, 4, 2, 4, 5, 5, 3, 4, 5, 4, 1, 5, 4, 3, 0, 3, 2, 2, 3, 2, 1, 3, 1, 0, 3, 3, 3, 5, 3, 3, 3, 5, 4, 4, 2, 3, 3, 4, 3, 3, 3, 2, 1, 0, 3, 2, 1, 4, 3],
    [0, 4, 0, 5, 0, 4, 0, 3, 0, 3, 5, 5, 3, 2, 4, 3, 4, 0, 5, 4, 4, 1, 4, 4, 4, 3, 3, 3, 4, 3, 5, 5, 2, 3, 3, 4, 1, 2, 5, 5, 3, 5, 5, 2, 3, 5, 5, 4, 0, 3, 2, 0, 3, 3, 1, 1, 5, 1, 4, 1, 0, 4, 3, 2, 3, 5, 0, 4, 0, 3, 0, 5, 4, 3, 4, 3, 0, 0, 4, 1, 0, 4, 4],
    [1, 3, 0, 4, 0, 2, 0, 2, 0, 2, 5, 5, 3, 3, 3, 3, 3, 0, 4, 2, 3, 4, 4, 4, 3, 4, 0, 0, 3, 4, 5, 4, 3, 3, 3, 3, 2, 5, 5, 4, 5, 5, 5, 4, 3, 5, 5, 5, 1, 3, 1, 0, 1, 0, 0, 3, 2, 0, 4, 2, 0, 5, 2, 3, 2, 4, 1, 3, 0, 3, 0, 4, 5, 4, 5, 4, 3, 0, 4, 2, 0, 5, 4],
    [0, 3, 0, 4, 0, 5, 0, 3, 0, 3, 4, 4, 3, 2, 3, 2, 3, 3, 3, 3, 3, 2, 4, 3, 3, 2, 2, 0, 3, 3, 3, 3, 3, 1, 3, 3, 3, 0, 4, 4, 3, 4, 4, 1, 1, 4, 4, 2, 0, 3, 1, 0, 1, 1, 0, 4, 1, 0, 2, 3, 1, 3, 3, 1, 3, 4, 0, 3, 0, 1, 0, 3, 1, 3, 0, 0, 1, 0, 2, 0, 0, 4, 4],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 3, 0, 3, 0, 2, 0, 3, 0, 1, 5, 4, 3, 3, 3, 1, 4, 2, 1, 2, 3, 4, 4, 2, 4, 4, 5, 0, 3, 1, 4, 3, 4, 0, 4, 3, 3, 3, 2, 3, 2, 5, 3, 4, 3, 2, 2, 3, 0, 0, 3, 0, 2, 1, 0, 1, 2, 0, 0, 0, 0, 2, 1, 1, 3, 1, 0, 2, 0, 4, 0, 3, 4, 4, 4, 5, 2, 0, 2, 0, 0, 1, 3],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 4, 2, 1, 1, 0, 1, 0, 3, 2, 0, 0, 3, 1, 1, 1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 1, 0, 0, 0, 2, 0, 0, 0, 1, 4, 0, 4, 2, 1, 0, 0, 0, 0, 0, 1],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 3, 1, 0, 0, 0, 2, 0, 2, 1, 0, 0, 1, 2, 1, 0, 1, 1, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0, 0, 1, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2],
    [0, 4, 0, 4, 0, 4, 0, 3, 0, 4, 4, 3, 4, 2, 4, 3, 2, 0, 4, 4, 4, 3, 5, 3, 5, 3, 3, 2, 4, 2, 4, 3, 4, 3, 1, 4, 0, 2, 3, 4, 4, 4, 3, 3, 3, 4, 4, 4, 3, 4, 1, 3, 4, 3, 2, 1, 2, 1, 3, 3, 3, 4, 4, 3, 3, 5, 0, 4, 0, 3, 0, 4, 3, 3, 3, 2, 1, 0, 3, 0, 0, 3, 3],
    [0, 4, 0, 3, 0, 3, 0, 3, 0, 3, 5, 5, 3, 3, 3, 3, 4, 3, 4, 3, 3, 3, 4, 4, 4, 3, 3, 3, 3, 4, 3, 5, 3, 3, 1, 3, 2, 4, 5, 5, 5, 5, 4, 3, 4, 5, 5, 3, 2, 2, 3, 3, 3, 3, 2, 3, 3, 1, 2, 3, 2, 4, 3, 3, 3, 4, 0, 4, 0, 2, 0, 4, 3, 2, 2, 1, 2, 0, 3, 0, 0, 4, 1],
]

class JapaneseContextAnalysis {
    let NUM_OF_CATEGORY = 6
    let DONT_KNOW: Double = -1
    let ENOUGH_REL_THRESHOLD = 100
    let MAX_REL_THRESHOLD = 1000
    let MINIMUM_DATA_THRESHOLD = 4

    var _total_rel: Int
    var _rel_sample: [Int]
    var _need_to_skip_char_num: Int
    var _last_char_order: Int
    var _done: Bool

    init() {
        self._total_rel = 0  // total sequence received
        // category counters, each integer counts sequence in its category
        self._rel_sample = [Int](count: self.NUM_OF_CATEGORY, repeatedValue: 0)
        // if last byte in current buffer is not the last byte of a character,
        // we need to know how many bytes to skip in next buffer
        self._need_to_skip_char_num = 0
        self._last_char_order = -1  // The order of previous char
        // If this flag is set to True, detection is done and conclusion has
        // been made
        self._done = false
        self.reset()
    }

    func reset() {
        self._total_rel = 0  // total sequence received
        // category counters, each integer counts sequence in its category
        self._rel_sample = [Int](count: self.NUM_OF_CATEGORY, repeatedValue: 0)
        // if last byte in current buffer is not the last byte of a character,
        // we need to know how many bytes to skip in next buffer
        self._need_to_skip_char_num = 0
        self._last_char_order = -1  // The order of previous char
        // If this flag is set to True, detection is done and conclusion has
        // been made
        self._done = false
    }

    func feed(byte_str: [UInt8], _ num_bytes: Int) {
        if self._done {
            return
        }
        // The buffer we got is byte oriented, and a character may span in more than one
        // buffers. In case the last one or two byte in last buffer is not
        // complete, we record how many byte needed to complete that character
        // and skip these bytes here.  We can choose to record those bytes as
        // well and analyse the character once it is complete, but since a
        // character will not make much difference, by simply skipping
        // this character will simply our logic and improve performance.
        var i = self._need_to_skip_char_num
        while i < num_bytes {
            let (order, char_len) = self.getOrder([UInt8](byte_str[i ..< min(len(byte_str), i + 2)]))
            i += char_len
            if i > num_bytes {
                self._need_to_skip_char_num = i - num_bytes
                self._last_char_order = -1
            } else {
                if (order != -1) && (self._last_char_order != -1) {
                    self._total_rel += 1
                    if self._total_rel > self.MAX_REL_THRESHOLD {
                        self._done = true
                        break
                    }
                    self._rel_sample[jp2CharContext[self._last_char_order][order]] += 1
                }
                self._last_char_order = order
            }
        }
    }

    var gotEnoughData: Bool {
        return self._total_rel > self.ENOUGH_REL_THRESHOLD
    }

    var charsetName: String {
        fatalError("var charsetName getter not implemented")
    }

    var confidence: Double {
        // This is just one way to calculate confidence. It works well for me.
        if self._total_rel > self.MINIMUM_DATA_THRESHOLD {
            return Double(self._total_rel - Int(self._rel_sample[0])) / Double(self._total_rel)
        } else {
            return self.DONT_KNOW
        }
    }

    func getOrder(byte_str: [UInt8]) -> (Int, Int) {
        return (-1, 1)
    }
}

class SJISContextAnalysis: JapaneseContextAnalysis {
    var _charset_name: String
    override init() {
        self._charset_name = "SHIFT_JIS"
        super.init()
    }

    override var charsetName: String {
        return self._charset_name
    }

    override func getOrder(byte_str: [UInt8]) -> (Int, Int) {
        if !byte_str {
            return (-1, 1)
        }
        // find out current char's byte length
        let first_char = byte_str[0]
        var char_len: Int
        if ((0x81 <= first_char) && (first_char <= 0x9F)) || ((0xE0 <= first_char) && (first_char <= 0xFC)) {
            char_len = 2
            if (first_char == 0x87) || ((0xFA <= first_char) && (first_char <= 0xFC)) {
                self._charset_name = "CP932"
            }
        } else {
            char_len = 1
        }
        // return its order if it is hiragana
        if len(byte_str) > 1 {
            let second_char = byte_str[1]
            if (first_char == 202) && ((0x9F <= second_char) && (second_char <= 0xF1)) {
                return (Int(second_char) - 0x9F, char_len)
            }
        }
        return (-1, char_len)
    }
}

class EUCJPContextAnalysis: JapaneseContextAnalysis {
    func get_order(byte_str: [UInt8]) -> (Int, Int) {
        if !byte_str {
            return (-1, 1)
        }
        // find out current char's byte length
        let first_char = byte_str[0]
        var char_len: Int
        if (first_char == 0x8E) || ((0xA1 <= first_char) && (first_char <= 0xFE)) {
            char_len = 2
        } else if first_char == 0x8F {
            char_len = 3
        } else {
            char_len = 1
        }
        // return its order if it is hiragana
        if len(byte_str) > 1 {
            let second_char = byte_str[1]
            if (first_char == 0xA4) && ((0xA1 <= second_char) && (second_char <= 0xF3)) {
                return (Int(second_char) - 0xA1, char_len)
            }
        }
        return (-1, char_len)
    }
}
