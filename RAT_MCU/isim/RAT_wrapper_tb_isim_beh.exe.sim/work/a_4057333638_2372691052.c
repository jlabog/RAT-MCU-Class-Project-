/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Jacobe/Desktop/RAT-MCU-Class-Project-/RAT_MCU/RAT_wrapper_tb.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1258338084_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_4057333638_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 3632);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(80, ng0);
    t2 = (t0 + 1968U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2760);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 3632);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 1968U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2760);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_4057333638_2372691052_p_1(char *t0)
{
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    int64 t5;
    int t6;
    int t7;
    char *t8;
    char *t9;
    unsigned char t10;
    char *t11;
    int t12;

LAB0:    t1 = (t0 + 3200U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(90, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 3008);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 1968U);
    t4 = *((char **)t2);
    t3 = *((int64 *)t4);
    t5 = (t3 * 10);
    t2 = (t0 + 3008);
    xsi_process_wait(t2, t5);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(95, ng0);
    t2 = (t0 + 6072);
    *((int *)t2) = 0;
    t4 = (t0 + 6076);
    *((int *)t4) = 200;
    t6 = 0;
    t7 = 200;

LAB12:    if (t6 <= t7)
        goto LAB13;

LAB15:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 3696);
    t4 = (t2 + 56U);
    t8 = *((char **)t4);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(101, ng0);
    t2 = (t0 + 6080);
    *((int *)t2) = 0;
    t4 = (t0 + 6084);
    *((int *)t4) = 200;
    t6 = 0;
    t7 = 200;

LAB21:    if (t6 <= t7)
        goto LAB22;

LAB24:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 3696);
    t4 = (t2 + 56U);
    t8 = *((char **)t4);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(107, ng0);
    t2 = (t0 + 6088);
    *((int *)t2) = 0;
    t4 = (t0 + 6092);
    *((int *)t4) = 200;
    t6 = 0;
    t7 = 200;

LAB30:    if (t6 <= t7)
        goto LAB31;

LAB33:    xsi_set_current_line(111, ng0);
    t2 = (t0 + 3696);
    t4 = (t2 + 56U);
    t8 = *((char **)t4);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(112, ng0);

LAB41:    *((char **)t1) = &&LAB42;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB13:    xsi_set_current_line(96, ng0);

LAB18:    t8 = (t0 + 3520);
    *((int *)t8) = 1;
    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB14:    t2 = (t0 + 6072);
    t6 = *((int *)t2);
    t4 = (t0 + 6076);
    t7 = *((int *)t4);
    if (t6 == t7)
        goto LAB15;

LAB20:    t12 = (t6 + 1);
    t6 = t12;
    t8 = (t0 + 6072);
    *((int *)t8) = t6;
    goto LAB12;

LAB16:    t11 = (t0 + 3520);
    *((int *)t11) = 0;
    goto LAB14;

LAB17:    t9 = (t0 + 1472U);
    t10 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t9, 0U, 0U);
    if (t10 == 1)
        goto LAB16;
    else
        goto LAB18;

LAB19:    goto LAB17;

LAB22:    xsi_set_current_line(102, ng0);

LAB27:    t8 = (t0 + 3536);
    *((int *)t8) = 1;
    *((char **)t1) = &&LAB28;
    goto LAB1;

LAB23:    t2 = (t0 + 6080);
    t6 = *((int *)t2);
    t4 = (t0 + 6084);
    t7 = *((int *)t4);
    if (t6 == t7)
        goto LAB24;

LAB29:    t12 = (t6 + 1);
    t6 = t12;
    t8 = (t0 + 6080);
    *((int *)t8) = t6;
    goto LAB21;

LAB25:    t11 = (t0 + 3536);
    *((int *)t11) = 0;
    goto LAB23;

LAB26:    t9 = (t0 + 1472U);
    t10 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t9, 0U, 0U);
    if (t10 == 1)
        goto LAB25;
    else
        goto LAB27;

LAB28:    goto LAB26;

LAB31:    xsi_set_current_line(108, ng0);

LAB36:    t8 = (t0 + 3552);
    *((int *)t8) = 1;
    *((char **)t1) = &&LAB37;
    goto LAB1;

LAB32:    t2 = (t0 + 6088);
    t6 = *((int *)t2);
    t4 = (t0 + 6092);
    t7 = *((int *)t4);
    if (t6 == t7)
        goto LAB33;

LAB38:    t12 = (t6 + 1);
    t6 = t12;
    t8 = (t0 + 6088);
    *((int *)t8) = t6;
    goto LAB30;

LAB34:    t11 = (t0 + 3552);
    *((int *)t11) = 0;
    goto LAB32;

LAB35:    t9 = (t0 + 1472U);
    t10 = ieee_p_2592010699_sub_1258338084_503743352(IEEE_P_2592010699, t9, 0U, 0U);
    if (t10 == 1)
        goto LAB34;
    else
        goto LAB36;

LAB37:    goto LAB35;

LAB39:    goto LAB2;

LAB40:    goto LAB39;

LAB42:    goto LAB40;

}


extern void work_a_4057333638_2372691052_init()
{
	static char *pe[] = {(void *)work_a_4057333638_2372691052_p_0,(void *)work_a_4057333638_2372691052_p_1};
	xsi_register_didat("work_a_4057333638_2372691052", "isim/RAT_wrapper_tb_isim_beh.exe.sim/work/a_4057333638_2372691052.didat");
	xsi_register_executes(pe);
}
