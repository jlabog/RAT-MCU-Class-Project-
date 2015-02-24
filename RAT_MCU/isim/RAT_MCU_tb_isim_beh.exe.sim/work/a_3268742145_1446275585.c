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
static const char *ng0 = "C:/Users/Jacobe/Desktop/RAT-MCU-Class-Project-/RAT_MCU/counter_mux.vhd";
extern char *IEEE_P_2592010699;



static void work_a_3268742145_1446275585_p_0(char *t0)
{
    char t29[16];
    char t31[16];
    char t36[16];
    char *t1;
    char *t2;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned char t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t30;
    char *t32;
    char *t33;
    int t34;
    unsigned int t35;
    char *t37;
    int t38;
    unsigned char t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    unsigned char t47;
    unsigned int t48;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    char *t58;
    char *t59;
    char *t60;
    char *t61;
    char *t62;
    char *t63;
    char *t64;

LAB0:    xsi_set_current_line(36, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 5236);
    t4 = 1;
    if (2U == 2U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB3;

LAB4:    t14 = (t0 + 1512U);
    t15 = *((char **)t14);
    t14 = (t0 + 5238);
    t17 = 1;
    if (2U == 2U)
        goto LAB13;

LAB14:    t17 = 0;

LAB15:    if (t17 != 0)
        goto LAB11;

LAB12:    t44 = (t0 + 1512U);
    t45 = *((char **)t44);
    t44 = (t0 + 5242);
    t47 = 1;
    if (2U == 2U)
        goto LAB23;

LAB24:    t47 = 0;

LAB25:    if (t47 != 0)
        goto LAB21;

LAB22:
LAB29:    t57 = xsi_get_transient_memory(10U);
    memset(t57, 0, 10U);
    t58 = t57;
    memset(t58, (unsigned char)3, 10U);
    t59 = (t0 + 3232);
    t60 = (t59 + 56U);
    t61 = *((char **)t60);
    t62 = (t61 + 56U);
    t63 = *((char **)t62);
    memcpy(t63, t57, 10U);
    xsi_driver_first_trans_fast_port(t59);

LAB2:    t64 = (t0 + 3152);
    *((int *)t64) = 1;

LAB1:    return;
LAB3:    t8 = (t0 + 1352U);
    t9 = *((char **)t8);
    t8 = (t0 + 3232);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t9, 10U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB5:    t5 = 0;

LAB8:    if (t5 < 2U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB11:    t21 = (t0 + 5240);
    t23 = (t0 + 1192U);
    t24 = *((char **)t23);
    t25 = (9 - 7);
    t26 = (t25 * 1U);
    t27 = (0 + t26);
    t23 = (t24 + t27);
    t30 = ((IEEE_P_2592010699) + 4024);
    t32 = (t31 + 0U);
    t33 = (t32 + 0U);
    *((int *)t33) = 0;
    t33 = (t32 + 4U);
    *((int *)t33) = 1;
    t33 = (t32 + 8U);
    *((int *)t33) = 1;
    t34 = (1 - 0);
    t35 = (t34 * 1);
    t35 = (t35 + 1);
    t33 = (t32 + 12U);
    *((unsigned int *)t33) = t35;
    t33 = (t36 + 0U);
    t37 = (t33 + 0U);
    *((int *)t37) = 7;
    t37 = (t33 + 4U);
    *((int *)t37) = 0;
    t37 = (t33 + 8U);
    *((int *)t37) = -1;
    t38 = (0 - 7);
    t35 = (t38 * -1);
    t35 = (t35 + 1);
    t37 = (t33 + 12U);
    *((unsigned int *)t37) = t35;
    t28 = xsi_base_array_concat(t28, t29, t30, (char)97, t21, t31, (char)97, t23, t36, (char)101);
    t35 = (2U + 8U);
    t39 = (10U != t35);
    if (t39 == 1)
        goto LAB19;

LAB20:    t37 = (t0 + 3232);
    t40 = (t37 + 56U);
    t41 = *((char **)t40);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    memcpy(t43, t28, 10U);
    xsi_driver_first_trans_fast_port(t37);
    goto LAB2;

LAB13:    t18 = 0;

LAB16:    if (t18 < 2U)
        goto LAB17;
    else
        goto LAB15;

LAB17:    t19 = (t15 + t18);
    t20 = (t14 + t18);
    if (*((unsigned char *)t19) != *((unsigned char *)t20))
        goto LAB14;

LAB18:    t18 = (t18 + 1);
    goto LAB16;

LAB19:    xsi_size_not_matching(10U, t35, 0);
    goto LAB20;

LAB21:    t51 = (t0 + 1032U);
    t52 = *((char **)t51);
    t51 = (t0 + 3232);
    t53 = (t51 + 56U);
    t54 = *((char **)t53);
    t55 = (t54 + 56U);
    t56 = *((char **)t55);
    memcpy(t56, t52, 10U);
    xsi_driver_first_trans_fast_port(t51);
    goto LAB2;

LAB23:    t48 = 0;

LAB26:    if (t48 < 2U)
        goto LAB27;
    else
        goto LAB25;

LAB27:    t49 = (t45 + t48);
    t50 = (t44 + t48);
    if (*((unsigned char *)t49) != *((unsigned char *)t50))
        goto LAB24;

LAB28:    t48 = (t48 + 1);
    goto LAB26;

LAB30:    goto LAB2;

}


extern void work_a_3268742145_1446275585_init()
{
	static char *pe[] = {(void *)work_a_3268742145_1446275585_p_0};
	xsi_register_didat("work_a_3268742145_1446275585", "isim/RAT_MCU_tb_isim_beh.exe.sim/work/a_3268742145_1446275585.didat");
	xsi_register_executes(pe);
}
