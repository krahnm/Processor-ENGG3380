/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#if defined(_WIN32)
 #include "stdio.h"
#endif
#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_585(char*, char *);
extern void execute_586(char*, char *);
extern void execute_577(char*, char *);
extern void execute_578(char*, char *);
extern void execute_579(char*, char *);
extern void execute_580(char*, char *);
extern void execute_581(char*, char *);
extern void execute_582(char*, char *);
<<<<<<< HEAD
extern void execute_583(char*, char *);
extern void execute_584(char*, char *);
extern void execute_568(char*, char *);
=======
extern void execute_566(char*, char *);
extern void execute_26(char*, char *);
>>>>>>> master
extern void execute_41(char*, char *);
extern void execute_43(char*, char *);
extern void execute_44(char*, char *);
extern void execute_46(char*, char *);
extern void execute_47(char*, char *);
extern void execute_49(char*, char *);
extern void execute_51(char*, char *);
extern void execute_53(char*, char *);
extern void execute_55(char*, char *);
extern void execute_57(char*, char *);
extern void execute_58(char*, char *);
extern void execute_60(char*, char *);
extern void execute_61(char*, char *);
extern void execute_63(char*, char *);
extern void execute_473(char*, char *);
extern void execute_474(char*, char *);
extern void execute_475(char*, char *);
extern void execute_476(char*, char *);
extern void execute_477(char*, char *);
extern void execute_478(char*, char *);
extern void execute_66(char*, char *);
extern void execute_67(char*, char *);
extern void execute_68(char*, char *);
extern void execute_69(char*, char *);
extern void execute_70(char*, char *);
extern void execute_71(char*, char *);
extern void execute_72(char*, char *);
extern void execute_73(char*, char *);
extern void execute_74(char*, char *);
extern void execute_76(char*, char *);
extern void execute_81(char*, char *);
extern void execute_79(char*, char *);
extern void execute_80(char*, char *);
extern void execute_419(char*, char *);
extern void execute_420(char*, char *);
extern void execute_470(char*, char *);
extern void execute_471(char*, char *);
extern void execute_472(char*, char *);
extern void execute_422(char*, char *);
extern void execute_423(char*, char *);
extern void execute_425(char*, char *);
extern void execute_426(char*, char *);
extern void execute_428(char*, char *);
extern void execute_429(char*, char *);
extern void execute_431(char*, char *);
extern void execute_432(char*, char *);
extern void execute_434(char*, char *);
extern void execute_435(char*, char *);
extern void execute_437(char*, char *);
extern void execute_438(char*, char *);
extern void execute_440(char*, char *);
extern void execute_441(char*, char *);
extern void execute_443(char*, char *);
extern void execute_444(char*, char *);
extern void execute_446(char*, char *);
extern void execute_447(char*, char *);
extern void execute_449(char*, char *);
extern void execute_450(char*, char *);
extern void execute_452(char*, char *);
extern void execute_453(char*, char *);
extern void execute_455(char*, char *);
extern void execute_456(char*, char *);
extern void execute_458(char*, char *);
extern void execute_459(char*, char *);
extern void execute_461(char*, char *);
extern void execute_462(char*, char *);
extern void execute_464(char*, char *);
extern void execute_465(char*, char *);
extern void execute_467(char*, char *);
extern void execute_468(char*, char *);
extern void execute_480(char*, char *);
extern void execute_482(char*, char *);
extern void execute_483(char*, char *);
extern void execute_485(char*, char *);
extern void execute_488(char*, char *);
extern void execute_489(char*, char *);
extern void execute_491(char*, char *);
extern void execute_493(char*, char *);
extern void execute_495(char*, char *);
extern void execute_496(char*, char *);
extern void execute_497(char*, char *);
extern void execute_498(char*, char *);
extern void execute_499(char*, char *);
extern void execute_500(char*, char *);
extern void execute_501(char*, char *);
extern void execute_502(char*, char *);
extern void execute_503(char*, char *);
extern void execute_504(char*, char *);
extern void execute_505(char*, char *);
extern void execute_506(char*, char *);
extern void execute_507(char*, char *);
extern void execute_508(char*, char *);
extern void execute_509(char*, char *);
extern void execute_510(char*, char *);
extern void execute_511(char*, char *);
extern void execute_512(char*, char *);
extern void execute_513(char*, char *);
extern void execute_514(char*, char *);
extern void execute_515(char*, char *);
extern void execute_516(char*, char *);
extern void execute_517(char*, char *);
extern void execute_518(char*, char *);
extern void execute_519(char*, char *);
extern void execute_520(char*, char *);
extern void execute_521(char*, char *);
extern void execute_522(char*, char *);
extern void execute_523(char*, char *);
extern void execute_524(char*, char *);
extern void execute_525(char*, char *);
extern void execute_526(char*, char *);
extern void execute_527(char*, char *);
extern void execute_528(char*, char *);
extern void execute_529(char*, char *);
extern void execute_530(char*, char *);
extern void execute_531(char*, char *);
extern void execute_532(char*, char *);
extern void execute_533(char*, char *);
extern void execute_534(char*, char *);
extern void execute_535(char*, char *);
extern void execute_536(char*, char *);
extern void execute_537(char*, char *);
extern void execute_538(char*, char *);
extern void execute_539(char*, char *);
extern void execute_540(char*, char *);
extern void execute_541(char*, char *);
extern void execute_542(char*, char *);
extern void execute_543(char*, char *);
extern void execute_544(char*, char *);
extern void execute_545(char*, char *);
extern void execute_546(char*, char *);
extern void execute_547(char*, char *);
extern void execute_548(char*, char *);
extern void execute_549(char*, char *);
extern void execute_550(char*, char *);
extern void execute_551(char*, char *);
extern void execute_552(char*, char *);
extern void execute_553(char*, char *);
extern void execute_554(char*, char *);
extern void execute_555(char*, char *);
extern void execute_557(char*, char *);
extern void execute_559(char*, char *);
extern void execute_561(char*, char *);
extern void execute_563(char*, char *);
extern void execute_565(char*, char *);
extern void execute_567(char*, char *);
extern void execute_570(char*, char *);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
extern void transaction_2(char*, char*, unsigned, unsigned, unsigned);
extern void transaction_6(char*, char*, unsigned, unsigned, unsigned);
<<<<<<< HEAD
funcp funcTab[160] = {(funcp)execute_585, (funcp)execute_586, (funcp)execute_577, (funcp)execute_578, (funcp)execute_579, (funcp)execute_580, (funcp)execute_581, (funcp)execute_582, (funcp)execute_583, (funcp)execute_584, (funcp)execute_568, (funcp)execute_41, (funcp)execute_43, (funcp)execute_44, (funcp)execute_46, (funcp)execute_47, (funcp)execute_49, (funcp)execute_51, (funcp)execute_53, (funcp)execute_55, (funcp)execute_57, (funcp)execute_58, (funcp)execute_60, (funcp)execute_61, (funcp)execute_63, (funcp)execute_473, (funcp)execute_474, (funcp)execute_475, (funcp)execute_476, (funcp)execute_477, (funcp)execute_478, (funcp)execute_66, (funcp)execute_67, (funcp)execute_68, (funcp)execute_69, (funcp)execute_70, (funcp)execute_71, (funcp)execute_72, (funcp)execute_73, (funcp)execute_74, (funcp)execute_76, (funcp)execute_81, (funcp)execute_79, (funcp)execute_80, (funcp)execute_419, (funcp)execute_420, (funcp)execute_470, (funcp)execute_471, (funcp)execute_472, (funcp)execute_422, (funcp)execute_423, (funcp)execute_425, (funcp)execute_426, (funcp)execute_428, (funcp)execute_429, (funcp)execute_431, (funcp)execute_432, (funcp)execute_434, (funcp)execute_435, (funcp)execute_437, (funcp)execute_438, (funcp)execute_440, (funcp)execute_441, (funcp)execute_443, (funcp)execute_444, (funcp)execute_446, (funcp)execute_447, (funcp)execute_449, (funcp)execute_450, (funcp)execute_452, (funcp)execute_453, (funcp)execute_455, (funcp)execute_456, (funcp)execute_458, (funcp)execute_459, (funcp)execute_461, (funcp)execute_462, (funcp)execute_464, (funcp)execute_465, (funcp)execute_467, (funcp)execute_468, (funcp)execute_480, (funcp)execute_482, (funcp)execute_483, (funcp)execute_485, (funcp)execute_488, (funcp)execute_489, (funcp)execute_491, (funcp)execute_493, (funcp)execute_495, (funcp)execute_496, (funcp)execute_497, (funcp)execute_498, (funcp)execute_499, (funcp)execute_500, (funcp)execute_501, (funcp)execute_502, (funcp)execute_503, (funcp)execute_504, (funcp)execute_505, (funcp)execute_506, (funcp)execute_507, (funcp)execute_508, (funcp)execute_509, (funcp)execute_510, (funcp)execute_511, (funcp)execute_512, (funcp)execute_513, (funcp)execute_514, (funcp)execute_515, (funcp)execute_516, (funcp)execute_517, (funcp)execute_518, (funcp)execute_519, (funcp)execute_520, (funcp)execute_521, (funcp)execute_522, (funcp)execute_523, (funcp)execute_524, (funcp)execute_525, (funcp)execute_526, (funcp)execute_527, (funcp)execute_528, (funcp)execute_529, (funcp)execute_530, (funcp)execute_531, (funcp)execute_532, (funcp)execute_533, (funcp)execute_534, (funcp)execute_535, (funcp)execute_536, (funcp)execute_537, (funcp)execute_538, (funcp)execute_539, (funcp)execute_540, (funcp)execute_541, (funcp)execute_542, (funcp)execute_543, (funcp)execute_544, (funcp)execute_545, (funcp)execute_546, (funcp)execute_547, (funcp)execute_548, (funcp)execute_549, (funcp)execute_550, (funcp)execute_551, (funcp)execute_552, (funcp)execute_553, (funcp)execute_554, (funcp)execute_555, (funcp)execute_557, (funcp)execute_559, (funcp)execute_561, (funcp)execute_563, (funcp)execute_565, (funcp)execute_567, (funcp)execute_570, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_2, (funcp)transaction_6};
=======
funcp funcTab[160] = {(funcp)execute_583, (funcp)execute_584, (funcp)execute_575, (funcp)execute_576, (funcp)execute_577, (funcp)execute_578, (funcp)execute_579, (funcp)execute_580, (funcp)execute_581, (funcp)execute_582, (funcp)execute_566, (funcp)execute_26, (funcp)execute_41, (funcp)execute_42, (funcp)execute_44, (funcp)execute_45, (funcp)execute_47, (funcp)execute_49, (funcp)execute_51, (funcp)execute_53, (funcp)execute_55, (funcp)execute_56, (funcp)execute_58, (funcp)execute_59, (funcp)execute_61, (funcp)execute_471, (funcp)execute_472, (funcp)execute_473, (funcp)execute_474, (funcp)execute_475, (funcp)execute_476, (funcp)execute_64, (funcp)execute_65, (funcp)execute_66, (funcp)execute_67, (funcp)execute_68, (funcp)execute_69, (funcp)execute_70, (funcp)execute_71, (funcp)execute_72, (funcp)execute_74, (funcp)execute_79, (funcp)execute_77, (funcp)execute_78, (funcp)execute_417, (funcp)execute_418, (funcp)execute_468, (funcp)execute_469, (funcp)execute_470, (funcp)execute_420, (funcp)execute_421, (funcp)execute_423, (funcp)execute_424, (funcp)execute_426, (funcp)execute_427, (funcp)execute_429, (funcp)execute_430, (funcp)execute_432, (funcp)execute_433, (funcp)execute_435, (funcp)execute_436, (funcp)execute_438, (funcp)execute_439, (funcp)execute_441, (funcp)execute_442, (funcp)execute_444, (funcp)execute_445, (funcp)execute_447, (funcp)execute_448, (funcp)execute_450, (funcp)execute_451, (funcp)execute_453, (funcp)execute_454, (funcp)execute_456, (funcp)execute_457, (funcp)execute_459, (funcp)execute_460, (funcp)execute_462, (funcp)execute_463, (funcp)execute_465, (funcp)execute_466, (funcp)execute_478, (funcp)execute_480, (funcp)execute_481, (funcp)execute_483, (funcp)execute_486, (funcp)execute_487, (funcp)execute_489, (funcp)execute_491, (funcp)execute_493, (funcp)execute_494, (funcp)execute_495, (funcp)execute_496, (funcp)execute_497, (funcp)execute_498, (funcp)execute_499, (funcp)execute_500, (funcp)execute_501, (funcp)execute_502, (funcp)execute_503, (funcp)execute_504, (funcp)execute_505, (funcp)execute_506, (funcp)execute_507, (funcp)execute_508, (funcp)execute_509, (funcp)execute_510, (funcp)execute_511, (funcp)execute_512, (funcp)execute_513, (funcp)execute_514, (funcp)execute_515, (funcp)execute_516, (funcp)execute_517, (funcp)execute_518, (funcp)execute_519, (funcp)execute_520, (funcp)execute_521, (funcp)execute_522, (funcp)execute_523, (funcp)execute_524, (funcp)execute_525, (funcp)execute_526, (funcp)execute_527, (funcp)execute_528, (funcp)execute_529, (funcp)execute_530, (funcp)execute_531, (funcp)execute_532, (funcp)execute_533, (funcp)execute_534, (funcp)execute_535, (funcp)execute_536, (funcp)execute_537, (funcp)execute_538, (funcp)execute_539, (funcp)execute_540, (funcp)execute_541, (funcp)execute_542, (funcp)execute_543, (funcp)execute_544, (funcp)execute_545, (funcp)execute_546, (funcp)execute_547, (funcp)execute_548, (funcp)execute_549, (funcp)execute_550, (funcp)execute_551, (funcp)execute_552, (funcp)execute_553, (funcp)execute_555, (funcp)execute_557, (funcp)execute_559, (funcp)execute_561, (funcp)execute_563, (funcp)execute_565, (funcp)execute_568, (funcp)vhdl_transfunc_eventcallback, (funcp)transaction_2, (funcp)transaction_6};
>>>>>>> master
const int NumRelocateId= 160;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/processor_tb_behav/xsim.reloc",  (void **)funcTab, 160);
<<<<<<< HEAD
	iki_vhdl_file_variable_register(dp + 48285864);
	iki_vhdl_file_variable_register(dp + 48285920);
=======
	iki_vhdl_file_variable_register(dp + 48286000);
	iki_vhdl_file_variable_register(dp + 48286056);
>>>>>>> master


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/processor_tb_behav/xsim.reloc");
}

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/processor_tb_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstantiate();

extern void implicit_HDL_SCcleanup();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/processor_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/processor_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/processor_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
