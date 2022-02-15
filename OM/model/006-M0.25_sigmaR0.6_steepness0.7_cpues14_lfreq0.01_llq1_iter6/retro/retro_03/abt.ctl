#V3.30
#C file created using the SS_writectl function in the R package r4ss
#C file write time: 2021-08-04 09:49:06
#
0 # 0 means do not read wtatage.ss; 1 means read and usewtatage.ss and also read and use growth parameters
1 #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern
4 # recr_dist_method for parameters
1 # not yet implemented; Future usage:Spawner-Recruitment; 1=global; 2=by area
1 # number of recruitment settlement assignments 
0 # unused option
# for each settlement assignment:
#_GPattern	month	area	age
1	1	1	0	#_recr_dist_pattern1
#
#_Cond 0 # N_movement_definitions goes here if N_areas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
1 #_Nblock_Patterns
1 #_blocks_per_pattern
#_begin and end years of blocks
1949 1949
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#
# AUTOGEN
1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
#_no additional input for selected M option; read 1P per morph
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr;5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
1 #_Age(post-settlement)_for_L1;linear growth below this
999 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0 #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
1 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
6 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
# Length Maturity: 
#_Len_1	Len_2	Len_3	Len_4	Len_5	Len_6	Len_7	Len_8	Len_9	Len_10	Len_11	Len_12	Len_13	Len_14	Len_15	Len_16	Len_17	Len_18	Len_19	Len_20	Len_21	Len_22	Len_23	Len_24	Len_25	Len_26	Len_27	Len_28	Len_29	Len_30	Len_31	Len_32	Len_33	Len_34	Len_35	Len_36	Len_37	Len_38	Len_39	Len_40	Len_41	Len_42	Len_43	Len_44	Len_45	Len_46	Len_47	Len_48	Len_49	Len_50	Len_51	Len_52	Len_53	Len_54	Len_55	Len_56	Len_57	Len_58	Len_59	Len_60	Len_61	Len_62	Len_63	Len_64	Len_65	Len_66
3.44115e-23	1.22434e-22	4.35611e-22	1.54988e-21	5.51435e-21	1.96197e-20	6.98056e-20	2.48363e-19	8.83661e-19	3.14401e-18	1.11862e-17	3.97996e-17	1.41604e-16	5.03819e-16	1.79255e-15	6.37778e-15	2.26917e-14	8.07356e-14	2.87252e-13	1.02202e-12	3.63629e-12	1.29377e-11	4.60314e-11	1.63777e-10	5.82706e-10	2.07323e-09	7.37641e-09	2.62448e-08	9.33771e-08	3.32229e-07	1.18205e-06	4.20564e-06	1.49632e-05	5.32361e-05	0.000189385	0.000673491	0.00239212	0.00845923	0.0294599	0.0974713	0.277587	0.577548	0.829473	0.945374	0.984019	0.995456	0.998719	0.99964	0.999899	0.999972	0.999992	0.999998	0.999999	1	1	1	1	1	1	1	1	1	1	1	1	1	#_Length_Maturity1
1 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env_var&link	dev_link	dev_minyr	dev_maxyr	dev_PH	Block	Block_Fxn
 1e-01	  0.800000	 2.50000e-01	  0.300000	99.0	0	 -1	0	0	0	0	0	0	0	#_NatM_p_1_Fem_GP_1      
 1e+01	 60.000000	 5.26038e+01	 32.000000	99.0	0	 -5	0	0	0	0	0	0	0	#_L_at_Amin_Fem_GP_1     
 1e+02	150.000000	 1.03800e+02	103.800000	99.0	0	 -5	0	0	0	0	0	0	0	#_L_at_Amax_Fem_GP_1     
 1e-02	  0.400000	 3.80000e-01	  0.380000	99.0	0	 -5	0	0	0	0	0	0	0	#_VonBert_K_Fem_GP_1     
 1e-02	  0.300000	 6.00000e-02	  0.060000	99.0	0	 -5	0	0	0	0	0	0	0	#_CV_young_Fem_GP_1      
 1e-02	  0.300000	 2.50000e-02	  0.025000	99.0	0	 -5	0	0	0	0	0	0	0	#_CV_old_Fem_GP_1        
-2e+00	  2.000000	 1.37180e-05	  0.000087	99.0	0	 -3	0	0	0	0	0	0	0	#_Wtlen_1_Fem_GP_1       
-2e+00	  4.000000	 3.09730e+00	  2.670000	99.0	0	 -3	0	0	0	0	0	0	0	#_Wtlen_2_Fem_GP_1       
 1e+00	 10.000000	 5.00000e+00	  5.000000	99.0	0	 -3	0	0	0	0	0	0	0	#_Mat50%_Fem_GP_1        
-5e+00	  5.000000	-3.74600e+00	 -3.746000	99.0	0	 -3	0	0	0	0	0	0	0	#_Mat_slope_Fem_GP_1     
 0e+00	  3.000000	 1.00000e+00	  1.000000	99.0	0	 -3	0	0	0	0	0	0	0	#_Eggs_intercept_Fem_GP_1
 0e+00	  3.000000	 0.00000e+00	  0.000000	99.0	0	 -3	0	0	0	0	0	0	0	#_Eggs_slope_wt_Fem_GP_1 
 1e-01	  0.800000	 2.50000e-01	  0.300000	99.0	0	 -1	0	0	0	0	0	0	0	#_NatM_p_1_Mal_GP_1      
 1e+01	 60.000000	 5.20360e+01	 32.000000	99.0	0	 -5	0	0	0	0	0	0	0	#_L_at_Amin_Mal_GP_1     
 1e+02	150.000000	 1.10600e+02	110.600000	99.0	0	 -5	0	0	0	0	0	0	0	#_L_at_Amax_Mal_GP_1     
 1e-02	  0.400000	 3.40000e-01	  0.340000	99.0	0	 -5	0	0	0	0	0	0	0	#_VonBert_K_Mal_GP_1     
 1e-02	  0.300000	 6.00000e-02	  0.060000	99.0	0	 -5	0	0	0	0	0	0	0	#_CV_young_Mal_GP_1      
 1e-02	  0.300000	 2.50000e-02	  0.025000	99.0	0	 -5	0	0	0	0	0	0	0	#_CV_old_Mal_GP_1        
-2e+01	 20.000000	 1.37180e-05	  0.000000	99.0	0	 -1	0	0	0	0	0	0	0	#_Wtlen_1_Mal_GP_1       
-2e+01	 20.000000	 3.09730e+00	  0.000000	99.0	0	 -1	0	0	0	0	0	0	0	#_Wtlen_2_Mal_GP_1       
-4e+00	  4.000000	 1.00000e+00	  1.000000	99.0	0	 -3	0	0	0	0	0	0	0	#_CohortGrowDev          
 1e-06	  0.999999	 5.00000e-01	  0.500000	 0.5	0	-99	0	0	0	0	0	0	0	#_FracFemale_GP_1        
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; 2=Ricker; 3=std_B-H; 4=SCAA;5=Hockey; 6=B-H_flattop; 7=survival_3Parm;8=Shepard_3Parm
0 # 0/1 to use steepness in initial equ recruitment calculation
0 # future feature: 0/1 to make realized sigmaR a function of SR curvature
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn # parm_name
  5.0	15	10.0	10.00	99	0	 1	0	0	0	0	0	0	0	#_SR_LN(R0)  
  0.2	 1	 0.7	 0.75	99	0	-4	0	0	0	0	0	0	0	#_SR_BH_steep
  0.0	 2	 0.6	 0.30	99	0	-1	0	0	0	0	0	0	0	#_SR_sigmaR  
-10.0	10	 0.0	 0.00	99	0	-1	0	0	0	0	0	0	0	#_SR_regime  
  0.0	 0	 0.0	 0.00	99	0	-1	0	0	0	0	0	0	0	#_SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1975 # first year of main recr_devs; early devs can preceed this era
2015 # last year of main recr_devs; forecast devs start in following year
5 #_recdev phase
1 # (0/1) to read 13 advanced options
0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
-5 #_recdev_early_phase
0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
1 #_lambda for Fcast_recr_like occurring before endyr+1
1973.8 #_last_yr_nobias_adj_in_MPD; begin of ramp
1978.1 #_first_yr_fullbias_adj_in_MPD; begin of plateau
2016 #_last_yr_fullbias_adj_in_MPD
2016.1 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
0.7945 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
0 #_period of cycles in recruitment (N parms read below)
-5 #min rec_dev
5 #max rec_dev
0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
#Fishing Mortality info
0.5 # F ballpark
-2008 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
5 # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 0
#
#_Q_setup for fleets with cpue or survey data
#_fleet	link	link_info	extra_se	biasadj	float  #  fleetname
   12	1	0	0	0	1	#_LLCPUE1     
   13	1	0	0	0	1	#_LLCPUE2     
   14	1	0	0	0	1	#_LLCPUE3     
   15	1	0	0	0	1	#_LLCPUE4     
   16	1	0	0	0	1	#_DNCPUE4     
   17	1	0	0	0	1	#_LLCPUE1early
   18	1	0	0	0	1	#_LLCPUE2early
   19	1	0	0	0	1	#_LLCPUE3early
   20	1	0	0	0	1	#_LLCPUE4early
-9999	0	0	0	0	0	#_terminator  
#_Q_parms(if_any);Qunits_are_ln(q)
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn  #  parm_name
-20	 3	0	0	99	0	-2	0	0	0	0	0	0	0	#_LnQ_base_LLCPUE1(12)     
 -6	 6	0	0	 1	0	-4	0	0	0	0	0	0	0	#_LnQ_base_LLCPUE2(13)     
 -6	 6	0	0	 1	0	-4	0	0	0	0	0	0	0	#_LnQ_base_LLCPUE3(14)     
 -6	 6	0	0	 1	0	-4	0	0	0	0	0	0	0	#_LnQ_base_LLCPUE4(15)     
-25	25	0	0	 1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_DNCPUE4(16)     
-20	 3	0	0	99	0	-2	0	0	0	0	0	0	0	#_LnQ_base_LLCPUE1early(17)
-20	 3	0	0	99	0	-2	0	0	0	0	0	0	0	#_LnQ_base_LLCPUE2early(18)
-20	 3	0	0	99	0	-2	0	0	0	0	0	0	0	#_LnQ_base_LLCPUE3early(19)
-20	 3	0	0	99	0	-2	0	0	0	0	0	0	0	#_LnQ_base_LLCPUE4early(20)
#_no timevary Q parameters
#
#_size_selex_patterns
#_Pattern	Discard	Male	Special
24	0	0	0	#_1 F1_LL1       
15	0	0	1	#_2 F2_LL2       
24	0	0	0	#_3 F3_LL3       
15	0	0	3	#_4 F4_LL4       
24	0	0	0	#_5 F5_DN3       
15	0	0	5	#_6 F6_DN4       
24	0	0	0	#_7 F7_PS1       
15	0	0	5	#_8 F8_Other1    
15	0	0	5	#_9 F9_Other2    
15	0	0	5	#_10 F10_Other3  
15	0	0	5	#_11 F11_Other4  
15	0	0	1	#_12 LLCPUE1     
15	0	0	1	#_13 LLCPUE2     
15	0	0	3	#_14 LLCPUE3     
15	0	0	3	#_15 LLCPUE4     
15	0	0	5	#_16 DNCPUE4     
15	0	0	1	#_17 LLCPUE1early
15	0	0	1	#_18 LLCPUE2early
15	0	0	3	#_19 LLCPUE3early
15	0	0	3	#_20 LLCPUE4early
#
#_age_selex_patterns
#_Pattern	Discard	Male	Special
10	0	0	0	#_1 F1_LL1       
10	0	0	0	#_2 F2_LL2       
10	0	0	0	#_3 F3_LL3       
10	0	0	0	#_4 F4_LL4       
10	0	0	0	#_5 F5_DN3       
10	0	0	0	#_6 F6_DN4       
10	0	0	0	#_7 F7_PS1       
10	0	0	0	#_8 F8_Other1    
10	0	0	0	#_9 F9_Other2    
10	0	0	0	#_10 F10_Other3  
10	0	0	0	#_11 F11_Other4  
10	0	0	0	#_12 LLCPUE1     
10	0	0	0	#_13 LLCPUE2     
10	0	0	0	#_14 LLCPUE3     
10	0	0	0	#_15 LLCPUE4     
10	0	0	0	#_16 DNCPUE4     
10	0	0	0	#_17 LLCPUE1early
10	0	0	0	#_18 LLCPUE2early
10	0	0	0	#_19 LLCPUE3early
10	0	0	0	#_20 LLCPUE4early
#
#_SizeSelex
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn  #  parm_name
  30	 139	  90.0	 90.0	 5	0	 2	0	0	0	0	0	0	0	#_SizeSel_P_1_F1_LL1(1)
 -12	   4	  -2.2	 -2.2	99	0	 4	0	0	0	0	0	0	0	#_SizeSel_P_2_F1_LL1(1)
  -1	   9	   5.0	  5.0	 1	0	 3	0	0	0	0	0	0	0	#_SizeSel_P_3_F1_LL1(1)
  -1	   9	   4.3	  4.3	99	0	 4	0	0	0	0	0	0	0	#_SizeSel_P_4_F1_LL1(1)
-999	-600	-999.0	 -5.0	99	0	-2	0	0	0	0	0	0	0	#_SizeSel_P_5_F1_LL1(1)
 -15	   9	   5.0	  5.0	99	0	-5	0	0	0	0	0	0	0	#_SizeSel_P_6_F1_LL1(1)
  30	 139	  80.0	 80.0	 5	0	 2	0	0	0	0	0	0	0	#_SizeSel_P_1_F3_LL3(3)
 -12	   4	  -2.2	 -2.2	99	0	-4	0	0	0	0	0	0	0	#_SizeSel_P_2_F3_LL3(3)
  -1	   9	   3.0	  3.0	 1	0	 3	0	0	0	0	0	0	0	#_SizeSel_P_3_F3_LL3(3)
  -1	   9	   4.3	  4.3	99	0	 4	0	0	0	0	0	0	0	#_SizeSel_P_4_F3_LL3(3)
-999	-600	-999.0	 -5.0	99	0	-2	0	0	0	0	0	0	0	#_SizeSel_P_5_F3_LL3(3)
 -15	   6	  -5.0	 -5.0	99	0	 5	0	0	0	0	0	0	0	#_SizeSel_P_6_F3_LL3(3)
  30	 139	  62.0	 62.0	 2	6	 5	0	0	0	0	0	0	0	#_SizeSel_P_1_F5_DN3(5)
  -9	   4	  -2.2	 -2.2	99	0	-4	0	0	0	0	0	0	0	#_SizeSel_P_2_F5_DN3(5)
  -1	   9	   3.0	  3.0	 2	0	 6	0	0	0	0	0	0	0	#_SizeSel_P_3_F5_DN3(5)
  -1	   9	   4.3	  4.3	 2	0	 6	0	0	0	0	0	0	0	#_SizeSel_P_4_F5_DN3(5)
-999	-600	-999.0	 -5.0	99	0	-2	0	0	0	0	0	0	0	#_SizeSel_P_5_F5_DN3(5)
-999	-600	-999.0	 -5.0	99	0	-2	0	0	0	0	0	0	0	#_SizeSel_P_6_F5_DN3(5)
  30	 139	 100.0	100.0	 5	0	 2	0	0	0	0	0	0	0	#_SizeSel_P_1_F7_PS1(7)
  -9	   4	  -8.0	 -8.0	99	0	 4	0	0	0	0	0	0	0	#_SizeSel_P_2_F7_PS1(7)
  -1	   9	   4.0	  4.0	 1	0	 3	0	0	0	0	0	0	0	#_SizeSel_P_3_F7_PS1(7)
  -1	   9	   4.0	  4.0	99	0	-4	0	0	0	0	0	0	0	#_SizeSel_P_4_F7_PS1(7)
-999	-600	-999.0	 -5.0	99	0	-2	0	0	0	0	0	0	0	#_SizeSel_P_5_F7_PS1(7)
 -15	  10	   5.0	  5.0	 2	0	-2	0	0	0	0	0	0	0	#_SizeSel_P_6_F7_PS1(7)
#_AgeSelex
#_No age_selex_parm
#_no timevary selex parameters
#
0 #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
# Tag loss and Tag reporting parameters go next
0 # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# Input variance adjustments factors: 
#_Factor	Fleet	Value
    1	12	0.15	#_Variance_adjustment_list1 
    1	13	0.15	#_Variance_adjustment_list2 
    1	14	0.15	#_Variance_adjustment_list3 
    1	15	0.15	#_Variance_adjustment_list4 
    4	 1	0.50	#_Variance_adjustment_list5 
    4	 2	0.50	#_Variance_adjustment_list6 
    4	 3	0.50	#_Variance_adjustment_list7 
    4	 4	0.50	#_Variance_adjustment_list8 
    4	 5	0.50	#_Variance_adjustment_list9 
    4	 6	0.50	#_Variance_adjustment_list10
    4	 7	0.50	#_Variance_adjustment_list11
    4	 8	0.50	#_Variance_adjustment_list12
    4	 9	0.00	#_Variance_adjustment_list13
    4	10	0.50	#_Variance_adjustment_list14
    4	11	0.50	#_Variance_adjustment_list15
    4	12	0.50	#_Variance_adjustment_list16
    4	13	0.50	#_Variance_adjustment_list17
    4	14	0.50	#_Variance_adjustment_list18
    4	15	0.50	#_Variance_adjustment_list19
    4	16	0.50	#_Variance_adjustment_list20
    4	17	0.50	#_Variance_adjustment_list21
    4	18	0.50	#_Variance_adjustment_list22
    4	19	0.50	#_Variance_adjustment_list23
    4	20	0.50	#_Variance_adjustment_list24
-9999	 0	0.00	#_terminator                
#
4 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 30 changes to default Lambdas (default value is 1.0)
#_like_comp	fleet	phase	value	sizefreq_method
    1	12	1	0.00	1	#_Surv_LLCPUE1_Phz1                    
    1	13	1	0.00	1	#_Surv_LLCPUE2_Phz1                    
    1	14	1	1.00	1	#_Surv_LLCPUE3_Phz1                    
    1	15	1	0.00	1	#_Surv_LLCPUE4_Phz1                    
    1	17	1	0.00	1	#_Surv_LLCPUE1early_Phz1               
    1	18	1	0.00	1	#_Surv_LLCPUE2early_Phz1               
    1	19	1	0.00	1	#_Surv_LLCPUE3early_Phz1               
    1	20	1	0.00	1	#_Surv_LLCPUE4early_Phz1               
    7	 3	1	0.00	1	#_SizeAge_F3_LL3_sizefreq_method_1_Phz1
    5	 1	1	0.00	1	#_age_F1_LL1_Phz1                      
    5	 2	1	0.00	1	#_age_F2_LL2_Phz1                      
    5	 3	1	0.00	1	#_age_F3_LL3_Phz1                      
    5	 4	1	0.00	1	#_age_F4_LL4_Phz1                      
    5	 5	1	0.00	1	#_age_F5_DN3_Phz1                      
    5	 6	1	0.00	1	#_age_F6_DN4_Phz1                      
    5	 7	1	0.00	1	#_age_F7_PS1_Phz1                      
    5	 8	1	0.00	1	#_age_F8_Other1_Phz1                   
    5	 9	1	0.00	1	#_age_F9_Other2_Phz1                   
    5	10	1	0.00	1	#_age_F10_Other3_Phz1                  
    5	11	1	0.00	1	#_age_F11_Other4_Phz1                  
    5	12	1	0.00	1	#_age_LLCPUE1_Phz1                     
    5	13	1	0.00	1	#_age_LLCPUE2_Phz1                     
    5	14	1	0.00	1	#_age_LLCPUE3_Phz1                     
    5	15	1	0.00	1	#_age_LLCPUE4_Phz1                     
    5	16	1	0.00	1	#_age_DNCPUE4_Phz1                     
    4	 1	1	0.01	1	#_length_F1_LL1_sizefreq_method_1_Phz1 
    4	 2	1	0.01	1	#_length_F2_LL2_sizefreq_method_1_Phz1 
    4	 3	1	0.01	1	#_length_F3_LL3_sizefreq_method_1_Phz1 
    4	 4	1	0.01	1	#_length_F4_LL4_sizefreq_method_1_Phz1 
    4	 7	1	0.01	1	#_length_F7_PS1_sizefreq_method_1_Phz1 
-9999	 0	0	0.00	0	#_terminator                           
#
0 # 0/1 read specs for more stddev reporting
#
999
