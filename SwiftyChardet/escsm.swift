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

let HZ_CLS: [Int] = [
    1, 0, 0, 0, 0, 0, 0, 0, // 00 - 07
    0, 0, 0, 0, 0, 0, 0, 0, // 08 - 0f
    0, 0, 0, 0, 0, 0, 0, 0, // 10 - 17
    0, 0, 0, 1, 0, 0, 0, 0, // 18 - 1f
    0, 0, 0, 0, 0, 0, 0, 0, // 20 - 27
    0, 0, 0, 0, 0, 0, 0, 0, // 28 - 2f
    0, 0, 0, 0, 0, 0, 0, 0, // 30 - 37
    0, 0, 0, 0, 0, 0, 0, 0, // 38 - 3f
    0, 0, 0, 0, 0, 0, 0, 0, // 40 - 47
    0, 0, 0, 0, 0, 0, 0, 0, // 48 - 4f
    0, 0, 0, 0, 0, 0, 0, 0, // 50 - 57
    0, 0, 0, 0, 0, 0, 0, 0, // 58 - 5f
    0, 0, 0, 0, 0, 0, 0, 0, // 60 - 67
    0, 0, 0, 0, 0, 0, 0, 0, // 68 - 6f
    0, 0, 0, 0, 0, 0, 0, 0, // 70 - 77
    0, 0, 0, 4, 0, 5, 2, 0, // 78 - 7f
    1, 1, 1, 1, 1, 1, 1, 1, // 80 - 87
    1, 1, 1, 1, 1, 1, 1, 1, // 88 - 8f
    1, 1, 1, 1, 1, 1, 1, 1, // 90 - 97
    1, 1, 1, 1, 1, 1, 1, 1, // 98 - 9f
    1, 1, 1, 1, 1, 1, 1, 1, // a0 - a7
    1, 1, 1, 1, 1, 1, 1, 1, // a8 - af
    1, 1, 1, 1, 1, 1, 1, 1, // b0 - b7
    1, 1, 1, 1, 1, 1, 1, 1, // b8 - bf
    1, 1, 1, 1, 1, 1, 1, 1, // c0 - c7
    1, 1, 1, 1, 1, 1, 1, 1, // c8 - cf
    1, 1, 1, 1, 1, 1, 1, 1, // d0 - d7
    1, 1, 1, 1, 1, 1, 1, 1, // d8 - df
    1, 1, 1, 1, 1, 1, 1, 1, // e0 - e7
    1, 1, 1, 1, 1, 1, 1, 1, // e8 - ef
    1, 1, 1, 1, 1, 1, 1, 1, // f0 - f7
    1, 1, 1, 1, 1, 1, 1, 1, // f8 - ff
]

let HZ_ST: [MachineState] = [
    .start,     .error,     ._3,        .start,     .start,     .start,     .error,     .error,     // 00-07
    .error,     .error,     .error,     .error,     .its_me,    .its_me,    .its_me,    .its_me,    // 08-0f
    .its_me,    .its_me,    .error,     .error,     .start,     .start,     ._4,        .error,     // 10-17
    ._5,        .error,     ._6,        .error,     ._5,        ._5,        ._4,        .error,     // 18-1f
    ._4,        .error,     ._4,        ._4,        ._4,        .error,     ._4,        .error,     // 20-27
    ._4,        .its_me,    .start,     .start,     .start,     .start,     .start,     .start,     // 28-2f
]

let HZ_CHAR_LEN_TABLE = [0, 0, 0, 0, 0, 0]

let HZ_SM_MODEL = (
    class_table: HZ_CLS,
    class_factor: 6,
    state_table: HZ_ST,
    char_len_table: HZ_CHAR_LEN_TABLE,
    name: "HZ-GB-2312")

let ISO2022CN_CLS: [Int] = [
    2, 0, 0, 0, 0, 0, 0, 0, // 00 - 07
    0, 0, 0, 0, 0, 0, 0, 0, // 08 - 0f
    0, 0, 0, 0, 0, 0, 0, 0, // 10 - 17
    0, 0, 0, 1, 0, 0, 0, 0, // 18 - 1f
    0, 0, 0, 0, 0, 0, 0, 0, // 20 - 27
    0, 3, 0, 0, 0, 0, 0, 0, // 28 - 2f
    0, 0, 0, 0, 0, 0, 0, 0, // 30 - 37
    0, 0, 0, 0, 0, 0, 0, 0, // 38 - 3f
    0, 0, 0, 4, 0, 0, 0, 0, // 40 - 47
    0, 0, 0, 0, 0, 0, 0, 0, // 48 - 4f
    0, 0, 0, 0, 0, 0, 0, 0, // 50 - 57
    0, 0, 0, 0, 0, 0, 0, 0, // 58 - 5f
    0, 0, 0, 0, 0, 0, 0, 0, // 60 - 67
    0, 0, 0, 0, 0, 0, 0, 0, // 68 - 6f
    0, 0, 0, 0, 0, 0, 0, 0, // 70 - 77
    0, 0, 0, 0, 0, 0, 0, 0, // 78 - 7f
    2, 2, 2, 2, 2, 2, 2, 2, // 80 - 87
    2, 2, 2, 2, 2, 2, 2, 2, // 88 - 8f
    2, 2, 2, 2, 2, 2, 2, 2, // 90 - 97
    2, 2, 2, 2, 2, 2, 2, 2, // 98 - 9f
    2, 2, 2, 2, 2, 2, 2, 2, // a0 - a7
    2, 2, 2, 2, 2, 2, 2, 2, // a8 - af
    2, 2, 2, 2, 2, 2, 2, 2, // b0 - b7
    2, 2, 2, 2, 2, 2, 2, 2, // b8 - bf
    2, 2, 2, 2, 2, 2, 2, 2, // c0 - c7
    2, 2, 2, 2, 2, 2, 2, 2, // c8 - cf
    2, 2, 2, 2, 2, 2, 2, 2, // d0 - d7
    2, 2, 2, 2, 2, 2, 2, 2, // d8 - df
    2, 2, 2, 2, 2, 2, 2, 2, // e0 - e7
    2, 2, 2, 2, 2, 2, 2, 2, // e8 - ef
    2, 2, 2, 2, 2, 2, 2, 2, // f0 - f7
    2, 2, 2, 2, 2, 2, 2, 2, // f8 - ff
]

let ISO2022CN_ST: [MachineState] = [
    .start,     ._3,        .error,     .start,     .start,     .start,     .start,     .start,     // 00-07
    .start,     .error,     .error,     .error,     .error,     .error,     .error,     .error,     // 08-0f
    .error,     .error,     .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    // 10-17
    .its_me,    .its_me,    .its_me,    .error,     .error,     .error,     ._4,        .error,     // 18-1f
    .error,     .error,     .error,     .its_me,    .error,     .error,     .error,     .error,     // 20-27
    ._5,        ._6,        .error,     .error,     .error,     .error,     .error,     .error,     // 28-2f
    .error,     .error,     .error,     .its_me,    .error,     .error,     .error,     .error,     // 30-37
    .error,     .error,     .error,     .error,     .error,     .its_me,    .error,     .start,     // 38-3f
]

let ISO2022CN_CHAR_LEN_TABLE = [0, 0, 0, 0, 0, 0, 0, 0, 0]

let ISO2022CN_SM_MODEL = (
    class_table: ISO2022CN_CLS,
    class_factor: 9,
    state_table: ISO2022CN_ST,
    char_len_table: ISO2022CN_CHAR_LEN_TABLE,
    name: "ISO-2022-CN")

let ISO2022JP_CLS: [Int] = [
    2, 0, 0, 0, 0, 0, 0, 0, // 00 - 07
    0, 0, 0, 0, 0, 0, 2, 2, // 08 - 0f
    0, 0, 0, 0, 0, 0, 0, 0, // 10 - 17
    0, 0, 0, 1, 0, 0, 0, 0, // 18 - 1f
    0, 0, 0, 0, 7, 0, 0, 0, // 20 - 27
    3, 0, 0, 0, 0, 0, 0, 0, // 28 - 2f
    0, 0, 0, 0, 0, 0, 0, 0, // 30 - 37
    0, 0, 0, 0, 0, 0, 0, 0, // 38 - 3f
    6, 0, 4, 0, 8, 0, 0, 0, // 40 - 47
    0, 9, 5, 0, 0, 0, 0, 0, // 48 - 4f
    0, 0, 0, 0, 0, 0, 0, 0, // 50 - 57
    0, 0, 0, 0, 0, 0, 0, 0, // 58 - 5f
    0, 0, 0, 0, 0, 0, 0, 0, // 60 - 67
    0, 0, 0, 0, 0, 0, 0, 0, // 68 - 6f
    0, 0, 0, 0, 0, 0, 0, 0, // 70 - 77
    0, 0, 0, 0, 0, 0, 0, 0, // 78 - 7f
    2, 2, 2, 2, 2, 2, 2, 2, // 80 - 87
    2, 2, 2, 2, 2, 2, 2, 2, // 88 - 8f
    2, 2, 2, 2, 2, 2, 2, 2, // 90 - 97
    2, 2, 2, 2, 2, 2, 2, 2, // 98 - 9f
    2, 2, 2, 2, 2, 2, 2, 2, // a0 - a7
    2, 2, 2, 2, 2, 2, 2, 2, // a8 - af
    2, 2, 2, 2, 2, 2, 2, 2, // b0 - b7
    2, 2, 2, 2, 2, 2, 2, 2, // b8 - bf
    2, 2, 2, 2, 2, 2, 2, 2, // c0 - c7
    2, 2, 2, 2, 2, 2, 2, 2, // c8 - cf
    2, 2, 2, 2, 2, 2, 2, 2, // d0 - d7
    2, 2, 2, 2, 2, 2, 2, 2, // d8 - df
    2, 2, 2, 2, 2, 2, 2, 2, // e0 - e7
    2, 2, 2, 2, 2, 2, 2, 2, // e8 - ef
    2, 2, 2, 2, 2, 2, 2, 2, // f0 - f7
    2, 2, 2, 2, 2, 2, 2, 2, // f8 - ff
]

let ISO2022JP_ST: [MachineState] = [
    .start,     ._3,        .error,     .start,     .start,     .start,     .start,     .start,     // 00-07
    .start,     .start,     .error,     .error,     .error,     .error,     .error,     .error,     // 08-0f
    .error,     .error,     .error,     .error,     .its_me,    .its_me,    .its_me,    .its_me,    // 10-17
    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    .error,     .error,     // 18-1f
    .error,     ._5,        .error,     .error,     .error,     ._4,        .error,     .error,     // 20-27
    .error,     .error,     .error,     ._6,        .its_me,    .error,     .its_me,    .error,     // 28-2f
    .error,     .error,     .error,     .error,     .error,     .error,     .its_me,    .its_me,    // 30-37
    .error,     .error,     .error,     .its_me,    .error,     .error,     .error,     .error,     // 38-3f
    .error,     .error,     .error,     .error,     .its_me,    .error,     .start,     .start,     // 40-47
]

let ISO2022JP_CHAR_LEN_TABLE = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

let ISO2022JP_SM_MODEL = (
    class_table: ISO2022JP_CLS,
    class_factor: 10,
    state_table: ISO2022JP_ST,
    char_len_table: ISO2022JP_CHAR_LEN_TABLE,
    name: "ISO-2022-JP")

let ISO2022KR_CLS: [Int] = [
    2, 0, 0, 0, 0, 0, 0, 0, // 00 - 07
    0, 0, 0, 0, 0, 0, 0, 0, // 08 - 0f
    0, 0, 0, 0, 0, 0, 0, 0, // 10 - 17
    0, 0, 0, 1, 0, 0, 0, 0, // 18 - 1f
    0, 0, 0, 0, 3, 0, 0, 0, // 20 - 27
    0, 4, 0, 0, 0, 0, 0, 0, // 28 - 2f
    0, 0, 0, 0, 0, 0, 0, 0, // 30 - 37
    0, 0, 0, 0, 0, 0, 0, 0, // 38 - 3f
    0, 0, 0, 5, 0, 0, 0, 0, // 40 - 47
    0, 0, 0, 0, 0, 0, 0, 0, // 48 - 4f
    0, 0, 0, 0, 0, 0, 0, 0, // 50 - 57
    0, 0, 0, 0, 0, 0, 0, 0, // 58 - 5f
    0, 0, 0, 0, 0, 0, 0, 0, // 60 - 67
    0, 0, 0, 0, 0, 0, 0, 0, // 68 - 6f
    0, 0, 0, 0, 0, 0, 0, 0, // 70 - 77
    0, 0, 0, 0, 0, 0, 0, 0, // 78 - 7f
    2, 2, 2, 2, 2, 2, 2, 2, // 80 - 87
    2, 2, 2, 2, 2, 2, 2, 2, // 88 - 8f
    2, 2, 2, 2, 2, 2, 2, 2, // 90 - 97
    2, 2, 2, 2, 2, 2, 2, 2, // 98 - 9f
    2, 2, 2, 2, 2, 2, 2, 2, // a0 - a7
    2, 2, 2, 2, 2, 2, 2, 2, // a8 - af
    2, 2, 2, 2, 2, 2, 2, 2, // b0 - b7
    2, 2, 2, 2, 2, 2, 2, 2, // b8 - bf
    2, 2, 2, 2, 2, 2, 2, 2, // c0 - c7
    2, 2, 2, 2, 2, 2, 2, 2, // c8 - cf
    2, 2, 2, 2, 2, 2, 2, 2, // d0 - d7
    2, 2, 2, 2, 2, 2, 2, 2, // d8 - df
    2, 2, 2, 2, 2, 2, 2, 2, // e0 - e7
    2, 2, 2, 2, 2, 2, 2, 2, // e8 - ef
    2, 2, 2, 2, 2, 2, 2, 2, // f0 - f7
    2, 2, 2, 2, 2, 2, 2, 2, // f8 - ff
]

let ISO2022KR_ST: [MachineState] = [
    .start,     ._3,        .error,     .start,     .start,     .start,     .error,     .error,     // 00-07
    .error,     .error,     .error,     .error,     .its_me,    .its_me,    .its_me,    .its_me,    // 08-0f
    .its_me,    .its_me,    .error,     .error,     .error,     ._4,        .error,     .error,     // 10-17
    .error,     .error,     .error,     .error,     ._5,        .error,     .error,     .error,     // 18-1f
    .error,     .error,     .error,     .its_me,    .start,     .start,     .start,     .start,     // 20-27
]

let ISO2022KR_CHAR_LEN_TABLE = [0, 0, 0, 0, 0, 0]

let ISO2022KR_SM_MODEL = (
    class_table: ISO2022KR_CLS,
    class_factor: 6,
    state_table: ISO2022KR_ST,
    char_len_table: ISO2022KR_CHAR_LEN_TABLE,
    name: "ISO-2022-KR")

