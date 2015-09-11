/* Test the `vrev64Qs16' ARM Neon intrinsic.  */
/* This file was autogenerated by neon-testgen.  */

/* { dg-do assemble } */
/* { dg-require-effective-target arm_neon_ok } */
/* { dg-options "-save-temps -O0" } */
/* { dg-add-options arm_neon } */

#include "arm_neon.h"

void test_vrev64Qs16 (void)
{
  int16x8_t out_int16x8_t;
  int16x8_t arg0_int16x8_t;

  out_int16x8_t = vrev64q_s16 (arg0_int16x8_t);
}

/* { dg-final { scan-assembler "vrev64\.16\[ 	\]+\[qQ\]\[0-9\]+, \[qQ\]\[0-9\]+!?\(\[ 	\]+@\[a-zA-Z0-9 \]+\)?\n" } } */
