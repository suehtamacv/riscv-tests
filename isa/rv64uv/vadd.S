# See LICENSE for license details.

#*****************************************************************************
# vadd.S
#-----------------------------------------------------------------------------
#
# Test vadd instruction.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

  TEST_CASE_VEC( 1 )
  CREATE_VEC_32b( test1A, 0x00000004, 0x00000001, 0x00000003 )
  CREATE_VEC_32b( test1B, 0x00000003, 0x00000001, 0x00000007 )
  CREATE_VEC_32b( test1E, 0x00000007, 0x00000002, 0x0000000a )
  CREATE_VEC_32b( test1R, 0xDEADBEEF, 0xDEADBEEF, 0xDEADBEEF )
  SET_VL( zero, 3, e32 )
  LOAD_VEC_32bu( v0, test1A )
  LOAD_VEC_32bu( v1, test1B )
  vadd.vv v2, v0, v1;
  STORE_VEC_32b( v2, test1R )
  COMP_VEC_32bu( test1R, test1E, 3 )

  TEST_CASE_VEC( 2 )
  CREATE_VEC_32b( test2A, 0x00000000, 0x80000000, 0x80000000 )
  CREATE_VEC_32b( test2B, 0xffff8000, 0x00000000, 0xffff8000 )
  CREATE_VEC_32b( test2E, 0xffff8000, 0x80000000, 0x7fff8000 )
  CREATE_VEC_32b( test2R, 0xDEADBEEF, 0xDEADBEEF, 0xDEADBEEF )
  SET_VL( zero, 3, e32 )
  LOAD_VEC_32bu( v0, test2A )
  LOAD_VEC_32bu( v1, test2B )
  vadd.vv v2, v0, v1;
  STORE_VEC_32b( v2, test2R )
  COMP_VEC_32bu( test2R, test2E, 3 )

  TEST_CASE_VEC( 3 )
  CREATE_VEC_16b( test3A, 0x0000, 0x8000, 0x8000 )
  CREATE_VEC_16b( test3B, 0xff80, 0x0000, 0xff80 )
  CREATE_VEC_16b( test3E, 0xff80, 0x8000, 0x7f80 )
  CREATE_VEC_16b( test3R, 0xBEEF, 0xBEEF, 0xBEEF )
  SET_VL( zero, 3, e16 )
  LOAD_VEC_16bu( v0, test3A )
  LOAD_VEC_16bu( v1, test3B )
  vadd.vv v2, v0, v1;
  STORE_VEC_16b( v2, test3R )
  COMP_VEC_16bu( test3R, test3E, 3 )

  TEST_CASE_VEC( 4 )
  CREATE_VEC_32b( test4A, 0x00000000, 0x7fffffff, 0x7fffffff )
  CREATE_VEC_32b( test4B, 0x00007fff, 0x00000000, 0x00007fff )
  CREATE_VEC_32b( test4E, 0x00007fff, 0x7fffffff, 0x80007ffe )
  CREATE_VEC_32b( test4R, 0xDEADBEEF, 0xDEADBEEF, 0xDEADBEEF )
  SET_VL( zero, 3, e32 )
  LOAD_VEC_32bu( v0, test4A )
  LOAD_VEC_32bu( v1, test4B )
  vadd.vv v2, v0, v1;
  STORE_VEC_32b( v2, test4R )
  COMP_VEC_32bu( test4R, test4E, 3 )

  TEST_CASE_VEC( 5 )
  CREATE_VEC_32b( test5A, 0xffff8000, 0x00007fff )
  CREATE_VEC_32b( test5B, 0x0000007f, 0xffffff80 )
  CREATE_VEC_32b( test5E, 0xffff807f, 0x00007f7f )
  CREATE_VEC_32b( test5R, 0xDEADBEEF, 0xDEADBEEF )
  SET_VL( zero, 2, e32 )
  LOAD_VEC_32bu( v0, test5A )
  LOAD_VEC_32bu( v1, test5B )
  vadd.vv v2, v0, v1;
  STORE_VEC_32b( v2, test5R )
  COMP_VEC_32bu( test5R, test5E, 2 )

  TEST_CASE_VEC( 6 )
  CREATE_VEC_32b( test6A, 0x00000000, 0xffffffff, 0xffffffff )
  CREATE_VEC_32b( test6B, 0xffffffff, 0x00000001, 0xffffffff )
  CREATE_VEC_32b( test6E, 0xffffffff, 0x00000000, 0xfffffffe )
  CREATE_VEC_32b( test6R, 0xDEADBEEF, 0xDEADBEEF, 0xDEADBEEF )
  SET_VL( zero, 3, e32 )
  LOAD_VEC_32bu( v0, test6A )
  LOAD_VEC_32bu( v1, test6B )
  vadd.vv v2, v0, v1;
  STORE_VEC_32b( v2, test6R )
  COMP_VEC_32bu( test6R, test6E, 3 )

  TEST_CASE_VEC( 7 )
  CREATE_VEC_32b( test7A, 0x00000000, 0x00000001, 0x00000003 )
  CREATE_VEC_32b( test7B, 0x00000000, 0x00000001, 0x00000007 )
  CREATE_VEC_32b( test7E, 0x00000000, 0x00000002, 0x0000000a )
  CREATE_VEC_32b( test7R, 0xDEADBEEF, 0xDEADBEEF, 0xDEADBEEF )
  SET_VL( zero, 3, e32 )
  LOAD_VEC_32bu( v0, test7A )
  LOAD_VEC_32bu( v1, test7B )
  vadd.vv v0, v0, v1;
  STORE_VEC_32b( v0, test7R )
  COMP_VEC_32bu( test7R, test7E, 3 )

  TEST_CASE_VEC( 8 )
  CREATE_VEC_32b( test8A, 0x00000000, 0x00000001, 0x00000003 )
  CREATE_VEC_32b( test8B, 0x00000000, 0x00000001, 0x00000007 )
  CREATE_VEC_32b( test8E, 0x00000000, 0x00000002, 0x0000000a )
  CREATE_VEC_32b( test8R, 0xDEADBEEF, 0xDEADBEEF, 0xDEADBEEF )
  SET_VL( zero, 3, e32 )
  LOAD_VEC_32bu( v0, test8A )
  LOAD_VEC_32bu( v1, test8B )
  vadd.vv v1, v0, v1;
  STORE_VEC_32b( v1, test8R )
  COMP_VEC_32bu( test8R, test8E, 3 )

  TEST_CASE_VEC( 9 )
  CREATE_VEC_32b( test9A, 0x00000000, 0x00000001, 0x00000003 )
  CREATE_VEC_32b( test9E, 0x00000000, 0x00000002, 0x00000006 )
  CREATE_VEC_32b( test9R, 0xDEADBEEF, 0xDEADBEEF, 0xDEADBEEF )
  SET_VL( zero, 3, e32 )
  LOAD_VEC_32bu( v0, test9A )
  vadd.vv v0, v0, v0;
  STORE_VEC_32b( v0, test9R )
  COMP_VEC_32bu( test9R, test9E, 3 )

  TEST_CASE_VEC( 10 )
  CREATE_VEC_8b(  test10M,       0x01,       0xf0,       0xff )
  CREATE_VEC_32b( test10A, 0x00000008, 0x00000001, 0x00000003 )
  CREATE_VEC_32b( test10B, 0x00000008, 0x00000001, 0x00000007 )
  CREATE_VEC_32b( test10E, 0x00000010, 0x00000000, 0x0000000a )
  CREATE_VEC_32b( test10R, 0xDEADBEEF, 0xDEADBEEF, 0xDEADBEEF )
  SET_VL( zero, 3, e8 )
  LOAD_VEC_8bu( v0, test10M )
  SET_VL( zero, 3, e32, m4 )
  LOAD_VEC_32bu( v4, test10A )
  LOAD_VEC_32bu( v8, test10B )
  vadd.vv v12, v4, v8, v0.t;
  STORE_VEC_32b( v12, test10R )
  COMP_VEC_32bu( test10R, test10E, 3 )

  TEST_CASE_VEC( 11 )
  CREATE_VEC_64b( test11A, 0x0000000000000000, 0xffffffff80000000, 0xffffffff80000000 )
  CREATE_VEC_64b( test11B, 0xffffffffffff8000, 0x0000000000000000, 0xffffffffffff8000 )
  CREATE_VEC_64b( test11E, 0xffffffffffff8000, 0xffffffff80000000, 0xffffffff7fff8000 )
  CREATE_VEC_64b( test11R, 0xDEADBEEFDEADBEEF, 0xDEADBEEFDEADBEEF, 0xDEADBEEFDEADBEEF )
  SET_VL( zero, 3, e64 )
  LOAD_VEC_64b( v0, test11A )
  LOAD_VEC_64b( v1, test11B )
  vadd.vv v2, v0, v1
  STORE_VEC_64b( v2, test11R )
  COMP_VEC_64b( test11R, test11E, 3 )

  TEST_CASE_VEC( 12 )
  CREATE_VEC_64b( test12A, 0xffffffff80000000, 0x000000007fffffff )
  CREATE_VEC_64b( test12B, 0x0000000000007fff, 0xffffffffffff8000 )
  CREATE_VEC_64b( test12E, 0xffffffff80007fff, 0x000000007fff7fff )
  CREATE_VEC_64b( test12R, 0xDEADBEEFDEADBEEF, 0xDEADBEEFDEADBEEF )
  SET_VL( zero, 2, e64 )
  LOAD_VEC_64b( v0, test12A )
  LOAD_VEC_64b( v1, test12B )
  vadd.vv v2, v0, v1
  STORE_VEC_64b( v2, test12R )
  COMP_VEC_64b( test12R, test12E, 2 )

  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
