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

// BIG5

let BIG5_CLS: [Int] = [
    1, 1, 1, 1, 1, 1, 1, 1, // 00 - 07    //allow 0x00 as legal value
    1, 1, 1, 1, 1, 1, 0, 0, // 08 - 0f
    1, 1, 1, 1, 1, 1, 1, 1, // 10 - 17
    1, 1, 1, 0, 1, 1, 1, 1, // 18 - 1f
    1, 1, 1, 1, 1, 1, 1, 1, // 20 - 27
    1, 1, 1, 1, 1, 1, 1, 1, // 28 - 2f
    1, 1, 1, 1, 1, 1, 1, 1, // 30 - 37
    1, 1, 1, 1, 1, 1, 1, 1, // 38 - 3f
    2, 2, 2, 2, 2, 2, 2, 2, // 40 - 47
    2, 2, 2, 2, 2, 2, 2, 2, // 48 - 4f
    2, 2, 2, 2, 2, 2, 2, 2, // 50 - 57
    2, 2, 2, 2, 2, 2, 2, 2, // 58 - 5f
    2, 2, 2, 2, 2, 2, 2, 2, // 60 - 67
    2, 2, 2, 2, 2, 2, 2, 2, // 68 - 6f
    2, 2, 2, 2, 2, 2, 2, 2, // 70 - 77
    2, 2, 2, 2, 2, 2, 2, 1, // 78 - 7f
    4, 4, 4, 4, 4, 4, 4, 4, // 80 - 87
    4, 4, 4, 4, 4, 4, 4, 4, // 88 - 8f
    4, 4, 4, 4, 4, 4, 4, 4, // 90 - 97
    4, 4, 4, 4, 4, 4, 4, 4, // 98 - 9f
    4, 3, 3, 3, 3, 3, 3, 3, // a0 - a7
    3, 3, 3, 3, 3, 3, 3, 3, // a8 - af
    3, 3, 3, 3, 3, 3, 3, 3, // b0 - b7
    3, 3, 3, 3, 3, 3, 3, 3, // b8 - bf
    3, 3, 3, 3, 3, 3, 3, 3, // c0 - c7
    3, 3, 3, 3, 3, 3, 3, 3, // c8 - cf
    3, 3, 3, 3, 3, 3, 3, 3, // d0 - d7
    3, 3, 3, 3, 3, 3, 3, 3, // d8 - df
    3, 3, 3, 3, 3, 3, 3, 3, // e0 - e7
    3, 3, 3, 3, 3, 3, 3, 3, // e8 - ef
    3, 3, 3, 3, 3, 3, 3, 3, // f0 - f7
    3, 3, 3, 3, 3, 3, 3, 0  // f8 - ff
]

let BIG5_ST: [MachineState] = [
    .error,     .start,     .start,     ._3,        .error,     .error,     .error,     .error,     //00-07
    .error,     .error,     .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    .error,     //08-0f
    .error,     .start,     .start,     .start,     .start,     .start,     .start,     .start      //10-17
]

let BIG5_CHAR_LEN_TABLE = [0, 1, 1, 2, 0]

let BIG5_SM_MODEL: StateMachineModel = (
    class_table: BIG5_CLS,
    class_factor: 5,
    state_table: BIG5_ST,
    char_len_table: BIG5_CHAR_LEN_TABLE,
    name: "Big5")

// CP949

let CP949_CLS: [Int] = [
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, // 00 - 0f
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, // 10 - 1f
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, // 20 - 2f
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, // 30 - 3f
    1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, // 40 - 4f
    4, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 1, 1, 1, 1, // 50 - 5f
    1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, // 60 - 6f
    5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 1, 1, 1, 1, // 70 - 7f
    0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, // 80 - 8f
    6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, // 90 - 9f
    6, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, // a0 - af
    7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, // b0 - bf
    7, 7, 7, 7, 7, 7, 9, 2, 2, 3, 2, 2, 2, 2, 2, 2, // c0 - cf
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, // d0 - df
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, // e0 - ef
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, // f0 - ff
]

let CP949_ST: [MachineState] = [
    .error,     .start,     ._3,        .error,     .start,     .start,     ._4,        ._5,        .error,     ._6,        // .start
    .error,     .error,     .error,     .error,     .error,     .error,     .error,     .error,     .error,     .error,     // .error
    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    // .its_me
    .error,     .error,     .start,     .start,     .error,     .error,     .error,     .start,     .start,     .start,     // 3
    .error,     .error,     .start,     .start,     .start,     .start,     .start,     .start,     .start,     .start,     // 4
    .error,     .start,     .start,     .start,     .start,     .start,     .start,     .start,     .start,     .start,     // 5
    .error,     .start,     .start,     .start,     .start,     .error,     .error,     .start,     .start,     .start,     // 6
]

let CP949_CHAR_LEN_TABLE = [0, 1, 2, 0, 1, 1, 2, 2, 0, 2]

let CP949_SM_MODEL: StateMachineModel = (
    class_table: CP949_CLS,
    class_factor: 10,
    state_table: CP949_ST,
    char_len_table: CP949_CHAR_LEN_TABLE,
    name: "CP949")

// EUC-JP

let EUCJP_CLS: [Int] = [
    4, 4, 4, 4, 4, 4, 4, 4, // 00 - 07
    4, 4, 4, 4, 4, 4, 5, 5, // 08 - 0f
    4, 4, 4, 4, 4, 4, 4, 4, // 10 - 17
    4, 4, 4, 5, 4, 4, 4, 4, // 18 - 1f
    4, 4, 4, 4, 4, 4, 4, 4, // 20 - 27
    4, 4, 4, 4, 4, 4, 4, 4, // 28 - 2f
    4, 4, 4, 4, 4, 4, 4, 4, // 30 - 37
    4, 4, 4, 4, 4, 4, 4, 4, // 38 - 3f
    4, 4, 4, 4, 4, 4, 4, 4, // 40 - 47
    4, 4, 4, 4, 4, 4, 4, 4, // 48 - 4f
    4, 4, 4, 4, 4, 4, 4, 4, // 50 - 57
    4, 4, 4, 4, 4, 4, 4, 4, // 58 - 5f
    4, 4, 4, 4, 4, 4, 4, 4, // 60 - 67
    4, 4, 4, 4, 4, 4, 4, 4, // 68 - 6f
    4, 4, 4, 4, 4, 4, 4, 4, // 70 - 77
    4, 4, 4, 4, 4, 4, 4, 4, // 78 - 7f
    5, 5, 5, 5, 5, 5, 5, 5, // 80 - 87
    5, 5, 5, 5, 5, 5, 1, 3, // 88 - 8f
    5, 5, 5, 5, 5, 5, 5, 5, // 90 - 97
    5, 5, 5, 5, 5, 5, 5, 5, // 98 - 9f
    5, 2, 2, 2, 2, 2, 2, 2, // a0 - a7
    2, 2, 2, 2, 2, 2, 2, 2, // a8 - af
    2, 2, 2, 2, 2, 2, 2, 2, // b0 - b7
    2, 2, 2, 2, 2, 2, 2, 2, // b8 - bf
    2, 2, 2, 2, 2, 2, 2, 2, // c0 - c7
    2, 2, 2, 2, 2, 2, 2, 2, // c8 - cf
    2, 2, 2, 2, 2, 2, 2, 2, // d0 - d7
    2, 2, 2, 2, 2, 2, 2, 2, // d8 - df
    0, 0, 0, 0, 0, 0, 0, 0, // e0 - e7
    0, 0, 0, 0, 0, 0, 0, 0, // e8 - ef
    0, 0, 0, 0, 0, 0, 0, 0, // f0 - f7
    0, 0, 0, 0, 0, 0, 0, 5  // f8 - ff
]

let EUCJP_ST: [MachineState] = [
    ._3,        ._4,        ._3,        ._5,        .start,     .error,     .error,     .error,     //00-07
    .error,     .error,     .error,     .error,     .its_me,    .its_me,    .its_me,    .its_me,    //08-0f
    .its_me,    .its_me,    .start,     .error,     .start,     .error,     .error,     .error,     //10-17
    .error,     .error,     .start,     .error,     .error,     .error,     ._3,        .error,     //18-1f
    ._3,        .error,     .error,     .error,     .start,     .start,     .start,     .start      //20-27
]

let EUCJP_CHAR_LEN_TABLE = [2, 2, 2, 3, 1, 0]

let EUCJP_SM_MODEL: StateMachineModel = (
    class_table: EUCJP_CLS,
    class_factor: 6,
    state_table: EUCJP_ST,
    char_len_table: EUCJP_CHAR_LEN_TABLE,
    name: "EUC-JP")

// EUC-KR

let EUCKR_CLS: [Int] = [
    1, 1, 1, 1, 1, 1, 1, 1, // 00 - 07
    1, 1, 1, 1, 1, 1, 0, 0, // 08 - 0f
    1, 1, 1, 1, 1, 1, 1, 1, // 10 - 17
    1, 1, 1, 0, 1, 1, 1, 1, // 18 - 1f
    1, 1, 1, 1, 1, 1, 1, 1, // 20 - 27
    1, 1, 1, 1, 1, 1, 1, 1, // 28 - 2f
    1, 1, 1, 1, 1, 1, 1, 1, // 30 - 37
    1, 1, 1, 1, 1, 1, 1, 1, // 38 - 3f
    1, 1, 1, 1, 1, 1, 1, 1, // 40 - 47
    1, 1, 1, 1, 1, 1, 1, 1, // 48 - 4f
    1, 1, 1, 1, 1, 1, 1, 1, // 50 - 57
    1, 1, 1, 1, 1, 1, 1, 1, // 58 - 5f
    1, 1, 1, 1, 1, 1, 1, 1, // 60 - 67
    1, 1, 1, 1, 1, 1, 1, 1, // 68 - 6f
    1, 1, 1, 1, 1, 1, 1, 1, // 70 - 77
    1, 1, 1, 1, 1, 1, 1, 1, // 78 - 7f
    0, 0, 0, 0, 0, 0, 0, 0, // 80 - 87
    0, 0, 0, 0, 0, 0, 0, 0, // 88 - 8f
    0, 0, 0, 0, 0, 0, 0, 0, // 90 - 97
    0, 0, 0, 0, 0, 0, 0, 0, // 98 - 9f
    0, 2, 2, 2, 2, 2, 2, 2, // a0 - a7
    2, 2, 2, 2, 2, 3, 3, 3, // a8 - af
    2, 2, 2, 2, 2, 2, 2, 2, // b0 - b7
    2, 2, 2, 2, 2, 2, 2, 2, // b8 - bf
    2, 2, 2, 2, 2, 2, 2, 2, // c0 - c7
    2, 3, 2, 2, 2, 2, 2, 2, // c8 - cf
    2, 2, 2, 2, 2, 2, 2, 2, // d0 - d7
    2, 2, 2, 2, 2, 2, 2, 2, // d8 - df
    2, 2, 2, 2, 2, 2, 2, 2, // e0 - e7
    2, 2, 2, 2, 2, 2, 2, 2, // e8 - ef
    2, 2, 2, 2, 2, 2, 2, 2, // f0 - f7
    2, 2, 2, 2, 2, 2, 2, 0  // f8 - ff
]

let EUCKR_ST: [MachineState] = [
    .error,     .start,     ._3,        .error,     .error,     .error,     .error,     .error,     //00-07
    .its_me,    .its_me,    .its_me,    .its_me,    .error,     .error,     .start,     .start      //08-0f
]

let EUCKR_CHAR_LEN_TABLE = [0, 1, 2, 0]

let EUCKR_SM_MODEL: StateMachineModel = (
    class_table: EUCKR_CLS,
    class_factor: 4,
    state_table: EUCKR_ST,
    char_len_table: EUCKR_CHAR_LEN_TABLE,
    name: "EUC-KR")

// EUC-TW

let EUCTW_CLS: [Int] = [
    2, 2, 2, 2, 2, 2, 2, 2, // 00 - 07
    2, 2, 2, 2, 2, 2, 0, 0, // 08 - 0f
    2, 2, 2, 2, 2, 2, 2, 2, // 10 - 17
    2, 2, 2, 0, 2, 2, 2, 2, // 18 - 1f
    2, 2, 2, 2, 2, 2, 2, 2, // 20 - 27
    2, 2, 2, 2, 2, 2, 2, 2, // 28 - 2f
    2, 2, 2, 2, 2, 2, 2, 2, // 30 - 37
    2, 2, 2, 2, 2, 2, 2, 2, // 38 - 3f
    2, 2, 2, 2, 2, 2, 2, 2, // 40 - 47
    2, 2, 2, 2, 2, 2, 2, 2, // 48 - 4f
    2, 2, 2, 2, 2, 2, 2, 2, // 50 - 57
    2, 2, 2, 2, 2, 2, 2, 2, // 58 - 5f
    2, 2, 2, 2, 2, 2, 2, 2, // 60 - 67
    2, 2, 2, 2, 2, 2, 2, 2, // 68 - 6f
    2, 2, 2, 2, 2, 2, 2, 2, // 70 - 77
    2, 2, 2, 2, 2, 2, 2, 2, // 78 - 7f
    0, 0, 0, 0, 0, 0, 0, 0, // 80 - 87
    0, 0, 0, 0, 0, 0, 6, 0, // 88 - 8f
    0, 0, 0, 0, 0, 0, 0, 0, // 90 - 97
    0, 0, 0, 0, 0, 0, 0, 0, // 98 - 9f
    0, 3, 4, 4, 4, 4, 4, 4, // a0 - a7
    5, 5, 1, 1, 1, 1, 1, 1, // a8 - af
    1, 1, 1, 1, 1, 1, 1, 1, // b0 - b7
    1, 1, 1, 1, 1, 1, 1, 1, // b8 - bf
    1, 1, 3, 1, 3, 3, 3, 3, // c0 - c7
    3, 3, 3, 3, 3, 3, 3, 3, // c8 - cf
    3, 3, 3, 3, 3, 3, 3, 3, // d0 - d7
    3, 3, 3, 3, 3, 3, 3, 3, // d8 - df
    3, 3, 3, 3, 3, 3, 3, 3, // e0 - e7
    3, 3, 3, 3, 3, 3, 3, 3, // e8 - ef
    3, 3, 3, 3, 3, 3, 3, 3, // f0 - f7
    3, 3, 3, 3, 3, 3, 3, 0   // f8 - ff
]

let EUCTW_ST: [MachineState] = [
    .error,     .error,     .start,     ._3,        ._3,        ._3,        ._4,        .error,     //00-07
    .error,     .error,     .error,     .error,     .error,     .error,     .its_me,    .its_me,    //08-0f
    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    .error,     .start,     .error,     //10-17
    .start,     .start,     .start,     .error,     .error,     .error,     .error,     .error,     //18-1f
    ._5,        .error,     .error,     .error,     .start,     .error,     .start,     .start,     //20-27
    .start,     .error,     .start,     .start,     .start,     .start,     .start,     .start      //28-2f
]

let EUCTW_CHAR_LEN_TABLE = [0, 0, 1, 2, 2, 2, 3]


let EUCTW_SM_MODEL: StateMachineModel = (
    class_table: EUCTW_CLS,
    class_factor: 7,
    state_table: EUCTW_ST,
    char_len_table: EUCTW_CHAR_LEN_TABLE,
    name: "x-euc-tw")

// GB2312

let GB2312_CLS: [Int] = [
    1, 1, 1, 1, 1, 1, 1, 1, // 00 - 07
    1, 1, 1, 1, 1, 1, 0, 0, // 08 - 0f
    1, 1, 1, 1, 1, 1, 1, 1, // 10 - 17
    1, 1, 1, 0, 1, 1, 1, 1, // 18 - 1f
    1, 1, 1, 1, 1, 1, 1, 1, // 20 - 27
    1, 1, 1, 1, 1, 1, 1, 1, // 28 - 2f
    3, 3, 3, 3, 3, 3, 3, 3, // 30 - 37
    3, 3, 1, 1, 1, 1, 1, 1, // 38 - 3f
    2, 2, 2, 2, 2, 2, 2, 2, // 40 - 47
    2, 2, 2, 2, 2, 2, 2, 2, // 48 - 4f
    2, 2, 2, 2, 2, 2, 2, 2, // 50 - 57
    2, 2, 2, 2, 2, 2, 2, 2, // 58 - 5f
    2, 2, 2, 2, 2, 2, 2, 2, // 60 - 67
    2, 2, 2, 2, 2, 2, 2, 2, // 68 - 6f
    2, 2, 2, 2, 2, 2, 2, 2, // 70 - 77
    2, 2, 2, 2, 2, 2, 2, 4, // 78 - 7f
    5, 6, 6, 6, 6, 6, 6, 6, // 80 - 87
    6, 6, 6, 6, 6, 6, 6, 6, // 88 - 8f
    6, 6, 6, 6, 6, 6, 6, 6, // 90 - 97
    6, 6, 6, 6, 6, 6, 6, 6, // 98 - 9f
    6, 6, 6, 6, 6, 6, 6, 6, // a0 - a7
    6, 6, 6, 6, 6, 6, 6, 6, // a8 - af
    6, 6, 6, 6, 6, 6, 6, 6, // b0 - b7
    6, 6, 6, 6, 6, 6, 6, 6, // b8 - bf
    6, 6, 6, 6, 6, 6, 6, 6, // c0 - c7
    6, 6, 6, 6, 6, 6, 6, 6, // c8 - cf
    6, 6, 6, 6, 6, 6, 6, 6, // d0 - d7
    6, 6, 6, 6, 6, 6, 6, 6, // d8 - df
    6, 6, 6, 6, 6, 6, 6, 6, // e0 - e7
    6, 6, 6, 6, 6, 6, 6, 6, // e8 - ef
    6, 6, 6, 6, 6, 6, 6, 6, // f0 - f7
    6, 6, 6, 6, 6, 6, 6, 0  // f8 - ff
]

let GB2312_ST: [MachineState] = [
    .error,     .start,     .start,     .start,     .start,     .start,     ._3,        .error,     //00-07
    .error,     .error,     .error,     .error,     .error,     .error,     .its_me,    .its_me,    //08-0f
    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    .error,     .error,     .start,     //10-17
    ._4,        .error,     .start,     .start,     .error,     .error,     .error,     .error,     //18-1f
    .error,     .error,     ._5,        .error,     .error,     .error,     .its_me,    .error,     //20-27
    .error,     .error,     .start,     .start,     .start,     .start,     .start,     .start      //28-2f
]

// To be accurate, the length of class 6 can be either 2 or 4.
// But it is not necessary to discriminate between the two since
// it is used for frequency analysis only, and we are validating
// each code range there as well. So it is safe to set it to be
// 2 here.
let GB2312_CHAR_LEN_TABLE = [0, 1, 1, 1, 1, 1, 2]

let GB2312_SM_MODEL: StateMachineModel = (
    class_table: GB2312_CLS,
    class_factor: 7,
    state_table: GB2312_ST,
    char_len_table: GB2312_CHAR_LEN_TABLE,
    name: "GB2312")

// Shift_JIS

let SJIS_CLS: [Int] = [
    1, 1, 1, 1, 1, 1, 1, 1, // 00 - 07
    1, 1, 1, 1, 1, 1, 0, 0, // 08 - 0f
    1, 1, 1, 1, 1, 1, 1, 1, // 10 - 17
    1, 1, 1, 0, 1, 1, 1, 1, // 18 - 1f
    1, 1, 1, 1, 1, 1, 1, 1, // 20 - 27
    1, 1, 1, 1, 1, 1, 1, 1, // 28 - 2f
    1, 1, 1, 1, 1, 1, 1, 1, // 30 - 37
    1, 1, 1, 1, 1, 1, 1, 1, // 38 - 3f
    2, 2, 2, 2, 2, 2, 2, 2, // 40 - 47
    2, 2, 2, 2, 2, 2, 2, 2, // 48 - 4f
    2, 2, 2, 2, 2, 2, 2, 2, // 50 - 57
    2, 2, 2, 2, 2, 2, 2, 2, // 58 - 5f
    2, 2, 2, 2, 2, 2, 2, 2, // 60 - 67
    2, 2, 2, 2, 2, 2, 2, 2, // 68 - 6f
    2, 2, 2, 2, 2, 2, 2, 2, // 70 - 77
    2, 2, 2, 2, 2, 2, 2, 1, // 78 - 7f
    3, 3, 3, 3, 3, 2, 2, 3, // 80 - 87
    3, 3, 3, 3, 3, 3, 3, 3, // 88 - 8f
    3, 3, 3, 3, 3, 3, 3, 3, // 90 - 97
    3, 3, 3, 3, 3, 3, 3, 3, // 98 - 9f
    //0xa0 is illegal in sjis encoding, but some pages does
    //contain such byte. We need to be more error forgiven.
    2, 2, 2, 2, 2, 2, 2, 2, // a0 - a7
    2, 2, 2, 2, 2, 2, 2, 2, // a8 - af
    2, 2, 2, 2, 2, 2, 2, 2, // b0 - b7
    2, 2, 2, 2, 2, 2, 2, 2, // b8 - bf
    2, 2, 2, 2, 2, 2, 2, 2, // c0 - c7
    2, 2, 2, 2, 2, 2, 2, 2, // c8 - cf
    2, 2, 2, 2, 2, 2, 2, 2, // d0 - d7
    2, 2, 2, 2, 2, 2, 2, 2, // d8 - df
    3, 3, 3, 3, 3, 3, 3, 3, // e0 - e7
    3, 3, 3, 3, 3, 4, 4, 4, // e8 - ef
    3, 3, 3, 3, 3, 3, 3, 3, // f0 - f7
    3, 3, 3, 3, 3, 0, 0, 0  // f8 - ff
]

let SJIS_ST: [MachineState] = [
    .error,     .start,     .start,     ._3,        .error,     .error,     .error,     .error,     //00-07
    .error,     .error,     .error,     .error,     .its_me,    .its_me,    .its_me,    .its_me,    //08-0f
    .its_me,    .its_me,    .error,     .error,     .start,     .start,     .start,     .start      //10-17
]

let SJIS_CHAR_LEN_TABLE = [0, 1, 1, 2, 0, 0]

let SJIS_SM_MODEL = (
    class_table: SJIS_CLS,
    class_factor: 6,
    state_table: SJIS_ST,
    char_len_table: SJIS_CHAR_LEN_TABLE,
    name: "Shift_JIS")

// UCS2-BE

let UCS2BE_CLS: [Int] = [
    0, 0, 0, 0, 0, 0, 0, 0, // 00 - 07
    0, 0, 1, 0, 0, 2, 0, 0, // 08 - 0f
    0, 0, 0, 0, 0, 0, 0, 0, // 10 - 17
    0, 0, 0, 3, 0, 0, 0, 0, // 18 - 1f
    0, 0, 0, 0, 0, 0, 0, 0, // 20 - 27
    0, 3, 3, 3, 3, 3, 0, 0, // 28 - 2f
    0, 0, 0, 0, 0, 0, 0, 0, // 30 - 37
    0, 0, 0, 0, 0, 0, 0, 0, // 38 - 3f
    0, 0, 0, 0, 0, 0, 0, 0, // 40 - 47
    0, 0, 0, 0, 0, 0, 0, 0, // 48 - 4f
    0, 0, 0, 0, 0, 0, 0, 0, // 50 - 57
    0, 0, 0, 0, 0, 0, 0, 0, // 58 - 5f
    0, 0, 0, 0, 0, 0, 0, 0, // 60 - 67
    0, 0, 0, 0, 0, 0, 0, 0, // 68 - 6f
    0, 0, 0, 0, 0, 0, 0, 0, // 70 - 77
    0, 0, 0, 0, 0, 0, 0, 0, // 78 - 7f
    0, 0, 0, 0, 0, 0, 0, 0, // 80 - 87
    0, 0, 0, 0, 0, 0, 0, 0, // 88 - 8f
    0, 0, 0, 0, 0, 0, 0, 0, // 90 - 97
    0, 0, 0, 0, 0, 0, 0, 0, // 98 - 9f
    0, 0, 0, 0, 0, 0, 0, 0, // a0 - a7
    0, 0, 0, 0, 0, 0, 0, 0, // a8 - af
    0, 0, 0, 0, 0, 0, 0, 0, // b0 - b7
    0, 0, 0, 0, 0, 0, 0, 0, // b8 - bf
    0, 0, 0, 0, 0, 0, 0, 0, // c0 - c7
    0, 0, 0, 0, 0, 0, 0, 0, // c8 - cf
    0, 0, 0, 0, 0, 0, 0, 0, // d0 - d7
    0, 0, 0, 0, 0, 0, 0, 0, // d8 - df
    0, 0, 0, 0, 0, 0, 0, 0, // e0 - e7
    0, 0, 0, 0, 0, 0, 0, 0, // e8 - ef
    0, 0, 0, 0, 0, 0, 0, 0, // f0 - f7
    0, 0, 0, 0, 0, 0, 4, 5  // f8 - ff
]

let UCS2BE_ST: [MachineState] = [
    ._5,        ._7,        ._7,        .error,     ._4,        ._3,        .error,     .error,     //00-07
    .error,     .error,     .error,     .error,     .its_me,    .its_me,    .its_me,    .its_me,    //08-0f
    .its_me,    .its_me,    ._6,        ._6,        ._6,        ._6,        .error,     .error,     //10-17
    ._6,        ._6,        ._6,        ._6,        ._6,        .its_me,    ._6,        ._6,        //18-1f
    ._6,        ._6,        ._6,        ._6,        ._5,        ._7,        ._7,        .error,     //20-27
    ._5,        ._8,        ._6,        ._6,        .error,     ._6,        ._6,        ._6,        //28-2f
    ._6,        ._6,        ._6,        ._6,        .error,     .error,     .start,     .start      //30-37
]

let UCS2BE_CHAR_LEN_TABLE = [2, 2, 2, 0, 2, 2]

let UCS2BE_SM_MODEL = (
    class_table: UCS2BE_CLS,
    class_factor: 6,
    state_table: UCS2BE_ST,
    char_len_table: UCS2BE_CHAR_LEN_TABLE,
    name: "UTF-16BE")

// UCS2-LE

let UCS2LE_CLS: [Int] = [
    0, 0, 0, 0, 0, 0, 0, 0, // 00 - 07
    0, 0, 1, 0, 0, 2, 0, 0, // 08 - 0f
    0, 0, 0, 0, 0, 0, 0, 0, // 10 - 17
    0, 0, 0, 3, 0, 0, 0, 0, // 18 - 1f
    0, 0, 0, 0, 0, 0, 0, 0, // 20 - 27
    0, 3, 3, 3, 3, 3, 0, 0, // 28 - 2f
    0, 0, 0, 0, 0, 0, 0, 0, // 30 - 37
    0, 0, 0, 0, 0, 0, 0, 0, // 38 - 3f
    0, 0, 0, 0, 0, 0, 0, 0, // 40 - 47
    0, 0, 0, 0, 0, 0, 0, 0, // 48 - 4f
    0, 0, 0, 0, 0, 0, 0, 0, // 50 - 57
    0, 0, 0, 0, 0, 0, 0, 0, // 58 - 5f
    0, 0, 0, 0, 0, 0, 0, 0, // 60 - 67
    0, 0, 0, 0, 0, 0, 0, 0, // 68 - 6f
    0, 0, 0, 0, 0, 0, 0, 0, // 70 - 77
    0, 0, 0, 0, 0, 0, 0, 0, // 78 - 7f
    0, 0, 0, 0, 0, 0, 0, 0, // 80 - 87
    0, 0, 0, 0, 0, 0, 0, 0, // 88 - 8f
    0, 0, 0, 0, 0, 0, 0, 0, // 90 - 97
    0, 0, 0, 0, 0, 0, 0, 0, // 98 - 9f
    0, 0, 0, 0, 0, 0, 0, 0, // a0 - a7
    0, 0, 0, 0, 0, 0, 0, 0, // a8 - af
    0, 0, 0, 0, 0, 0, 0, 0, // b0 - b7
    0, 0, 0, 0, 0, 0, 0, 0, // b8 - bf
    0, 0, 0, 0, 0, 0, 0, 0, // c0 - c7
    0, 0, 0, 0, 0, 0, 0, 0, // c8 - cf
    0, 0, 0, 0, 0, 0, 0, 0, // d0 - d7
    0, 0, 0, 0, 0, 0, 0, 0, // d8 - df
    0, 0, 0, 0, 0, 0, 0, 0, // e0 - e7
    0, 0, 0, 0, 0, 0, 0, 0, // e8 - ef
    0, 0, 0, 0, 0, 0, 0, 0, // f0 - f7
    0, 0, 0, 0, 0, 0, 4, 5  // f8 - ff
]

let UCS2LE_ST: [MachineState] = [
    ._6,        ._6,        ._7,        ._6,        ._4,        ._3,        .error,     .error,     //00-07
    .error,     .error,     .error,     .error,     .its_me,    .its_me,    .its_me,    .its_me,    //08-0f
    .its_me,    .its_me,    ._5,        ._5,        ._5,        .error,     .its_me,    .error,     //10-17
    ._5,        ._5,        ._5,        .error,     ._5,        .error,     ._6,        ._6,        //18-1f
    ._7,        ._6,        ._8,        ._8,        ._5,        ._5,        ._5,        .error,     //20-27
    ._5,        ._5,        ._5,        .error,     .error,     .error,     ._5,        ._5,        //28-2f
    ._5,        ._5,        ._5,        .error,     ._5,        .error,     .start,     .start      //30-37
]

let UCS2LE_CHAR_LEN_TABLE = [2, 2, 2, 2, 2, 2]

let UCS2LE_SM_MODEL = (
    class_table: UCS2LE_CLS,
    class_factor: 6,
    state_table: UCS2LE_ST,
    char_len_table: UCS2LE_CHAR_LEN_TABLE,
    name: "UTF-16LE")

// UTF-8

let UTF8_CLS: [Int] = [
    1,  1,  1,  1,  1,  1,  1,  1, // 00 - 07  //allow 0x00 as a legal value
    1,  1,  1,  1,  1,  1,  0,  0, // 08 - 0f
    1,  1,  1,  1,  1,  1,  1,  1, // 10 - 17
    1,  1,  1,  0,  1,  1,  1,  1, // 18 - 1f
    1,  1,  1,  1,  1,  1,  1,  1, // 20 - 27
    1,  1,  1,  1,  1,  1,  1,  1, // 28 - 2f
    1,  1,  1,  1,  1,  1,  1,  1, // 30 - 37
    1,  1,  1,  1,  1,  1,  1,  1, // 38 - 3f
    1,  1,  1,  1,  1,  1,  1,  1, // 40 - 47
    1,  1,  1,  1,  1,  1,  1,  1, // 48 - 4f
    1,  1,  1,  1,  1,  1,  1,  1, // 50 - 57
    1,  1,  1,  1,  1,  1,  1,  1, // 58 - 5f
    1,  1,  1,  1,  1,  1,  1,  1, // 60 - 67
    1,  1,  1,  1,  1,  1,  1,  1, // 68 - 6f
    1,  1,  1,  1,  1,  1,  1,  1, // 70 - 77
    1,  1,  1,  1,  1,  1,  1,  1, // 78 - 7f
    2,  2,  2,  2,  3,  3,  3,  3, // 80 - 87
    4,  4,  4,  4,  4,  4,  4,  4, // 88 - 8f
    4,  4,  4,  4,  4,  4,  4,  4, // 90 - 97
    4,  4,  4,  4,  4,  4,  4,  4, // 98 - 9f
    5,  5,  5,  5,  5,  5,  5,  5, // a0 - a7
    5,  5,  5,  5,  5,  5,  5,  5, // a8 - af
    5,  5,  5,  5,  5,  5,  5,  5, // b0 - b7
    5,  5,  5,  5,  5,  5,  5,  5, // b8 - bf
    0,  0,  6,  6,  6,  6,  6,  6, // c0 - c7
    6,  6,  6,  6,  6,  6,  6,  6, // c8 - cf
    6,  6,  6,  6,  6,  6,  6,  6, // d0 - d7
    6,  6,  6,  6,  6,  6,  6,  6, // d8 - df
    7,  8,  8,  8,  8,  8,  8,  8, // e0 - e7
    8,  8,  8,  8,  8,  9,  8,  8, // e8 - ef
    10, 11, 11, 11, 11, 11, 11, 11,// f0 - f7
    12, 13, 13, 13, 14, 15, 0,  0  // f8 - ff
]

let UTF8_ST: [MachineState] = [
    .error,     .start,     .error,     .error,     .error,     .error,     ._12,       ._10,       //00-07
    ._9,        ._11,       ._8,        ._7,        ._6,        ._5,        ._4,        ._3,        //08-0f
    .error,     .error,     .error,     .error,     .error,     .error,     .error,     .error,     //10-17
    .error,     .error,     .error,     .error,     .error,     .error,     .error,     .error,     //18-1f
    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    //20-27
    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    .its_me,    //28-2f
    .error,     .error,     ._5,        ._5,        ._5,        ._5,        .error,     .error,     //30-37
    .error,     .error,     .error,     .error,     .error,     .error,     .error,     .error,     //38-3f
    .error,     .error,     .error,     ._5,        ._5,        ._5,        .error,     .error,     //40-47
    .error,     .error,     .error,     .error,     .error,     .error,     .error,     .error,     //48-4f
    .error,     .error,     ._7,        ._7,        ._7,        ._7,        .error,     .error,     //50-57
    .error,     .error,     .error,     .error,     .error,     .error,     .error,     .error,     //58-5f
    .error,     .error,     .error,     .error,     ._7,        ._7,        .error,     .error,     //60-67
    .error,     .error,     .error,     .error,     .error,     .error,     .error,     .error,     //68-6f
    .error,     .error,     ._9,        ._9,        ._9,        ._9,        .error,     .error,     //70-77
    .error,     .error,     .error,     .error,     .error,     .error,     .error,     .error,     //78-7f
    .error,     .error,     .error,     .error,     .error,     ._9,        .error,     .error,     //80-87
    .error,     .error,     .error,     .error,     .error,     .error,     .error,     .error,     //88-8f
    .error,     .error,     ._12,       ._12,       ._12,       ._12,       .error,     .error,     //90-97
    .error,     .error,     .error,     .error,     .error,     .error,     .error,     .error,     //98-9f
    .error,     .error,     .error,     .error,     .error,     ._12,       .error,     .error,     //a0-a7
    .error,     .error,     .error,     .error,     .error,     .error,     .error,     .error,     //a8-af
    .error,     .error,     ._12,       ._12,       ._12,       .error,     .error,     .error,     //b0-b7
    .error,     .error,     .error,     .error,     .error,     .error,     .error,     .error,     //b8-bf
    .error,     .error,     .start,     .start,     .start,     .start,     .error,     .error,     //c0-c7
    .error,     .error,     .error,     .error,     .error,     .error,     .error,     .error      //c8-cf
]

let UTF8_CHAR_LEN_TABLE = [0, 1, 0, 0, 0, 0, 2, 3, 3, 3, 4, 4, 5, 5, 6, 6]

let UTF8_SM_MODEL = (
    class_table: UTF8_CLS,
    class_factor: 16,
    state_table: UTF8_ST,
    char_len_table: UTF8_CHAR_LEN_TABLE,
    name: "UTF-8")
