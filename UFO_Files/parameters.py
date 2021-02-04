# ----------------------------------------------------------------------  
# This model file was automatically created by SARAH version4.13.0 
# SARAH References: arXiv:0806.0538, arXiv:0909.2863, arXiv:1002.0840    
# (c) Florian Staub, 2011  
# ----------------------------------------------------------------------  
# File created at 13:47 on 27.2.2020   
# ----------------------------------------------------------------------  
 
 
from object_library import all_parameters,Parameter 
 
from function_library import complexconjugate,re,im,csc,sec,acsc,asec 
 
ZERO=Parameter(name='ZERO', 
                      nature='internal', 
                      type='real', 
                      value='0.0', 
                      texname='0') 
 
Mgo = 	 Parameter(name = 'Mgo', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mgo}', 
	 lhablock = 'MASS', 
	 lhacode = [1000021]) 
 
Wgo = 	 Parameter(name = 'Wgo', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wgo}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000021]) 
 
MN1 = 	 Parameter(name = 'MN1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MN1}', 
	 lhablock = 'MASS', 
	 lhacode = [1000022]) 
 
WN1 = 	 Parameter(name = 'WN1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WN1}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000022]) 
 
MN2 = 	 Parameter(name = 'MN2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MN2}', 
	 lhablock = 'MASS', 
	 lhacode = [1000023]) 
 
WN2 = 	 Parameter(name = 'WN2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WN2}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000023]) 
 
MN3 = 	 Parameter(name = 'MN3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MN3}', 
	 lhablock = 'MASS', 
	 lhacode = [1000025]) 
 
WN3 = 	 Parameter(name = 'WN3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WN3}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000025]) 
 
MN4 = 	 Parameter(name = 'MN4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MN4}', 
	 lhablock = 'MASS', 
	 lhacode = [1000035]) 
 
WN4 = 	 Parameter(name = 'WN4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WN4}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000035]) 
 
MN5 = 	 Parameter(name = 'MN5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MN5}', 
	 lhablock = 'MASS', 
	 lhacode = [1000045]) 
 
WN5 = 	 Parameter(name = 'WN5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WN5}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000045]) 
 
MN6 = 	 Parameter(name = 'MN6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MN6}', 
	 lhablock = 'MASS', 
	 lhacode = [1000055]) 
 
WN6 = 	 Parameter(name = 'WN6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WN6}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000055]) 
 
MN7 = 	 Parameter(name = 'MN7', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MN7}', 
	 lhablock = 'MASS', 
	 lhacode = [1000065]) 
 
WN7 = 	 Parameter(name = 'WN7', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WN7}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000065]) 
 
MN8 = 	 Parameter(name = 'MN8', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MN8}', 
	 lhablock = 'MASS', 
	 lhacode = [1000075]) 
 
WN8 = 	 Parameter(name = 'WN8', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WN8}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000075]) 
 
MN9 = 	 Parameter(name = 'MN9', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MN9}', 
	 lhablock = 'MASS', 
	 lhacode = [1000085]) 
 
WN9 = 	 Parameter(name = 'WN9', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WN9}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000085]) 
 
MC1 = 	 Parameter(name = 'MC1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MC1}', 
	 lhablock = 'MASS', 
	 lhacode = [1000024]) 
 
WC1 = 	 Parameter(name = 'WC1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WC1}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000024]) 
 
MC2 = 	 Parameter(name = 'MC2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MC2}', 
	 lhablock = 'MASS', 
	 lhacode = [1000037]) 
 
WC2 = 	 Parameter(name = 'WC2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WC2}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000037]) 
 
Me1 = 	 Parameter(name = 'Me1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.000511, 
	 texname = '\\text{Me1}', 
	 lhablock = 'MASS', 
	 lhacode = [11]) 
 
Me2 = 	 Parameter(name = 'Me2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.105, 
	 texname = '\\text{Me2}', 
	 lhablock = 'MASS', 
	 lhacode = [13]) 
 
Me3 = 	 Parameter(name = 'Me3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1.776, 
	 texname = '\\text{Me3}', 
	 lhablock = 'MASS', 
	 lhacode = [15]) 
 
Md1 = 	 Parameter(name = 'Md1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.0035, 
	 texname = '\\text{Md1}', 
	 lhablock = 'MASS', 
	 lhacode = [1]) 
 
Md2 = 	 Parameter(name = 'Md2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.104, 
	 texname = '\\text{Md2}', 
	 lhablock = 'MASS', 
	 lhacode = [3]) 
 
Md3 = 	 Parameter(name = 'Md3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 4.2, 
	 texname = '\\text{Md3}', 
	 lhablock = 'MASS', 
	 lhacode = [5]) 
 
Mu1 = 	 Parameter(name = 'Mu1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.0015, 
	 texname = '\\text{Mu1}', 
	 lhablock = 'MASS', 
	 lhacode = [2]) 
 
Mu2 = 	 Parameter(name = 'Mu2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1.27, 
	 texname = '\\text{Mu2}', 
	 lhablock = 'MASS', 
	 lhacode = [4]) 
 
Mu3 = 	 Parameter(name = 'Mu3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 171.2, 
	 texname = '\\text{Mu3}', 
	 lhablock = 'MASS', 
	 lhacode = [6]) 
 
Wu3 = 	 Parameter(name = 'Wu3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1.51, 
	 texname = '\\text{Wu3}', 
	 lhablock = 'DECAY', 
	 lhacode = [6]) 
 
Msd1 = 	 Parameter(name = 'Msd1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msd1}', 
	 lhablock = 'MASS', 
	 lhacode = [1000001]) 
 
Wsd1 = 	 Parameter(name = 'Wsd1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsd1}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000001]) 
 
Msd2 = 	 Parameter(name = 'Msd2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msd2}', 
	 lhablock = 'MASS', 
	 lhacode = [1000003]) 
 
Wsd2 = 	 Parameter(name = 'Wsd2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsd2}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000003]) 
 
Msd3 = 	 Parameter(name = 'Msd3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msd3}', 
	 lhablock = 'MASS', 
	 lhacode = [1000005]) 
 
Wsd3 = 	 Parameter(name = 'Wsd3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsd3}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000005]) 
 
Msd4 = 	 Parameter(name = 'Msd4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msd4}', 
	 lhablock = 'MASS', 
	 lhacode = [2000001]) 
 
Wsd4 = 	 Parameter(name = 'Wsd4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsd4}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000001]) 
 
Msd5 = 	 Parameter(name = 'Msd5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msd5}', 
	 lhablock = 'MASS', 
	 lhacode = [2000003]) 
 
Wsd5 = 	 Parameter(name = 'Wsd5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsd5}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000003]) 
 
Msd6 = 	 Parameter(name = 'Msd6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msd6}', 
	 lhablock = 'MASS', 
	 lhacode = [2000005]) 
 
Wsd6 = 	 Parameter(name = 'Wsd6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsd6}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000005]) 
 
Msv1 = 	 Parameter(name = 'Msv1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msv1}', 
	 lhablock = 'MASS', 
	 lhacode = [1000012]) 
 
Wsv1 = 	 Parameter(name = 'Wsv1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsv1}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000012]) 
 
Msv2 = 	 Parameter(name = 'Msv2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msv2}', 
	 lhablock = 'MASS', 
	 lhacode = [1000014]) 
 
Wsv2 = 	 Parameter(name = 'Wsv2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsv2}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000014]) 
 
Msv3 = 	 Parameter(name = 'Msv3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msv3}', 
	 lhablock = 'MASS', 
	 lhacode = [1000016]) 
 
Wsv3 = 	 Parameter(name = 'Wsv3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsv3}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000016]) 
 
Msv4 = 	 Parameter(name = 'Msv4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msv4}', 
	 lhablock = 'MASS', 
	 lhacode = [2000012]) 
 
Wsv4 = 	 Parameter(name = 'Wsv4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsv4}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000012]) 
 
Msv5 = 	 Parameter(name = 'Msv5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msv5}', 
	 lhablock = 'MASS', 
	 lhacode = [2000014]) 
 
Wsv5 = 	 Parameter(name = 'Wsv5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsv5}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000014]) 
 
Msv6 = 	 Parameter(name = 'Msv6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msv6}', 
	 lhablock = 'MASS', 
	 lhacode = [2000016]) 
 
Wsv6 = 	 Parameter(name = 'Wsv6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsv6}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000016]) 
 
Msu1 = 	 Parameter(name = 'Msu1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msu1}', 
	 lhablock = 'MASS', 
	 lhacode = [1000002]) 
 
Wsu1 = 	 Parameter(name = 'Wsu1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsu1}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000002]) 
 
Msu2 = 	 Parameter(name = 'Msu2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msu2}', 
	 lhablock = 'MASS', 
	 lhacode = [1000004]) 
 
Wsu2 = 	 Parameter(name = 'Wsu2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsu2}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000004]) 
 
Msu3 = 	 Parameter(name = 'Msu3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msu3}', 
	 lhablock = 'MASS', 
	 lhacode = [1000006]) 
 
Wsu3 = 	 Parameter(name = 'Wsu3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsu3}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000006]) 
 
Msu4 = 	 Parameter(name = 'Msu4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msu4}', 
	 lhablock = 'MASS', 
	 lhacode = [2000002]) 
 
Wsu4 = 	 Parameter(name = 'Wsu4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsu4}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000002]) 
 
Msu5 = 	 Parameter(name = 'Msu5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msu5}', 
	 lhablock = 'MASS', 
	 lhacode = [2000004]) 
 
Wsu5 = 	 Parameter(name = 'Wsu5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsu5}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000004]) 
 
Msu6 = 	 Parameter(name = 'Msu6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Msu6}', 
	 lhablock = 'MASS', 
	 lhacode = [2000006]) 
 
Wsu6 = 	 Parameter(name = 'Wsu6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wsu6}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000006]) 
 
Mse1 = 	 Parameter(name = 'Mse1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mse1}', 
	 lhablock = 'MASS', 
	 lhacode = [1000011]) 
 
Wse1 = 	 Parameter(name = 'Wse1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wse1}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000011]) 
 
Mse2 = 	 Parameter(name = 'Mse2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mse2}', 
	 lhablock = 'MASS', 
	 lhacode = [1000013]) 
 
Wse2 = 	 Parameter(name = 'Wse2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wse2}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000013]) 
 
Mse3 = 	 Parameter(name = 'Mse3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mse3}', 
	 lhablock = 'MASS', 
	 lhacode = [1000015]) 
 
Wse3 = 	 Parameter(name = 'Wse3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wse3}', 
	 lhablock = 'DECAY', 
	 lhacode = [1000015]) 
 
Mse4 = 	 Parameter(name = 'Mse4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mse4}', 
	 lhablock = 'MASS', 
	 lhacode = [2000011]) 
 
Wse4 = 	 Parameter(name = 'Wse4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wse4}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000011]) 
 
Mse5 = 	 Parameter(name = 'Mse5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mse5}', 
	 lhablock = 'MASS', 
	 lhacode = [2000013]) 
 
Wse5 = 	 Parameter(name = 'Wse5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wse5}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000013]) 
 
Mse6 = 	 Parameter(name = 'Mse6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mse6}', 
	 lhablock = 'MASS', 
	 lhacode = [2000015]) 
 
Wse6 = 	 Parameter(name = 'Wse6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wse6}', 
	 lhablock = 'DECAY', 
	 lhacode = [2000015]) 
 
Mh1 = 	 Parameter(name = 'Mh1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mh1}', 
	 lhablock = 'MASS', 
	 lhacode = [25]) 
 
Wh1 = 	 Parameter(name = 'Wh1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wh1}', 
	 lhablock = 'DECAY', 
	 lhacode = [25]) 
 
Mh2 = 	 Parameter(name = 'Mh2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mh2}', 
	 lhablock = 'MASS', 
	 lhacode = [35]) 
 
Wh2 = 	 Parameter(name = 'Wh2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wh2}', 
	 lhablock = 'DECAY', 
	 lhacode = [35]) 
 
Mh3 = 	 Parameter(name = 'Mh3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mh3}', 
	 lhablock = 'MASS', 
	 lhacode = [45]) 
 
Wh3 = 	 Parameter(name = 'Wh3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wh3}', 
	 lhablock = 'DECAY', 
	 lhacode = [45]) 
 
Mh4 = 	 Parameter(name = 'Mh4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mh4}', 
	 lhablock = 'MASS', 
	 lhacode = [55]) 
 
Wh4 = 	 Parameter(name = 'Wh4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wh4}', 
	 lhablock = 'DECAY', 
	 lhacode = [55]) 
 
Mh5 = 	 Parameter(name = 'Mh5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mh5}', 
	 lhablock = 'MASS', 
	 lhacode = [65]) 
 
Wh5 = 	 Parameter(name = 'Wh5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wh5}', 
	 lhablock = 'DECAY', 
	 lhacode = [65]) 
 
Mh6 = 	 Parameter(name = 'Mh6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{Mh6}', 
	 lhablock = 'MASS', 
	 lhacode = [75]) 
 
Wh6 = 	 Parameter(name = 'Wh6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Wh6}', 
	 lhablock = 'DECAY', 
	 lhacode = [75]) 
 
MAh3 = 	 Parameter(name = 'MAh3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MAh3}', 
	 lhablock = 'MASS', 
	 lhacode = [36]) 
 
WAh3 = 	 Parameter(name = 'WAh3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WAh3}', 
	 lhablock = 'DECAY', 
	 lhacode = [36]) 
 
MAh4 = 	 Parameter(name = 'MAh4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MAh4}', 
	 lhablock = 'MASS', 
	 lhacode = [46]) 
 
WAh4 = 	 Parameter(name = 'WAh4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WAh4}', 
	 lhablock = 'DECAY', 
	 lhacode = [46]) 
 
MAh5 = 	 Parameter(name = 'MAh5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MAh5}', 
	 lhablock = 'MASS', 
	 lhacode = [56]) 
 
WAh5 = 	 Parameter(name = 'WAh5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WAh5}', 
	 lhablock = 'DECAY', 
	 lhacode = [56]) 
 
MAh6 = 	 Parameter(name = 'MAh6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MAh6}', 
	 lhablock = 'MASS', 
	 lhacode = [66]) 
 
WAh6 = 	 Parameter(name = 'WAh6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WAh6}', 
	 lhablock = 'DECAY', 
	 lhacode = [66]) 
 
MHm2 = 	 Parameter(name = 'MHm2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MHm2}', 
	 lhablock = 'MASS', 
	 lhacode = [37]) 
 
WHm2 = 	 Parameter(name = 'WHm2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WHm2}', 
	 lhablock = 'DECAY', 
	 lhacode = [37]) 
 
MZ = 	 Parameter(name = 'MZ', 
	 nature = 'external', 
	 type = 'real', 
	 value = 91.1876, 
	 texname = '\\text{MZ}', 
	 lhablock = 'MASS', 
	 lhacode = [23]) 
 
WZ = 	 Parameter(name = 'WZ', 
	 nature = 'external', 
	 type = 'real', 
	 value = 2.4952, 
	 texname = '\\text{WZ}', 
	 lhablock = 'DECAY', 
	 lhacode = [23]) 
 
MZp = 	 Parameter(name = 'MZp', 
	 nature = 'external', 
	 type = 'real', 
	 value = 100., 
	 texname = '\\text{MZp}', 
	 lhablock = 'MASS', 
	 lhacode = [31]) 
 
WZp = 	 Parameter(name = 'WZp', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{WZp}', 
	 lhablock = 'DECAY', 
	 lhacode = [31]) 
 
WWm = 	 Parameter(name = 'WWm', 
	 nature = 'external', 
	 type = 'real', 
	 value = 2.141, 
	 texname = '\\text{WWm}', 
	 lhablock = 'DECAY', 
	 lhacode = [24]) 
 
gp = 	 Parameter(name='gp', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{gp}', 
	 lhablock = 'GAUGE', 
	 lhacode = [5] ) 
 
Qq = 	 Parameter(name='Qq', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Qq}', 
	 lhablock = 'XCHARGE', 
	 lhacode = [1] ) 
 
Ql = 	 Parameter(name='Ql', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ql}', 
	 lhablock = 'XCHARGE', 
	 lhacode = [2] ) 
 
QHd = 	 Parameter(name='QHd', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{QHd}', 
	 lhablock = 'XCHARGE', 
	 lhacode = [4] ) 
 
QHu = 	 Parameter(name='QHu', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{QHu}', 
	 lhablock = 'XCHARGE', 
	 lhacode = [3] ) 
 
Qd = 	 Parameter(name='Qd', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Qd}', 
	 lhablock = 'XCHARGE', 
	 lhacode = [5] ) 
 
Qu = 	 Parameter(name='Qu', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Qu}', 
	 lhablock = 'XCHARGE', 
	 lhacode = [6] ) 
 
Qe = 	 Parameter(name='Qe', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Qe}', 
	 lhablock = 'XCHARGE', 
	 lhacode = [7] ) 
 
Qs = 	 Parameter(name='Qs', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Qs}', 
	 lhablock = 'XCHARGE', 
	 lhacode = [8] ) 
 
Qs1 = 	 Parameter(name='Qs1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Qs1}', 
	 lhablock = 'XCHARGE', 
	 lhacode = [9] ) 
 
Qs2 = 	 Parameter(name='Qs2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Qs2}', 
	 lhablock = 'XCHARGE', 
	 lhacode = [10] ) 
 
Qs3 = 	 Parameter(name='Qs3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Qs3}', 
	 lhablock = 'XCHARGE', 
	 lhacode = [11] ) 
 
Qv = 	 Parameter(name='Qv', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Qv}', 
	 lhablock = 'XCHARGE', 
	 lhacode = [12] ) 
 
rYd11 = 	 Parameter(name='rYd11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd11}', 
	 lhablock = 'YD', 
	 lhacode = [1, 1] ) 
 
iYd11 = 	 Parameter(name='iYd11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd11}', 
	 lhablock = 'IMYD', 
	 lhacode = [1, 1] ) 
 
rYd12 = 	 Parameter(name='rYd12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd12}', 
	 lhablock = 'YD', 
	 lhacode = [1, 2] ) 
 
iYd12 = 	 Parameter(name='iYd12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd12}', 
	 lhablock = 'IMYD', 
	 lhacode = [1, 2] ) 
 
rYd13 = 	 Parameter(name='rYd13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd13}', 
	 lhablock = 'YD', 
	 lhacode = [1, 3] ) 
 
iYd13 = 	 Parameter(name='iYd13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd13}', 
	 lhablock = 'IMYD', 
	 lhacode = [1, 3] ) 
 
rYd21 = 	 Parameter(name='rYd21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd21}', 
	 lhablock = 'YD', 
	 lhacode = [2, 1] ) 
 
iYd21 = 	 Parameter(name='iYd21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd21}', 
	 lhablock = 'IMYD', 
	 lhacode = [2, 1] ) 
 
rYd22 = 	 Parameter(name='rYd22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd22}', 
	 lhablock = 'YD', 
	 lhacode = [2, 2] ) 
 
iYd22 = 	 Parameter(name='iYd22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd22}', 
	 lhablock = 'IMYD', 
	 lhacode = [2, 2] ) 
 
rYd23 = 	 Parameter(name='rYd23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd23}', 
	 lhablock = 'YD', 
	 lhacode = [2, 3] ) 
 
iYd23 = 	 Parameter(name='iYd23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd23}', 
	 lhablock = 'IMYD', 
	 lhacode = [2, 3] ) 
 
rYd31 = 	 Parameter(name='rYd31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd31}', 
	 lhablock = 'YD', 
	 lhacode = [3, 1] ) 
 
iYd31 = 	 Parameter(name='iYd31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd31}', 
	 lhablock = 'IMYD', 
	 lhacode = [3, 1] ) 
 
rYd32 = 	 Parameter(name='rYd32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd32}', 
	 lhablock = 'YD', 
	 lhacode = [3, 2] ) 
 
iYd32 = 	 Parameter(name='iYd32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd32}', 
	 lhablock = 'IMYD', 
	 lhacode = [3, 2] ) 
 
rYd33 = 	 Parameter(name='rYd33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd33}', 
	 lhablock = 'YD', 
	 lhacode = [3, 3] ) 
 
iYd33 = 	 Parameter(name='iYd33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yd33}', 
	 lhablock = 'IMYD', 
	 lhacode = [3, 3] ) 
 
rTd11 = 	 Parameter(name='rTd11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td11}', 
	 lhablock = 'TD', 
	 lhacode = [1, 1] ) 
 
iTd11 = 	 Parameter(name='iTd11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td11}', 
	 lhablock = 'IMTD', 
	 lhacode = [1, 1] ) 
 
rTd12 = 	 Parameter(name='rTd12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td12}', 
	 lhablock = 'TD', 
	 lhacode = [1, 2] ) 
 
iTd12 = 	 Parameter(name='iTd12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td12}', 
	 lhablock = 'IMTD', 
	 lhacode = [1, 2] ) 
 
rTd13 = 	 Parameter(name='rTd13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td13}', 
	 lhablock = 'TD', 
	 lhacode = [1, 3] ) 
 
iTd13 = 	 Parameter(name='iTd13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td13}', 
	 lhablock = 'IMTD', 
	 lhacode = [1, 3] ) 
 
rTd21 = 	 Parameter(name='rTd21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td21}', 
	 lhablock = 'TD', 
	 lhacode = [2, 1] ) 
 
iTd21 = 	 Parameter(name='iTd21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td21}', 
	 lhablock = 'IMTD', 
	 lhacode = [2, 1] ) 
 
rTd22 = 	 Parameter(name='rTd22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td22}', 
	 lhablock = 'TD', 
	 lhacode = [2, 2] ) 
 
iTd22 = 	 Parameter(name='iTd22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td22}', 
	 lhablock = 'IMTD', 
	 lhacode = [2, 2] ) 
 
rTd23 = 	 Parameter(name='rTd23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td23}', 
	 lhablock = 'TD', 
	 lhacode = [2, 3] ) 
 
iTd23 = 	 Parameter(name='iTd23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td23}', 
	 lhablock = 'IMTD', 
	 lhacode = [2, 3] ) 
 
rTd31 = 	 Parameter(name='rTd31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td31}', 
	 lhablock = 'TD', 
	 lhacode = [3, 1] ) 
 
iTd31 = 	 Parameter(name='iTd31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td31}', 
	 lhablock = 'IMTD', 
	 lhacode = [3, 1] ) 
 
rTd32 = 	 Parameter(name='rTd32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td32}', 
	 lhablock = 'TD', 
	 lhacode = [3, 2] ) 
 
iTd32 = 	 Parameter(name='iTd32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td32}', 
	 lhablock = 'IMTD', 
	 lhacode = [3, 2] ) 
 
rTd33 = 	 Parameter(name='rTd33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td33}', 
	 lhablock = 'TD', 
	 lhacode = [3, 3] ) 
 
iTd33 = 	 Parameter(name='iTd33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Td33}', 
	 lhablock = 'IMTD', 
	 lhacode = [3, 3] ) 
 
rYe11 = 	 Parameter(name='rYe11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye11}', 
	 lhablock = 'YE', 
	 lhacode = [1, 1] ) 
 
iYe11 = 	 Parameter(name='iYe11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye11}', 
	 lhablock = 'IMYE', 
	 lhacode = [1, 1] ) 
 
rYe12 = 	 Parameter(name='rYe12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye12}', 
	 lhablock = 'YE', 
	 lhacode = [1, 2] ) 
 
iYe12 = 	 Parameter(name='iYe12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye12}', 
	 lhablock = 'IMYE', 
	 lhacode = [1, 2] ) 
 
rYe13 = 	 Parameter(name='rYe13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye13}', 
	 lhablock = 'YE', 
	 lhacode = [1, 3] ) 
 
iYe13 = 	 Parameter(name='iYe13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye13}', 
	 lhablock = 'IMYE', 
	 lhacode = [1, 3] ) 
 
rYe21 = 	 Parameter(name='rYe21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye21}', 
	 lhablock = 'YE', 
	 lhacode = [2, 1] ) 
 
iYe21 = 	 Parameter(name='iYe21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye21}', 
	 lhablock = 'IMYE', 
	 lhacode = [2, 1] ) 
 
rYe22 = 	 Parameter(name='rYe22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye22}', 
	 lhablock = 'YE', 
	 lhacode = [2, 2] ) 
 
iYe22 = 	 Parameter(name='iYe22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye22}', 
	 lhablock = 'IMYE', 
	 lhacode = [2, 2] ) 
 
rYe23 = 	 Parameter(name='rYe23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye23}', 
	 lhablock = 'YE', 
	 lhacode = [2, 3] ) 
 
iYe23 = 	 Parameter(name='iYe23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye23}', 
	 lhablock = 'IMYE', 
	 lhacode = [2, 3] ) 
 
rYe31 = 	 Parameter(name='rYe31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye31}', 
	 lhablock = 'YE', 
	 lhacode = [3, 1] ) 
 
iYe31 = 	 Parameter(name='iYe31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye31}', 
	 lhablock = 'IMYE', 
	 lhacode = [3, 1] ) 
 
rYe32 = 	 Parameter(name='rYe32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye32}', 
	 lhablock = 'YE', 
	 lhacode = [3, 2] ) 
 
iYe32 = 	 Parameter(name='iYe32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye32}', 
	 lhablock = 'IMYE', 
	 lhacode = [3, 2] ) 
 
rYe33 = 	 Parameter(name='rYe33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye33}', 
	 lhablock = 'YE', 
	 lhacode = [3, 3] ) 
 
iYe33 = 	 Parameter(name='iYe33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Ye33}', 
	 lhablock = 'IMYE', 
	 lhacode = [3, 3] ) 
 
rTe11 = 	 Parameter(name='rTe11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te11}', 
	 lhablock = 'TE', 
	 lhacode = [1, 1] ) 
 
iTe11 = 	 Parameter(name='iTe11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te11}', 
	 lhablock = 'IMTE', 
	 lhacode = [1, 1] ) 
 
rTe12 = 	 Parameter(name='rTe12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te12}', 
	 lhablock = 'TE', 
	 lhacode = [1, 2] ) 
 
iTe12 = 	 Parameter(name='iTe12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te12}', 
	 lhablock = 'IMTE', 
	 lhacode = [1, 2] ) 
 
rTe13 = 	 Parameter(name='rTe13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te13}', 
	 lhablock = 'TE', 
	 lhacode = [1, 3] ) 
 
iTe13 = 	 Parameter(name='iTe13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te13}', 
	 lhablock = 'IMTE', 
	 lhacode = [1, 3] ) 
 
rTe21 = 	 Parameter(name='rTe21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te21}', 
	 lhablock = 'TE', 
	 lhacode = [2, 1] ) 
 
iTe21 = 	 Parameter(name='iTe21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te21}', 
	 lhablock = 'IMTE', 
	 lhacode = [2, 1] ) 
 
rTe22 = 	 Parameter(name='rTe22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te22}', 
	 lhablock = 'TE', 
	 lhacode = [2, 2] ) 
 
iTe22 = 	 Parameter(name='iTe22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te22}', 
	 lhablock = 'IMTE', 
	 lhacode = [2, 2] ) 
 
rTe23 = 	 Parameter(name='rTe23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te23}', 
	 lhablock = 'TE', 
	 lhacode = [2, 3] ) 
 
iTe23 = 	 Parameter(name='iTe23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te23}', 
	 lhablock = 'IMTE', 
	 lhacode = [2, 3] ) 
 
rTe31 = 	 Parameter(name='rTe31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te31}', 
	 lhablock = 'TE', 
	 lhacode = [3, 1] ) 
 
iTe31 = 	 Parameter(name='iTe31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te31}', 
	 lhablock = 'IMTE', 
	 lhacode = [3, 1] ) 
 
rTe32 = 	 Parameter(name='rTe32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te32}', 
	 lhablock = 'TE', 
	 lhacode = [3, 2] ) 
 
iTe32 = 	 Parameter(name='iTe32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te32}', 
	 lhablock = 'IMTE', 
	 lhacode = [3, 2] ) 
 
rTe33 = 	 Parameter(name='rTe33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te33}', 
	 lhablock = 'TE', 
	 lhacode = [3, 3] ) 
 
iTe33 = 	 Parameter(name='iTe33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Te33}', 
	 lhablock = 'IMTE', 
	 lhacode = [3, 3] ) 
 
rlam = 	 Parameter(name='rlam', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{lam}', 
	 lhablock = 'NMSSMRUN', 
	 lhacode = [1] ) 
 
ilam = 	 Parameter(name='ilam', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{lam}', 
	 lhablock = 'IMNMSSMRUN', 
	 lhacode = [1] ) 
 
rTlam = 	 Parameter(name='rTlam', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tlam}', 
	 lhablock = 'NMSSMRUN', 
	 lhacode = [3] ) 
 
iTlam = 	 Parameter(name='iTlam', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tlam}', 
	 lhablock = 'IMNMSSMRUN', 
	 lhacode = [3] ) 
 
rYv11 = 	 Parameter(name='rYv11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv11}', 
	 lhablock = 'YV', 
	 lhacode = [1, 1] ) 
 
iYv11 = 	 Parameter(name='iYv11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv11}', 
	 lhablock = 'IMYV', 
	 lhacode = [1, 1] ) 
 
rYv12 = 	 Parameter(name='rYv12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv12}', 
	 lhablock = 'YV', 
	 lhacode = [1, 2] ) 
 
iYv12 = 	 Parameter(name='iYv12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv12}', 
	 lhablock = 'IMYV', 
	 lhacode = [1, 2] ) 
 
rYv13 = 	 Parameter(name='rYv13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv13}', 
	 lhablock = 'YV', 
	 lhacode = [1, 3] ) 
 
iYv13 = 	 Parameter(name='iYv13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv13}', 
	 lhablock = 'IMYV', 
	 lhacode = [1, 3] ) 
 
rYv21 = 	 Parameter(name='rYv21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv21}', 
	 lhablock = 'YV', 
	 lhacode = [2, 1] ) 
 
iYv21 = 	 Parameter(name='iYv21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv21}', 
	 lhablock = 'IMYV', 
	 lhacode = [2, 1] ) 
 
rYv22 = 	 Parameter(name='rYv22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv22}', 
	 lhablock = 'YV', 
	 lhacode = [2, 2] ) 
 
iYv22 = 	 Parameter(name='iYv22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv22}', 
	 lhablock = 'IMYV', 
	 lhacode = [2, 2] ) 
 
rYv23 = 	 Parameter(name='rYv23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv23}', 
	 lhablock = 'YV', 
	 lhacode = [2, 3] ) 
 
iYv23 = 	 Parameter(name='iYv23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv23}', 
	 lhablock = 'IMYV', 
	 lhacode = [2, 3] ) 
 
rYv31 = 	 Parameter(name='rYv31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv31}', 
	 lhablock = 'YV', 
	 lhacode = [3, 1] ) 
 
iYv31 = 	 Parameter(name='iYv31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv31}', 
	 lhablock = 'IMYV', 
	 lhacode = [3, 1] ) 
 
rYv32 = 	 Parameter(name='rYv32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv32}', 
	 lhablock = 'YV', 
	 lhacode = [3, 2] ) 
 
iYv32 = 	 Parameter(name='iYv32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv32}', 
	 lhablock = 'IMYV', 
	 lhacode = [3, 2] ) 
 
rYv33 = 	 Parameter(name='rYv33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv33}', 
	 lhablock = 'YV', 
	 lhacode = [3, 3] ) 
 
iYv33 = 	 Parameter(name='iYv33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yv33}', 
	 lhablock = 'IMYV', 
	 lhacode = [3, 3] ) 
 
rTv11 = 	 Parameter(name='rTv11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv11}', 
	 lhablock = 'TV', 
	 lhacode = [1, 1] ) 
 
iTv11 = 	 Parameter(name='iTv11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv11}', 
	 lhablock = 'IMTV', 
	 lhacode = [1, 1] ) 
 
rTv12 = 	 Parameter(name='rTv12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv12}', 
	 lhablock = 'TV', 
	 lhacode = [1, 2] ) 
 
iTv12 = 	 Parameter(name='iTv12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv12}', 
	 lhablock = 'IMTV', 
	 lhacode = [1, 2] ) 
 
rTv13 = 	 Parameter(name='rTv13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv13}', 
	 lhablock = 'TV', 
	 lhacode = [1, 3] ) 
 
iTv13 = 	 Parameter(name='iTv13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv13}', 
	 lhablock = 'IMTV', 
	 lhacode = [1, 3] ) 
 
rTv21 = 	 Parameter(name='rTv21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv21}', 
	 lhablock = 'TV', 
	 lhacode = [2, 1] ) 
 
iTv21 = 	 Parameter(name='iTv21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv21}', 
	 lhablock = 'IMTV', 
	 lhacode = [2, 1] ) 
 
rTv22 = 	 Parameter(name='rTv22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv22}', 
	 lhablock = 'TV', 
	 lhacode = [2, 2] ) 
 
iTv22 = 	 Parameter(name='iTv22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv22}', 
	 lhablock = 'IMTV', 
	 lhacode = [2, 2] ) 
 
rTv23 = 	 Parameter(name='rTv23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv23}', 
	 lhablock = 'TV', 
	 lhacode = [2, 3] ) 
 
iTv23 = 	 Parameter(name='iTv23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv23}', 
	 lhablock = 'IMTV', 
	 lhacode = [2, 3] ) 
 
rTv31 = 	 Parameter(name='rTv31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv31}', 
	 lhablock = 'TV', 
	 lhacode = [3, 1] ) 
 
iTv31 = 	 Parameter(name='iTv31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv31}', 
	 lhablock = 'IMTV', 
	 lhacode = [3, 1] ) 
 
rTv32 = 	 Parameter(name='rTv32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv32}', 
	 lhablock = 'TV', 
	 lhacode = [3, 2] ) 
 
iTv32 = 	 Parameter(name='iTv32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv32}', 
	 lhablock = 'IMTV', 
	 lhacode = [3, 2] ) 
 
rTv33 = 	 Parameter(name='rTv33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv33}', 
	 lhablock = 'TV', 
	 lhacode = [3, 3] ) 
 
iTv33 = 	 Parameter(name='iTv33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tv33}', 
	 lhablock = 'IMTV', 
	 lhacode = [3, 3] ) 
 
rkap = 	 Parameter(name='rkap', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{kap}', 
	 lhablock = 'NMSSMRUN', 
	 lhacode = [2] ) 
 
ikap = 	 Parameter(name='ikap', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{kap}', 
	 lhablock = 'IMNMSSMRUN', 
	 lhacode = [2] ) 
 
rTk = 	 Parameter(name='rTk', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tk}', 
	 lhablock = 'NMSSMRUN', 
	 lhacode = [4] ) 
 
iTk = 	 Parameter(name='iTk', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tk}', 
	 lhablock = 'IMNMSSMRUN', 
	 lhacode = [4] ) 
 
rYu11 = 	 Parameter(name='rYu11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu11}', 
	 lhablock = 'YU', 
	 lhacode = [1, 1] ) 
 
iYu11 = 	 Parameter(name='iYu11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu11}', 
	 lhablock = 'IMYU', 
	 lhacode = [1, 1] ) 
 
rYu12 = 	 Parameter(name='rYu12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu12}', 
	 lhablock = 'YU', 
	 lhacode = [1, 2] ) 
 
iYu12 = 	 Parameter(name='iYu12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu12}', 
	 lhablock = 'IMYU', 
	 lhacode = [1, 2] ) 
 
rYu13 = 	 Parameter(name='rYu13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu13}', 
	 lhablock = 'YU', 
	 lhacode = [1, 3] ) 
 
iYu13 = 	 Parameter(name='iYu13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu13}', 
	 lhablock = 'IMYU', 
	 lhacode = [1, 3] ) 
 
rYu21 = 	 Parameter(name='rYu21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu21}', 
	 lhablock = 'YU', 
	 lhacode = [2, 1] ) 
 
iYu21 = 	 Parameter(name='iYu21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu21}', 
	 lhablock = 'IMYU', 
	 lhacode = [2, 1] ) 
 
rYu22 = 	 Parameter(name='rYu22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu22}', 
	 lhablock = 'YU', 
	 lhacode = [2, 2] ) 
 
iYu22 = 	 Parameter(name='iYu22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu22}', 
	 lhablock = 'IMYU', 
	 lhacode = [2, 2] ) 
 
rYu23 = 	 Parameter(name='rYu23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu23}', 
	 lhablock = 'YU', 
	 lhacode = [2, 3] ) 
 
iYu23 = 	 Parameter(name='iYu23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu23}', 
	 lhablock = 'IMYU', 
	 lhacode = [2, 3] ) 
 
rYu31 = 	 Parameter(name='rYu31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu31}', 
	 lhablock = 'YU', 
	 lhacode = [3, 1] ) 
 
iYu31 = 	 Parameter(name='iYu31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu31}', 
	 lhablock = 'IMYU', 
	 lhacode = [3, 1] ) 
 
rYu32 = 	 Parameter(name='rYu32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu32}', 
	 lhablock = 'YU', 
	 lhacode = [3, 2] ) 
 
iYu32 = 	 Parameter(name='iYu32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu32}', 
	 lhablock = 'IMYU', 
	 lhacode = [3, 2] ) 
 
rYu33 = 	 Parameter(name='rYu33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu33}', 
	 lhablock = 'YU', 
	 lhacode = [3, 3] ) 
 
iYu33 = 	 Parameter(name='iYu33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Yu33}', 
	 lhablock = 'IMYU', 
	 lhacode = [3, 3] ) 
 
rTu11 = 	 Parameter(name='rTu11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu11}', 
	 lhablock = 'TU', 
	 lhacode = [1, 1] ) 
 
iTu11 = 	 Parameter(name='iTu11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu11}', 
	 lhablock = 'IMTU', 
	 lhacode = [1, 1] ) 
 
rTu12 = 	 Parameter(name='rTu12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu12}', 
	 lhablock = 'TU', 
	 lhacode = [1, 2] ) 
 
iTu12 = 	 Parameter(name='iTu12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu12}', 
	 lhablock = 'IMTU', 
	 lhacode = [1, 2] ) 
 
rTu13 = 	 Parameter(name='rTu13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu13}', 
	 lhablock = 'TU', 
	 lhacode = [1, 3] ) 
 
iTu13 = 	 Parameter(name='iTu13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu13}', 
	 lhablock = 'IMTU', 
	 lhacode = [1, 3] ) 
 
rTu21 = 	 Parameter(name='rTu21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu21}', 
	 lhablock = 'TU', 
	 lhacode = [2, 1] ) 
 
iTu21 = 	 Parameter(name='iTu21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu21}', 
	 lhablock = 'IMTU', 
	 lhacode = [2, 1] ) 
 
rTu22 = 	 Parameter(name='rTu22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu22}', 
	 lhablock = 'TU', 
	 lhacode = [2, 2] ) 
 
iTu22 = 	 Parameter(name='iTu22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu22}', 
	 lhablock = 'IMTU', 
	 lhacode = [2, 2] ) 
 
rTu23 = 	 Parameter(name='rTu23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu23}', 
	 lhablock = 'TU', 
	 lhacode = [2, 3] ) 
 
iTu23 = 	 Parameter(name='iTu23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu23}', 
	 lhablock = 'IMTU', 
	 lhacode = [2, 3] ) 
 
rTu31 = 	 Parameter(name='rTu31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu31}', 
	 lhablock = 'TU', 
	 lhacode = [3, 1] ) 
 
iTu31 = 	 Parameter(name='iTu31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu31}', 
	 lhablock = 'IMTU', 
	 lhacode = [3, 1] ) 
 
rTu32 = 	 Parameter(name='rTu32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu32}', 
	 lhablock = 'TU', 
	 lhacode = [3, 2] ) 
 
iTu32 = 	 Parameter(name='iTu32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu32}', 
	 lhablock = 'IMTU', 
	 lhacode = [3, 2] ) 
 
rTu33 = 	 Parameter(name='rTu33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu33}', 
	 lhablock = 'TU', 
	 lhacode = [3, 3] ) 
 
iTu33 = 	 Parameter(name='iTu33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{Tu33}', 
	 lhablock = 'IMTU', 
	 lhacode = [3, 3] ) 
 
vS = 	 Parameter(name='vS', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{vS}', 
	 lhablock = 'NMSSMRUN', 
	 lhacode = [5] ) 
 
vS1 = 	 Parameter(name='vS1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{vS1}', 
	 lhablock = 'HMIX', 
	 lhacode = [200] ) 
 
vS2 = 	 Parameter(name='vS2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{vS2}', 
	 lhablock = 'HMIX', 
	 lhacode = [201] ) 
 
vS3 = 	 Parameter(name='vS3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{vS3}', 
	 lhablock = 'HMIX', 
	 lhacode = [202] ) 
 
rpG = 	 Parameter(name='rpG', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1., 
	 texname = '\\text{pG}', 
	 lhablock = 'PHASES', 
	 lhacode = [1] ) 
 
ipG = 	 Parameter(name='ipG', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{pG}', 
	 lhablock = 'IMPHASES', 
	 lhacode = [1] ) 
 
rZD11 = 	 Parameter(name='rZD11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD11}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [1, 1] ) 
 
iZD11 = 	 Parameter(name='iZD11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD11}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [1, 1] ) 
 
rZD12 = 	 Parameter(name='rZD12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD12}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [1, 2] ) 
 
iZD12 = 	 Parameter(name='iZD12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD12}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [1, 2] ) 
 
rZD13 = 	 Parameter(name='rZD13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD13}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [1, 3] ) 
 
iZD13 = 	 Parameter(name='iZD13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD13}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [1, 3] ) 
 
rZD14 = 	 Parameter(name='rZD14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD14}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [1, 4] ) 
 
iZD14 = 	 Parameter(name='iZD14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD14}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [1, 4] ) 
 
rZD15 = 	 Parameter(name='rZD15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD15}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [1, 5] ) 
 
iZD15 = 	 Parameter(name='iZD15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD15}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [1, 5] ) 
 
rZD16 = 	 Parameter(name='rZD16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD16}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [1, 6] ) 
 
iZD16 = 	 Parameter(name='iZD16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD16}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [1, 6] ) 
 
rZD21 = 	 Parameter(name='rZD21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD21}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [2, 1] ) 
 
iZD21 = 	 Parameter(name='iZD21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD21}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [2, 1] ) 
 
rZD22 = 	 Parameter(name='rZD22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD22}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [2, 2] ) 
 
iZD22 = 	 Parameter(name='iZD22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD22}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [2, 2] ) 
 
rZD23 = 	 Parameter(name='rZD23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD23}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [2, 3] ) 
 
iZD23 = 	 Parameter(name='iZD23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD23}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [2, 3] ) 
 
rZD24 = 	 Parameter(name='rZD24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD24}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [2, 4] ) 
 
iZD24 = 	 Parameter(name='iZD24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD24}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [2, 4] ) 
 
rZD25 = 	 Parameter(name='rZD25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD25}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [2, 5] ) 
 
iZD25 = 	 Parameter(name='iZD25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD25}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [2, 5] ) 
 
rZD26 = 	 Parameter(name='rZD26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD26}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [2, 6] ) 
 
iZD26 = 	 Parameter(name='iZD26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD26}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [2, 6] ) 
 
rZD31 = 	 Parameter(name='rZD31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD31}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [3, 1] ) 
 
iZD31 = 	 Parameter(name='iZD31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD31}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [3, 1] ) 
 
rZD32 = 	 Parameter(name='rZD32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD32}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [3, 2] ) 
 
iZD32 = 	 Parameter(name='iZD32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD32}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [3, 2] ) 
 
rZD33 = 	 Parameter(name='rZD33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD33}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [3, 3] ) 
 
iZD33 = 	 Parameter(name='iZD33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD33}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [3, 3] ) 
 
rZD34 = 	 Parameter(name='rZD34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD34}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [3, 4] ) 
 
iZD34 = 	 Parameter(name='iZD34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD34}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [3, 4] ) 
 
rZD35 = 	 Parameter(name='rZD35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD35}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [3, 5] ) 
 
iZD35 = 	 Parameter(name='iZD35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD35}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [3, 5] ) 
 
rZD36 = 	 Parameter(name='rZD36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD36}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [3, 6] ) 
 
iZD36 = 	 Parameter(name='iZD36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD36}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [3, 6] ) 
 
rZD41 = 	 Parameter(name='rZD41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD41}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [4, 1] ) 
 
iZD41 = 	 Parameter(name='iZD41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD41}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [4, 1] ) 
 
rZD42 = 	 Parameter(name='rZD42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD42}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [4, 2] ) 
 
iZD42 = 	 Parameter(name='iZD42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD42}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [4, 2] ) 
 
rZD43 = 	 Parameter(name='rZD43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD43}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [4, 3] ) 
 
iZD43 = 	 Parameter(name='iZD43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD43}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [4, 3] ) 
 
rZD44 = 	 Parameter(name='rZD44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD44}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [4, 4] ) 
 
iZD44 = 	 Parameter(name='iZD44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD44}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [4, 4] ) 
 
rZD45 = 	 Parameter(name='rZD45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD45}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [4, 5] ) 
 
iZD45 = 	 Parameter(name='iZD45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD45}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [4, 5] ) 
 
rZD46 = 	 Parameter(name='rZD46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD46}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [4, 6] ) 
 
iZD46 = 	 Parameter(name='iZD46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD46}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [4, 6] ) 
 
rZD51 = 	 Parameter(name='rZD51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD51}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [5, 1] ) 
 
iZD51 = 	 Parameter(name='iZD51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD51}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [5, 1] ) 
 
rZD52 = 	 Parameter(name='rZD52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD52}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [5, 2] ) 
 
iZD52 = 	 Parameter(name='iZD52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD52}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [5, 2] ) 
 
rZD53 = 	 Parameter(name='rZD53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD53}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [5, 3] ) 
 
iZD53 = 	 Parameter(name='iZD53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD53}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [5, 3] ) 
 
rZD54 = 	 Parameter(name='rZD54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD54}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [5, 4] ) 
 
iZD54 = 	 Parameter(name='iZD54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD54}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [5, 4] ) 
 
rZD55 = 	 Parameter(name='rZD55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD55}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [5, 5] ) 
 
iZD55 = 	 Parameter(name='iZD55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD55}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [5, 5] ) 
 
rZD56 = 	 Parameter(name='rZD56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD56}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [5, 6] ) 
 
iZD56 = 	 Parameter(name='iZD56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD56}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [5, 6] ) 
 
rZD61 = 	 Parameter(name='rZD61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD61}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [6, 1] ) 
 
iZD61 = 	 Parameter(name='iZD61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD61}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [6, 1] ) 
 
rZD62 = 	 Parameter(name='rZD62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD62}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [6, 2] ) 
 
iZD62 = 	 Parameter(name='iZD62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD62}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [6, 2] ) 
 
rZD63 = 	 Parameter(name='rZD63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD63}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [6, 3] ) 
 
iZD63 = 	 Parameter(name='iZD63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD63}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [6, 3] ) 
 
rZD64 = 	 Parameter(name='rZD64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD64}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [6, 4] ) 
 
iZD64 = 	 Parameter(name='iZD64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD64}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [6, 4] ) 
 
rZD65 = 	 Parameter(name='rZD65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD65}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [6, 5] ) 
 
iZD65 = 	 Parameter(name='iZD65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD65}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [6, 5] ) 
 
rZD66 = 	 Parameter(name='rZD66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD66}', 
	 lhablock = 'DSQMIX', 
	 lhacode = [6, 6] ) 
 
iZD66 = 	 Parameter(name='iZD66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZD66}', 
	 lhablock = 'IMDSQMIX', 
	 lhacode = [6, 6] ) 
 
rZV11 = 	 Parameter(name='rZV11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV11}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [1, 1] ) 
 
iZV11 = 	 Parameter(name='iZV11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV11}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [1, 1] ) 
 
rZV12 = 	 Parameter(name='rZV12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV12}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [1, 2] ) 
 
iZV12 = 	 Parameter(name='iZV12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV12}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [1, 2] ) 
 
rZV13 = 	 Parameter(name='rZV13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV13}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [1, 3] ) 
 
iZV13 = 	 Parameter(name='iZV13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV13}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [1, 3] ) 
 
rZV14 = 	 Parameter(name='rZV14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV14}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [1, 4] ) 
 
iZV14 = 	 Parameter(name='iZV14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV14}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [1, 4] ) 
 
rZV15 = 	 Parameter(name='rZV15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV15}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [1, 5] ) 
 
iZV15 = 	 Parameter(name='iZV15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV15}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [1, 5] ) 
 
rZV16 = 	 Parameter(name='rZV16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV16}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [1, 6] ) 
 
iZV16 = 	 Parameter(name='iZV16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV16}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [1, 6] ) 
 
rZV21 = 	 Parameter(name='rZV21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV21}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [2, 1] ) 
 
iZV21 = 	 Parameter(name='iZV21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV21}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [2, 1] ) 
 
rZV22 = 	 Parameter(name='rZV22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV22}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [2, 2] ) 
 
iZV22 = 	 Parameter(name='iZV22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV22}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [2, 2] ) 
 
rZV23 = 	 Parameter(name='rZV23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV23}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [2, 3] ) 
 
iZV23 = 	 Parameter(name='iZV23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV23}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [2, 3] ) 
 
rZV24 = 	 Parameter(name='rZV24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV24}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [2, 4] ) 
 
iZV24 = 	 Parameter(name='iZV24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV24}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [2, 4] ) 
 
rZV25 = 	 Parameter(name='rZV25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV25}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [2, 5] ) 
 
iZV25 = 	 Parameter(name='iZV25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV25}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [2, 5] ) 
 
rZV26 = 	 Parameter(name='rZV26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV26}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [2, 6] ) 
 
iZV26 = 	 Parameter(name='iZV26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV26}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [2, 6] ) 
 
rZV31 = 	 Parameter(name='rZV31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV31}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [3, 1] ) 
 
iZV31 = 	 Parameter(name='iZV31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV31}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [3, 1] ) 
 
rZV32 = 	 Parameter(name='rZV32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV32}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [3, 2] ) 
 
iZV32 = 	 Parameter(name='iZV32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV32}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [3, 2] ) 
 
rZV33 = 	 Parameter(name='rZV33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV33}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [3, 3] ) 
 
iZV33 = 	 Parameter(name='iZV33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV33}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [3, 3] ) 
 
rZV34 = 	 Parameter(name='rZV34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV34}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [3, 4] ) 
 
iZV34 = 	 Parameter(name='iZV34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV34}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [3, 4] ) 
 
rZV35 = 	 Parameter(name='rZV35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV35}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [3, 5] ) 
 
iZV35 = 	 Parameter(name='iZV35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV35}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [3, 5] ) 
 
rZV36 = 	 Parameter(name='rZV36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV36}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [3, 6] ) 
 
iZV36 = 	 Parameter(name='iZV36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV36}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [3, 6] ) 
 
rZV41 = 	 Parameter(name='rZV41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV41}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [4, 1] ) 
 
iZV41 = 	 Parameter(name='iZV41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV41}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [4, 1] ) 
 
rZV42 = 	 Parameter(name='rZV42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV42}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [4, 2] ) 
 
iZV42 = 	 Parameter(name='iZV42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV42}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [4, 2] ) 
 
rZV43 = 	 Parameter(name='rZV43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV43}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [4, 3] ) 
 
iZV43 = 	 Parameter(name='iZV43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV43}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [4, 3] ) 
 
rZV44 = 	 Parameter(name='rZV44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV44}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [4, 4] ) 
 
iZV44 = 	 Parameter(name='iZV44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV44}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [4, 4] ) 
 
rZV45 = 	 Parameter(name='rZV45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV45}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [4, 5] ) 
 
iZV45 = 	 Parameter(name='iZV45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV45}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [4, 5] ) 
 
rZV46 = 	 Parameter(name='rZV46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV46}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [4, 6] ) 
 
iZV46 = 	 Parameter(name='iZV46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV46}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [4, 6] ) 
 
rZV51 = 	 Parameter(name='rZV51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV51}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [5, 1] ) 
 
iZV51 = 	 Parameter(name='iZV51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV51}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [5, 1] ) 
 
rZV52 = 	 Parameter(name='rZV52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV52}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [5, 2] ) 
 
iZV52 = 	 Parameter(name='iZV52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV52}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [5, 2] ) 
 
rZV53 = 	 Parameter(name='rZV53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV53}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [5, 3] ) 
 
iZV53 = 	 Parameter(name='iZV53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV53}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [5, 3] ) 
 
rZV54 = 	 Parameter(name='rZV54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV54}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [5, 4] ) 
 
iZV54 = 	 Parameter(name='iZV54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV54}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [5, 4] ) 
 
rZV55 = 	 Parameter(name='rZV55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV55}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [5, 5] ) 
 
iZV55 = 	 Parameter(name='iZV55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV55}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [5, 5] ) 
 
rZV56 = 	 Parameter(name='rZV56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV56}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [5, 6] ) 
 
iZV56 = 	 Parameter(name='iZV56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV56}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [5, 6] ) 
 
rZV61 = 	 Parameter(name='rZV61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV61}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [6, 1] ) 
 
iZV61 = 	 Parameter(name='iZV61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV61}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [6, 1] ) 
 
rZV62 = 	 Parameter(name='rZV62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV62}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [6, 2] ) 
 
iZV62 = 	 Parameter(name='iZV62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV62}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [6, 2] ) 
 
rZV63 = 	 Parameter(name='rZV63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV63}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [6, 3] ) 
 
iZV63 = 	 Parameter(name='iZV63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV63}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [6, 3] ) 
 
rZV64 = 	 Parameter(name='rZV64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV64}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [6, 4] ) 
 
iZV64 = 	 Parameter(name='iZV64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV64}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [6, 4] ) 
 
rZV65 = 	 Parameter(name='rZV65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV65}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [6, 5] ) 
 
iZV65 = 	 Parameter(name='iZV65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV65}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [6, 5] ) 
 
rZV66 = 	 Parameter(name='rZV66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV66}', 
	 lhablock = 'SNUMIX', 
	 lhacode = [6, 6] ) 
 
iZV66 = 	 Parameter(name='iZV66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZV66}', 
	 lhablock = 'IMSNUMIX', 
	 lhacode = [6, 6] ) 
 
rZU11 = 	 Parameter(name='rZU11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU11}', 
	 lhablock = 'USQMIX', 
	 lhacode = [1, 1] ) 
 
iZU11 = 	 Parameter(name='iZU11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU11}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [1, 1] ) 
 
rZU12 = 	 Parameter(name='rZU12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU12}', 
	 lhablock = 'USQMIX', 
	 lhacode = [1, 2] ) 
 
iZU12 = 	 Parameter(name='iZU12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU12}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [1, 2] ) 
 
rZU13 = 	 Parameter(name='rZU13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU13}', 
	 lhablock = 'USQMIX', 
	 lhacode = [1, 3] ) 
 
iZU13 = 	 Parameter(name='iZU13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU13}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [1, 3] ) 
 
rZU14 = 	 Parameter(name='rZU14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU14}', 
	 lhablock = 'USQMIX', 
	 lhacode = [1, 4] ) 
 
iZU14 = 	 Parameter(name='iZU14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU14}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [1, 4] ) 
 
rZU15 = 	 Parameter(name='rZU15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU15}', 
	 lhablock = 'USQMIX', 
	 lhacode = [1, 5] ) 
 
iZU15 = 	 Parameter(name='iZU15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU15}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [1, 5] ) 
 
rZU16 = 	 Parameter(name='rZU16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU16}', 
	 lhablock = 'USQMIX', 
	 lhacode = [1, 6] ) 
 
iZU16 = 	 Parameter(name='iZU16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU16}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [1, 6] ) 
 
rZU21 = 	 Parameter(name='rZU21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU21}', 
	 lhablock = 'USQMIX', 
	 lhacode = [2, 1] ) 
 
iZU21 = 	 Parameter(name='iZU21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU21}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [2, 1] ) 
 
rZU22 = 	 Parameter(name='rZU22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU22}', 
	 lhablock = 'USQMIX', 
	 lhacode = [2, 2] ) 
 
iZU22 = 	 Parameter(name='iZU22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU22}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [2, 2] ) 
 
rZU23 = 	 Parameter(name='rZU23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU23}', 
	 lhablock = 'USQMIX', 
	 lhacode = [2, 3] ) 
 
iZU23 = 	 Parameter(name='iZU23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU23}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [2, 3] ) 
 
rZU24 = 	 Parameter(name='rZU24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU24}', 
	 lhablock = 'USQMIX', 
	 lhacode = [2, 4] ) 
 
iZU24 = 	 Parameter(name='iZU24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU24}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [2, 4] ) 
 
rZU25 = 	 Parameter(name='rZU25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU25}', 
	 lhablock = 'USQMIX', 
	 lhacode = [2, 5] ) 
 
iZU25 = 	 Parameter(name='iZU25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU25}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [2, 5] ) 
 
rZU26 = 	 Parameter(name='rZU26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU26}', 
	 lhablock = 'USQMIX', 
	 lhacode = [2, 6] ) 
 
iZU26 = 	 Parameter(name='iZU26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU26}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [2, 6] ) 
 
rZU31 = 	 Parameter(name='rZU31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU31}', 
	 lhablock = 'USQMIX', 
	 lhacode = [3, 1] ) 
 
iZU31 = 	 Parameter(name='iZU31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU31}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [3, 1] ) 
 
rZU32 = 	 Parameter(name='rZU32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU32}', 
	 lhablock = 'USQMIX', 
	 lhacode = [3, 2] ) 
 
iZU32 = 	 Parameter(name='iZU32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU32}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [3, 2] ) 
 
rZU33 = 	 Parameter(name='rZU33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU33}', 
	 lhablock = 'USQMIX', 
	 lhacode = [3, 3] ) 
 
iZU33 = 	 Parameter(name='iZU33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU33}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [3, 3] ) 
 
rZU34 = 	 Parameter(name='rZU34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU34}', 
	 lhablock = 'USQMIX', 
	 lhacode = [3, 4] ) 
 
iZU34 = 	 Parameter(name='iZU34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU34}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [3, 4] ) 
 
rZU35 = 	 Parameter(name='rZU35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU35}', 
	 lhablock = 'USQMIX', 
	 lhacode = [3, 5] ) 
 
iZU35 = 	 Parameter(name='iZU35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU35}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [3, 5] ) 
 
rZU36 = 	 Parameter(name='rZU36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU36}', 
	 lhablock = 'USQMIX', 
	 lhacode = [3, 6] ) 
 
iZU36 = 	 Parameter(name='iZU36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU36}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [3, 6] ) 
 
rZU41 = 	 Parameter(name='rZU41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU41}', 
	 lhablock = 'USQMIX', 
	 lhacode = [4, 1] ) 
 
iZU41 = 	 Parameter(name='iZU41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU41}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [4, 1] ) 
 
rZU42 = 	 Parameter(name='rZU42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU42}', 
	 lhablock = 'USQMIX', 
	 lhacode = [4, 2] ) 
 
iZU42 = 	 Parameter(name='iZU42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU42}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [4, 2] ) 
 
rZU43 = 	 Parameter(name='rZU43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU43}', 
	 lhablock = 'USQMIX', 
	 lhacode = [4, 3] ) 
 
iZU43 = 	 Parameter(name='iZU43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU43}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [4, 3] ) 
 
rZU44 = 	 Parameter(name='rZU44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU44}', 
	 lhablock = 'USQMIX', 
	 lhacode = [4, 4] ) 
 
iZU44 = 	 Parameter(name='iZU44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU44}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [4, 4] ) 
 
rZU45 = 	 Parameter(name='rZU45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU45}', 
	 lhablock = 'USQMIX', 
	 lhacode = [4, 5] ) 
 
iZU45 = 	 Parameter(name='iZU45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU45}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [4, 5] ) 
 
rZU46 = 	 Parameter(name='rZU46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU46}', 
	 lhablock = 'USQMIX', 
	 lhacode = [4, 6] ) 
 
iZU46 = 	 Parameter(name='iZU46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU46}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [4, 6] ) 
 
rZU51 = 	 Parameter(name='rZU51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU51}', 
	 lhablock = 'USQMIX', 
	 lhacode = [5, 1] ) 
 
iZU51 = 	 Parameter(name='iZU51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU51}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [5, 1] ) 
 
rZU52 = 	 Parameter(name='rZU52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU52}', 
	 lhablock = 'USQMIX', 
	 lhacode = [5, 2] ) 
 
iZU52 = 	 Parameter(name='iZU52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU52}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [5, 2] ) 
 
rZU53 = 	 Parameter(name='rZU53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU53}', 
	 lhablock = 'USQMIX', 
	 lhacode = [5, 3] ) 
 
iZU53 = 	 Parameter(name='iZU53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU53}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [5, 3] ) 
 
rZU54 = 	 Parameter(name='rZU54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU54}', 
	 lhablock = 'USQMIX', 
	 lhacode = [5, 4] ) 
 
iZU54 = 	 Parameter(name='iZU54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU54}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [5, 4] ) 
 
rZU55 = 	 Parameter(name='rZU55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU55}', 
	 lhablock = 'USQMIX', 
	 lhacode = [5, 5] ) 
 
iZU55 = 	 Parameter(name='iZU55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU55}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [5, 5] ) 
 
rZU56 = 	 Parameter(name='rZU56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU56}', 
	 lhablock = 'USQMIX', 
	 lhacode = [5, 6] ) 
 
iZU56 = 	 Parameter(name='iZU56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU56}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [5, 6] ) 
 
rZU61 = 	 Parameter(name='rZU61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU61}', 
	 lhablock = 'USQMIX', 
	 lhacode = [6, 1] ) 
 
iZU61 = 	 Parameter(name='iZU61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU61}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [6, 1] ) 
 
rZU62 = 	 Parameter(name='rZU62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU62}', 
	 lhablock = 'USQMIX', 
	 lhacode = [6, 2] ) 
 
iZU62 = 	 Parameter(name='iZU62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU62}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [6, 2] ) 
 
rZU63 = 	 Parameter(name='rZU63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU63}', 
	 lhablock = 'USQMIX', 
	 lhacode = [6, 3] ) 
 
iZU63 = 	 Parameter(name='iZU63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU63}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [6, 3] ) 
 
rZU64 = 	 Parameter(name='rZU64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU64}', 
	 lhablock = 'USQMIX', 
	 lhacode = [6, 4] ) 
 
iZU64 = 	 Parameter(name='iZU64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU64}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [6, 4] ) 
 
rZU65 = 	 Parameter(name='rZU65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU65}', 
	 lhablock = 'USQMIX', 
	 lhacode = [6, 5] ) 
 
iZU65 = 	 Parameter(name='iZU65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU65}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [6, 5] ) 
 
rZU66 = 	 Parameter(name='rZU66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU66}', 
	 lhablock = 'USQMIX', 
	 lhacode = [6, 6] ) 
 
iZU66 = 	 Parameter(name='iZU66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZU66}', 
	 lhablock = 'IMUSQMIX', 
	 lhacode = [6, 6] ) 
 
rZE11 = 	 Parameter(name='rZE11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE11}', 
	 lhablock = 'SELMIX', 
	 lhacode = [1, 1] ) 
 
iZE11 = 	 Parameter(name='iZE11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE11}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [1, 1] ) 
 
rZE12 = 	 Parameter(name='rZE12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE12}', 
	 lhablock = 'SELMIX', 
	 lhacode = [1, 2] ) 
 
iZE12 = 	 Parameter(name='iZE12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE12}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [1, 2] ) 
 
rZE13 = 	 Parameter(name='rZE13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE13}', 
	 lhablock = 'SELMIX', 
	 lhacode = [1, 3] ) 
 
iZE13 = 	 Parameter(name='iZE13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE13}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [1, 3] ) 
 
rZE14 = 	 Parameter(name='rZE14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE14}', 
	 lhablock = 'SELMIX', 
	 lhacode = [1, 4] ) 
 
iZE14 = 	 Parameter(name='iZE14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE14}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [1, 4] ) 
 
rZE15 = 	 Parameter(name='rZE15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE15}', 
	 lhablock = 'SELMIX', 
	 lhacode = [1, 5] ) 
 
iZE15 = 	 Parameter(name='iZE15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE15}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [1, 5] ) 
 
rZE16 = 	 Parameter(name='rZE16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE16}', 
	 lhablock = 'SELMIX', 
	 lhacode = [1, 6] ) 
 
iZE16 = 	 Parameter(name='iZE16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE16}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [1, 6] ) 
 
rZE21 = 	 Parameter(name='rZE21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE21}', 
	 lhablock = 'SELMIX', 
	 lhacode = [2, 1] ) 
 
iZE21 = 	 Parameter(name='iZE21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE21}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [2, 1] ) 
 
rZE22 = 	 Parameter(name='rZE22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE22}', 
	 lhablock = 'SELMIX', 
	 lhacode = [2, 2] ) 
 
iZE22 = 	 Parameter(name='iZE22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE22}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [2, 2] ) 
 
rZE23 = 	 Parameter(name='rZE23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE23}', 
	 lhablock = 'SELMIX', 
	 lhacode = [2, 3] ) 
 
iZE23 = 	 Parameter(name='iZE23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE23}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [2, 3] ) 
 
rZE24 = 	 Parameter(name='rZE24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE24}', 
	 lhablock = 'SELMIX', 
	 lhacode = [2, 4] ) 
 
iZE24 = 	 Parameter(name='iZE24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE24}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [2, 4] ) 
 
rZE25 = 	 Parameter(name='rZE25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE25}', 
	 lhablock = 'SELMIX', 
	 lhacode = [2, 5] ) 
 
iZE25 = 	 Parameter(name='iZE25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE25}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [2, 5] ) 
 
rZE26 = 	 Parameter(name='rZE26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE26}', 
	 lhablock = 'SELMIX', 
	 lhacode = [2, 6] ) 
 
iZE26 = 	 Parameter(name='iZE26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE26}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [2, 6] ) 
 
rZE31 = 	 Parameter(name='rZE31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE31}', 
	 lhablock = 'SELMIX', 
	 lhacode = [3, 1] ) 
 
iZE31 = 	 Parameter(name='iZE31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE31}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [3, 1] ) 
 
rZE32 = 	 Parameter(name='rZE32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE32}', 
	 lhablock = 'SELMIX', 
	 lhacode = [3, 2] ) 
 
iZE32 = 	 Parameter(name='iZE32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE32}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [3, 2] ) 
 
rZE33 = 	 Parameter(name='rZE33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE33}', 
	 lhablock = 'SELMIX', 
	 lhacode = [3, 3] ) 
 
iZE33 = 	 Parameter(name='iZE33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE33}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [3, 3] ) 
 
rZE34 = 	 Parameter(name='rZE34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE34}', 
	 lhablock = 'SELMIX', 
	 lhacode = [3, 4] ) 
 
iZE34 = 	 Parameter(name='iZE34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE34}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [3, 4] ) 
 
rZE35 = 	 Parameter(name='rZE35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE35}', 
	 lhablock = 'SELMIX', 
	 lhacode = [3, 5] ) 
 
iZE35 = 	 Parameter(name='iZE35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE35}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [3, 5] ) 
 
rZE36 = 	 Parameter(name='rZE36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE36}', 
	 lhablock = 'SELMIX', 
	 lhacode = [3, 6] ) 
 
iZE36 = 	 Parameter(name='iZE36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE36}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [3, 6] ) 
 
rZE41 = 	 Parameter(name='rZE41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE41}', 
	 lhablock = 'SELMIX', 
	 lhacode = [4, 1] ) 
 
iZE41 = 	 Parameter(name='iZE41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE41}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [4, 1] ) 
 
rZE42 = 	 Parameter(name='rZE42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE42}', 
	 lhablock = 'SELMIX', 
	 lhacode = [4, 2] ) 
 
iZE42 = 	 Parameter(name='iZE42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE42}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [4, 2] ) 
 
rZE43 = 	 Parameter(name='rZE43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE43}', 
	 lhablock = 'SELMIX', 
	 lhacode = [4, 3] ) 
 
iZE43 = 	 Parameter(name='iZE43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE43}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [4, 3] ) 
 
rZE44 = 	 Parameter(name='rZE44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE44}', 
	 lhablock = 'SELMIX', 
	 lhacode = [4, 4] ) 
 
iZE44 = 	 Parameter(name='iZE44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE44}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [4, 4] ) 
 
rZE45 = 	 Parameter(name='rZE45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE45}', 
	 lhablock = 'SELMIX', 
	 lhacode = [4, 5] ) 
 
iZE45 = 	 Parameter(name='iZE45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE45}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [4, 5] ) 
 
rZE46 = 	 Parameter(name='rZE46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE46}', 
	 lhablock = 'SELMIX', 
	 lhacode = [4, 6] ) 
 
iZE46 = 	 Parameter(name='iZE46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE46}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [4, 6] ) 
 
rZE51 = 	 Parameter(name='rZE51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE51}', 
	 lhablock = 'SELMIX', 
	 lhacode = [5, 1] ) 
 
iZE51 = 	 Parameter(name='iZE51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE51}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [5, 1] ) 
 
rZE52 = 	 Parameter(name='rZE52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE52}', 
	 lhablock = 'SELMIX', 
	 lhacode = [5, 2] ) 
 
iZE52 = 	 Parameter(name='iZE52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE52}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [5, 2] ) 
 
rZE53 = 	 Parameter(name='rZE53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE53}', 
	 lhablock = 'SELMIX', 
	 lhacode = [5, 3] ) 
 
iZE53 = 	 Parameter(name='iZE53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE53}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [5, 3] ) 
 
rZE54 = 	 Parameter(name='rZE54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE54}', 
	 lhablock = 'SELMIX', 
	 lhacode = [5, 4] ) 
 
iZE54 = 	 Parameter(name='iZE54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE54}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [5, 4] ) 
 
rZE55 = 	 Parameter(name='rZE55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE55}', 
	 lhablock = 'SELMIX', 
	 lhacode = [5, 5] ) 
 
iZE55 = 	 Parameter(name='iZE55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE55}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [5, 5] ) 
 
rZE56 = 	 Parameter(name='rZE56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE56}', 
	 lhablock = 'SELMIX', 
	 lhacode = [5, 6] ) 
 
iZE56 = 	 Parameter(name='iZE56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE56}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [5, 6] ) 
 
rZE61 = 	 Parameter(name='rZE61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE61}', 
	 lhablock = 'SELMIX', 
	 lhacode = [6, 1] ) 
 
iZE61 = 	 Parameter(name='iZE61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE61}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [6, 1] ) 
 
rZE62 = 	 Parameter(name='rZE62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE62}', 
	 lhablock = 'SELMIX', 
	 lhacode = [6, 2] ) 
 
iZE62 = 	 Parameter(name='iZE62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE62}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [6, 2] ) 
 
rZE63 = 	 Parameter(name='rZE63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE63}', 
	 lhablock = 'SELMIX', 
	 lhacode = [6, 3] ) 
 
iZE63 = 	 Parameter(name='iZE63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE63}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [6, 3] ) 
 
rZE64 = 	 Parameter(name='rZE64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE64}', 
	 lhablock = 'SELMIX', 
	 lhacode = [6, 4] ) 
 
iZE64 = 	 Parameter(name='iZE64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE64}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [6, 4] ) 
 
rZE65 = 	 Parameter(name='rZE65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE65}', 
	 lhablock = 'SELMIX', 
	 lhacode = [6, 5] ) 
 
iZE65 = 	 Parameter(name='iZE65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE65}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [6, 5] ) 
 
rZE66 = 	 Parameter(name='rZE66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE66}', 
	 lhablock = 'SELMIX', 
	 lhacode = [6, 6] ) 
 
iZE66 = 	 Parameter(name='iZE66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZE66}', 
	 lhablock = 'IMSELMIX', 
	 lhacode = [6, 6] ) 
 
rZH11 = 	 Parameter(name='rZH11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH11}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [1, 1] ) 
 
iZH11 = 	 Parameter(name='iZH11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH11}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [1, 1] ) 
 
rZH12 = 	 Parameter(name='rZH12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH12}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [1, 2] ) 
 
iZH12 = 	 Parameter(name='iZH12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH12}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [1, 2] ) 
 
rZH13 = 	 Parameter(name='rZH13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH13}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [1, 3] ) 
 
iZH13 = 	 Parameter(name='iZH13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH13}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [1, 3] ) 
 
rZH14 = 	 Parameter(name='rZH14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH14}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [1, 4] ) 
 
iZH14 = 	 Parameter(name='iZH14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH14}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [1, 4] ) 
 
rZH15 = 	 Parameter(name='rZH15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH15}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [1, 5] ) 
 
iZH15 = 	 Parameter(name='iZH15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH15}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [1, 5] ) 
 
rZH16 = 	 Parameter(name='rZH16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH16}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [1, 6] ) 
 
iZH16 = 	 Parameter(name='iZH16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH16}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [1, 6] ) 
 
rZH21 = 	 Parameter(name='rZH21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH21}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [2, 1] ) 
 
iZH21 = 	 Parameter(name='iZH21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH21}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [2, 1] ) 
 
rZH22 = 	 Parameter(name='rZH22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH22}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [2, 2] ) 
 
iZH22 = 	 Parameter(name='iZH22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH22}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [2, 2] ) 
 
rZH23 = 	 Parameter(name='rZH23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH23}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [2, 3] ) 
 
iZH23 = 	 Parameter(name='iZH23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH23}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [2, 3] ) 
 
rZH24 = 	 Parameter(name='rZH24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH24}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [2, 4] ) 
 
iZH24 = 	 Parameter(name='iZH24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH24}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [2, 4] ) 
 
rZH25 = 	 Parameter(name='rZH25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH25}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [2, 5] ) 
 
iZH25 = 	 Parameter(name='iZH25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH25}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [2, 5] ) 
 
rZH26 = 	 Parameter(name='rZH26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH26}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [2, 6] ) 
 
iZH26 = 	 Parameter(name='iZH26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH26}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [2, 6] ) 
 
rZH31 = 	 Parameter(name='rZH31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH31}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [3, 1] ) 
 
iZH31 = 	 Parameter(name='iZH31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH31}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [3, 1] ) 
 
rZH32 = 	 Parameter(name='rZH32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH32}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [3, 2] ) 
 
iZH32 = 	 Parameter(name='iZH32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH32}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [3, 2] ) 
 
rZH33 = 	 Parameter(name='rZH33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH33}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [3, 3] ) 
 
iZH33 = 	 Parameter(name='iZH33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH33}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [3, 3] ) 
 
rZH34 = 	 Parameter(name='rZH34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH34}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [3, 4] ) 
 
iZH34 = 	 Parameter(name='iZH34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH34}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [3, 4] ) 
 
rZH35 = 	 Parameter(name='rZH35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH35}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [3, 5] ) 
 
iZH35 = 	 Parameter(name='iZH35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH35}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [3, 5] ) 
 
rZH36 = 	 Parameter(name='rZH36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH36}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [3, 6] ) 
 
iZH36 = 	 Parameter(name='iZH36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH36}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [3, 6] ) 
 
rZH41 = 	 Parameter(name='rZH41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH41}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [4, 1] ) 
 
iZH41 = 	 Parameter(name='iZH41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH41}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [4, 1] ) 
 
rZH42 = 	 Parameter(name='rZH42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH42}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [4, 2] ) 
 
iZH42 = 	 Parameter(name='iZH42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH42}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [4, 2] ) 
 
rZH43 = 	 Parameter(name='rZH43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH43}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [4, 3] ) 
 
iZH43 = 	 Parameter(name='iZH43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH43}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [4, 3] ) 
 
rZH44 = 	 Parameter(name='rZH44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH44}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [4, 4] ) 
 
iZH44 = 	 Parameter(name='iZH44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH44}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [4, 4] ) 
 
rZH45 = 	 Parameter(name='rZH45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH45}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [4, 5] ) 
 
iZH45 = 	 Parameter(name='iZH45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH45}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [4, 5] ) 
 
rZH46 = 	 Parameter(name='rZH46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH46}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [4, 6] ) 
 
iZH46 = 	 Parameter(name='iZH46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH46}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [4, 6] ) 
 
rZH51 = 	 Parameter(name='rZH51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH51}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [5, 1] ) 
 
iZH51 = 	 Parameter(name='iZH51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH51}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [5, 1] ) 
 
rZH52 = 	 Parameter(name='rZH52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH52}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [5, 2] ) 
 
iZH52 = 	 Parameter(name='iZH52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH52}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [5, 2] ) 
 
rZH53 = 	 Parameter(name='rZH53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH53}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [5, 3] ) 
 
iZH53 = 	 Parameter(name='iZH53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH53}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [5, 3] ) 
 
rZH54 = 	 Parameter(name='rZH54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH54}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [5, 4] ) 
 
iZH54 = 	 Parameter(name='iZH54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH54}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [5, 4] ) 
 
rZH55 = 	 Parameter(name='rZH55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH55}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [5, 5] ) 
 
iZH55 = 	 Parameter(name='iZH55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH55}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [5, 5] ) 
 
rZH56 = 	 Parameter(name='rZH56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH56}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [5, 6] ) 
 
iZH56 = 	 Parameter(name='iZH56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH56}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [5, 6] ) 
 
rZH61 = 	 Parameter(name='rZH61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH61}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [6, 1] ) 
 
iZH61 = 	 Parameter(name='iZH61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH61}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [6, 1] ) 
 
rZH62 = 	 Parameter(name='rZH62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH62}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [6, 2] ) 
 
iZH62 = 	 Parameter(name='iZH62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH62}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [6, 2] ) 
 
rZH63 = 	 Parameter(name='rZH63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH63}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [6, 3] ) 
 
iZH63 = 	 Parameter(name='iZH63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH63}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [6, 3] ) 
 
rZH64 = 	 Parameter(name='rZH64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH64}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [6, 4] ) 
 
iZH64 = 	 Parameter(name='iZH64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH64}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [6, 4] ) 
 
rZH65 = 	 Parameter(name='rZH65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH65}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [6, 5] ) 
 
iZH65 = 	 Parameter(name='iZH65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH65}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [6, 5] ) 
 
rZH66 = 	 Parameter(name='rZH66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH66}', 
	 lhablock = 'NMHMIX', 
	 lhacode = [6, 6] ) 
 
iZH66 = 	 Parameter(name='iZH66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZH66}', 
	 lhablock = 'IMNMHMIX', 
	 lhacode = [6, 6] ) 
 
rZA11 = 	 Parameter(name='rZA11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA11}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [1, 1] ) 
 
iZA11 = 	 Parameter(name='iZA11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA11}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [1, 1] ) 
 
rZA12 = 	 Parameter(name='rZA12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA12}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [1, 2] ) 
 
iZA12 = 	 Parameter(name='iZA12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA12}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [1, 2] ) 
 
rZA13 = 	 Parameter(name='rZA13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA13}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [1, 3] ) 
 
iZA13 = 	 Parameter(name='iZA13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA13}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [1, 3] ) 
 
rZA14 = 	 Parameter(name='rZA14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA14}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [1, 4] ) 
 
iZA14 = 	 Parameter(name='iZA14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA14}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [1, 4] ) 
 
rZA15 = 	 Parameter(name='rZA15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA15}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [1, 5] ) 
 
iZA15 = 	 Parameter(name='iZA15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA15}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [1, 5] ) 
 
rZA16 = 	 Parameter(name='rZA16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA16}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [1, 6] ) 
 
iZA16 = 	 Parameter(name='iZA16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA16}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [1, 6] ) 
 
rZA21 = 	 Parameter(name='rZA21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA21}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [2, 1] ) 
 
iZA21 = 	 Parameter(name='iZA21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA21}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [2, 1] ) 
 
rZA22 = 	 Parameter(name='rZA22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA22}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [2, 2] ) 
 
iZA22 = 	 Parameter(name='iZA22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA22}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [2, 2] ) 
 
rZA23 = 	 Parameter(name='rZA23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA23}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [2, 3] ) 
 
iZA23 = 	 Parameter(name='iZA23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA23}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [2, 3] ) 
 
rZA24 = 	 Parameter(name='rZA24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA24}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [2, 4] ) 
 
iZA24 = 	 Parameter(name='iZA24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA24}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [2, 4] ) 
 
rZA25 = 	 Parameter(name='rZA25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA25}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [2, 5] ) 
 
iZA25 = 	 Parameter(name='iZA25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA25}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [2, 5] ) 
 
rZA26 = 	 Parameter(name='rZA26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA26}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [2, 6] ) 
 
iZA26 = 	 Parameter(name='iZA26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA26}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [2, 6] ) 
 
rZA31 = 	 Parameter(name='rZA31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA31}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [3, 1] ) 
 
iZA31 = 	 Parameter(name='iZA31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA31}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [3, 1] ) 
 
rZA32 = 	 Parameter(name='rZA32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA32}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [3, 2] ) 
 
iZA32 = 	 Parameter(name='iZA32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA32}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [3, 2] ) 
 
rZA33 = 	 Parameter(name='rZA33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA33}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [3, 3] ) 
 
iZA33 = 	 Parameter(name='iZA33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA33}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [3, 3] ) 
 
rZA34 = 	 Parameter(name='rZA34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA34}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [3, 4] ) 
 
iZA34 = 	 Parameter(name='iZA34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA34}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [3, 4] ) 
 
rZA35 = 	 Parameter(name='rZA35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA35}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [3, 5] ) 
 
iZA35 = 	 Parameter(name='iZA35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA35}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [3, 5] ) 
 
rZA36 = 	 Parameter(name='rZA36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA36}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [3, 6] ) 
 
iZA36 = 	 Parameter(name='iZA36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA36}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [3, 6] ) 
 
rZA41 = 	 Parameter(name='rZA41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA41}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [4, 1] ) 
 
iZA41 = 	 Parameter(name='iZA41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA41}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [4, 1] ) 
 
rZA42 = 	 Parameter(name='rZA42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA42}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [4, 2] ) 
 
iZA42 = 	 Parameter(name='iZA42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA42}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [4, 2] ) 
 
rZA43 = 	 Parameter(name='rZA43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA43}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [4, 3] ) 
 
iZA43 = 	 Parameter(name='iZA43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA43}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [4, 3] ) 
 
rZA44 = 	 Parameter(name='rZA44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA44}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [4, 4] ) 
 
iZA44 = 	 Parameter(name='iZA44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA44}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [4, 4] ) 
 
rZA45 = 	 Parameter(name='rZA45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA45}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [4, 5] ) 
 
iZA45 = 	 Parameter(name='iZA45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA45}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [4, 5] ) 
 
rZA46 = 	 Parameter(name='rZA46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA46}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [4, 6] ) 
 
iZA46 = 	 Parameter(name='iZA46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA46}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [4, 6] ) 
 
rZA51 = 	 Parameter(name='rZA51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA51}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [5, 1] ) 
 
iZA51 = 	 Parameter(name='iZA51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA51}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [5, 1] ) 
 
rZA52 = 	 Parameter(name='rZA52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA52}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [5, 2] ) 
 
iZA52 = 	 Parameter(name='iZA52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA52}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [5, 2] ) 
 
rZA53 = 	 Parameter(name='rZA53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA53}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [5, 3] ) 
 
iZA53 = 	 Parameter(name='iZA53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA53}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [5, 3] ) 
 
rZA54 = 	 Parameter(name='rZA54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA54}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [5, 4] ) 
 
iZA54 = 	 Parameter(name='iZA54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA54}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [5, 4] ) 
 
rZA55 = 	 Parameter(name='rZA55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA55}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [5, 5] ) 
 
iZA55 = 	 Parameter(name='iZA55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA55}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [5, 5] ) 
 
rZA56 = 	 Parameter(name='rZA56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA56}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [5, 6] ) 
 
iZA56 = 	 Parameter(name='iZA56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA56}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [5, 6] ) 
 
rZA61 = 	 Parameter(name='rZA61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA61}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [6, 1] ) 
 
iZA61 = 	 Parameter(name='iZA61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA61}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [6, 1] ) 
 
rZA62 = 	 Parameter(name='rZA62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA62}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [6, 2] ) 
 
iZA62 = 	 Parameter(name='iZA62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA62}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [6, 2] ) 
 
rZA63 = 	 Parameter(name='rZA63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA63}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [6, 3] ) 
 
iZA63 = 	 Parameter(name='iZA63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA63}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [6, 3] ) 
 
rZA64 = 	 Parameter(name='rZA64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA64}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [6, 4] ) 
 
iZA64 = 	 Parameter(name='iZA64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA64}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [6, 4] ) 
 
rZA65 = 	 Parameter(name='rZA65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA65}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [6, 5] ) 
 
iZA65 = 	 Parameter(name='iZA65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA65}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [6, 5] ) 
 
rZA66 = 	 Parameter(name='rZA66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA66}', 
	 lhablock = 'NMAMIX', 
	 lhacode = [6, 6] ) 
 
iZA66 = 	 Parameter(name='iZA66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZA66}', 
	 lhablock = 'IMNMAMIX', 
	 lhacode = [6, 6] ) 
 
rZN11 = 	 Parameter(name='rZN11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN11}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [1, 1] ) 
 
iZN11 = 	 Parameter(name='iZN11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN11}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [1, 1] ) 
 
rZN12 = 	 Parameter(name='rZN12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN12}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [1, 2] ) 
 
iZN12 = 	 Parameter(name='iZN12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN12}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [1, 2] ) 
 
rZN13 = 	 Parameter(name='rZN13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN13}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [1, 3] ) 
 
iZN13 = 	 Parameter(name='iZN13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN13}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [1, 3] ) 
 
rZN14 = 	 Parameter(name='rZN14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN14}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [1, 4] ) 
 
iZN14 = 	 Parameter(name='iZN14', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN14}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [1, 4] ) 
 
rZN15 = 	 Parameter(name='rZN15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN15}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [1, 5] ) 
 
iZN15 = 	 Parameter(name='iZN15', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN15}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [1, 5] ) 
 
rZN16 = 	 Parameter(name='rZN16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN16}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [1, 6] ) 
 
iZN16 = 	 Parameter(name='iZN16', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN16}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [1, 6] ) 
 
rZN17 = 	 Parameter(name='rZN17', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN17}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [1, 7] ) 
 
iZN17 = 	 Parameter(name='iZN17', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN17}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [1, 7] ) 
 
rZN18 = 	 Parameter(name='rZN18', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN18}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [1, 8] ) 
 
iZN18 = 	 Parameter(name='iZN18', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN18}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [1, 8] ) 
 
rZN19 = 	 Parameter(name='rZN19', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN19}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [1, 9] ) 
 
iZN19 = 	 Parameter(name='iZN19', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN19}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [1, 9] ) 
 
rZN21 = 	 Parameter(name='rZN21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN21}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [2, 1] ) 
 
iZN21 = 	 Parameter(name='iZN21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN21}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [2, 1] ) 
 
rZN22 = 	 Parameter(name='rZN22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN22}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [2, 2] ) 
 
iZN22 = 	 Parameter(name='iZN22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN22}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [2, 2] ) 
 
rZN23 = 	 Parameter(name='rZN23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN23}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [2, 3] ) 
 
iZN23 = 	 Parameter(name='iZN23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN23}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [2, 3] ) 
 
rZN24 = 	 Parameter(name='rZN24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN24}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [2, 4] ) 
 
iZN24 = 	 Parameter(name='iZN24', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN24}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [2, 4] ) 
 
rZN25 = 	 Parameter(name='rZN25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN25}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [2, 5] ) 
 
iZN25 = 	 Parameter(name='iZN25', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN25}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [2, 5] ) 
 
rZN26 = 	 Parameter(name='rZN26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN26}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [2, 6] ) 
 
iZN26 = 	 Parameter(name='iZN26', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN26}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [2, 6] ) 
 
rZN27 = 	 Parameter(name='rZN27', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN27}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [2, 7] ) 
 
iZN27 = 	 Parameter(name='iZN27', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN27}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [2, 7] ) 
 
rZN28 = 	 Parameter(name='rZN28', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN28}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [2, 8] ) 
 
iZN28 = 	 Parameter(name='iZN28', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN28}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [2, 8] ) 
 
rZN29 = 	 Parameter(name='rZN29', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN29}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [2, 9] ) 
 
iZN29 = 	 Parameter(name='iZN29', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN29}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [2, 9] ) 
 
rZN31 = 	 Parameter(name='rZN31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN31}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [3, 1] ) 
 
iZN31 = 	 Parameter(name='iZN31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN31}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [3, 1] ) 
 
rZN32 = 	 Parameter(name='rZN32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN32}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [3, 2] ) 
 
iZN32 = 	 Parameter(name='iZN32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN32}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [3, 2] ) 
 
rZN33 = 	 Parameter(name='rZN33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN33}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [3, 3] ) 
 
iZN33 = 	 Parameter(name='iZN33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN33}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [3, 3] ) 
 
rZN34 = 	 Parameter(name='rZN34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN34}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [3, 4] ) 
 
iZN34 = 	 Parameter(name='iZN34', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN34}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [3, 4] ) 
 
rZN35 = 	 Parameter(name='rZN35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN35}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [3, 5] ) 
 
iZN35 = 	 Parameter(name='iZN35', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN35}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [3, 5] ) 
 
rZN36 = 	 Parameter(name='rZN36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN36}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [3, 6] ) 
 
iZN36 = 	 Parameter(name='iZN36', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN36}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [3, 6] ) 
 
rZN37 = 	 Parameter(name='rZN37', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN37}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [3, 7] ) 
 
iZN37 = 	 Parameter(name='iZN37', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN37}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [3, 7] ) 
 
rZN38 = 	 Parameter(name='rZN38', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN38}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [3, 8] ) 
 
iZN38 = 	 Parameter(name='iZN38', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN38}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [3, 8] ) 
 
rZN39 = 	 Parameter(name='rZN39', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN39}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [3, 9] ) 
 
iZN39 = 	 Parameter(name='iZN39', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN39}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [3, 9] ) 
 
rZN41 = 	 Parameter(name='rZN41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN41}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [4, 1] ) 
 
iZN41 = 	 Parameter(name='iZN41', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN41}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [4, 1] ) 
 
rZN42 = 	 Parameter(name='rZN42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN42}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [4, 2] ) 
 
iZN42 = 	 Parameter(name='iZN42', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN42}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [4, 2] ) 
 
rZN43 = 	 Parameter(name='rZN43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN43}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [4, 3] ) 
 
iZN43 = 	 Parameter(name='iZN43', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN43}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [4, 3] ) 
 
rZN44 = 	 Parameter(name='rZN44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN44}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [4, 4] ) 
 
iZN44 = 	 Parameter(name='iZN44', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN44}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [4, 4] ) 
 
rZN45 = 	 Parameter(name='rZN45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN45}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [4, 5] ) 
 
iZN45 = 	 Parameter(name='iZN45', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN45}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [4, 5] ) 
 
rZN46 = 	 Parameter(name='rZN46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN46}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [4, 6] ) 
 
iZN46 = 	 Parameter(name='iZN46', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN46}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [4, 6] ) 
 
rZN47 = 	 Parameter(name='rZN47', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN47}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [4, 7] ) 
 
iZN47 = 	 Parameter(name='iZN47', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN47}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [4, 7] ) 
 
rZN48 = 	 Parameter(name='rZN48', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN48}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [4, 8] ) 
 
iZN48 = 	 Parameter(name='iZN48', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN48}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [4, 8] ) 
 
rZN49 = 	 Parameter(name='rZN49', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN49}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [4, 9] ) 
 
iZN49 = 	 Parameter(name='iZN49', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN49}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [4, 9] ) 
 
rZN51 = 	 Parameter(name='rZN51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN51}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [5, 1] ) 
 
iZN51 = 	 Parameter(name='iZN51', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN51}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [5, 1] ) 
 
rZN52 = 	 Parameter(name='rZN52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN52}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [5, 2] ) 
 
iZN52 = 	 Parameter(name='iZN52', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN52}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [5, 2] ) 
 
rZN53 = 	 Parameter(name='rZN53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN53}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [5, 3] ) 
 
iZN53 = 	 Parameter(name='iZN53', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN53}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [5, 3] ) 
 
rZN54 = 	 Parameter(name='rZN54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN54}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [5, 4] ) 
 
iZN54 = 	 Parameter(name='iZN54', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN54}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [5, 4] ) 
 
rZN55 = 	 Parameter(name='rZN55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN55}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [5, 5] ) 
 
iZN55 = 	 Parameter(name='iZN55', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN55}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [5, 5] ) 
 
rZN56 = 	 Parameter(name='rZN56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN56}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [5, 6] ) 
 
iZN56 = 	 Parameter(name='iZN56', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN56}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [5, 6] ) 
 
rZN57 = 	 Parameter(name='rZN57', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN57}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [5, 7] ) 
 
iZN57 = 	 Parameter(name='iZN57', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN57}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [5, 7] ) 
 
rZN58 = 	 Parameter(name='rZN58', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN58}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [5, 8] ) 
 
iZN58 = 	 Parameter(name='iZN58', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN58}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [5, 8] ) 
 
rZN59 = 	 Parameter(name='rZN59', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN59}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [5, 9] ) 
 
iZN59 = 	 Parameter(name='iZN59', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN59}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [5, 9] ) 
 
rZN61 = 	 Parameter(name='rZN61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN61}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [6, 1] ) 
 
iZN61 = 	 Parameter(name='iZN61', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN61}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [6, 1] ) 
 
rZN62 = 	 Parameter(name='rZN62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN62}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [6, 2] ) 
 
iZN62 = 	 Parameter(name='iZN62', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN62}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [6, 2] ) 
 
rZN63 = 	 Parameter(name='rZN63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN63}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [6, 3] ) 
 
iZN63 = 	 Parameter(name='iZN63', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN63}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [6, 3] ) 
 
rZN64 = 	 Parameter(name='rZN64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN64}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [6, 4] ) 
 
iZN64 = 	 Parameter(name='iZN64', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN64}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [6, 4] ) 
 
rZN65 = 	 Parameter(name='rZN65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN65}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [6, 5] ) 
 
iZN65 = 	 Parameter(name='iZN65', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN65}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [6, 5] ) 
 
rZN66 = 	 Parameter(name='rZN66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN66}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [6, 6] ) 
 
iZN66 = 	 Parameter(name='iZN66', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN66}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [6, 6] ) 
 
rZN67 = 	 Parameter(name='rZN67', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN67}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [6, 7] ) 
 
iZN67 = 	 Parameter(name='iZN67', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN67}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [6, 7] ) 
 
rZN68 = 	 Parameter(name='rZN68', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN68}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [6, 8] ) 
 
iZN68 = 	 Parameter(name='iZN68', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN68}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [6, 8] ) 
 
rZN69 = 	 Parameter(name='rZN69', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN69}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [6, 9] ) 
 
iZN69 = 	 Parameter(name='iZN69', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN69}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [6, 9] ) 
 
rZN71 = 	 Parameter(name='rZN71', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN71}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [7, 1] ) 
 
iZN71 = 	 Parameter(name='iZN71', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN71}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [7, 1] ) 
 
rZN72 = 	 Parameter(name='rZN72', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN72}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [7, 2] ) 
 
iZN72 = 	 Parameter(name='iZN72', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN72}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [7, 2] ) 
 
rZN73 = 	 Parameter(name='rZN73', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN73}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [7, 3] ) 
 
iZN73 = 	 Parameter(name='iZN73', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN73}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [7, 3] ) 
 
rZN74 = 	 Parameter(name='rZN74', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN74}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [7, 4] ) 
 
iZN74 = 	 Parameter(name='iZN74', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN74}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [7, 4] ) 
 
rZN75 = 	 Parameter(name='rZN75', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN75}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [7, 5] ) 
 
iZN75 = 	 Parameter(name='iZN75', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN75}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [7, 5] ) 
 
rZN76 = 	 Parameter(name='rZN76', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN76}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [7, 6] ) 
 
iZN76 = 	 Parameter(name='iZN76', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN76}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [7, 6] ) 
 
rZN77 = 	 Parameter(name='rZN77', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN77}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [7, 7] ) 
 
iZN77 = 	 Parameter(name='iZN77', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN77}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [7, 7] ) 
 
rZN78 = 	 Parameter(name='rZN78', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN78}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [7, 8] ) 
 
iZN78 = 	 Parameter(name='iZN78', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN78}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [7, 8] ) 
 
rZN79 = 	 Parameter(name='rZN79', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN79}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [7, 9] ) 
 
iZN79 = 	 Parameter(name='iZN79', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN79}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [7, 9] ) 
 
rZN81 = 	 Parameter(name='rZN81', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN81}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [8, 1] ) 
 
iZN81 = 	 Parameter(name='iZN81', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN81}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [8, 1] ) 
 
rZN82 = 	 Parameter(name='rZN82', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN82}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [8, 2] ) 
 
iZN82 = 	 Parameter(name='iZN82', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN82}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [8, 2] ) 
 
rZN83 = 	 Parameter(name='rZN83', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN83}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [8, 3] ) 
 
iZN83 = 	 Parameter(name='iZN83', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN83}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [8, 3] ) 
 
rZN84 = 	 Parameter(name='rZN84', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN84}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [8, 4] ) 
 
iZN84 = 	 Parameter(name='iZN84', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN84}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [8, 4] ) 
 
rZN85 = 	 Parameter(name='rZN85', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN85}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [8, 5] ) 
 
iZN85 = 	 Parameter(name='iZN85', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN85}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [8, 5] ) 
 
rZN86 = 	 Parameter(name='rZN86', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN86}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [8, 6] ) 
 
iZN86 = 	 Parameter(name='iZN86', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN86}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [8, 6] ) 
 
rZN87 = 	 Parameter(name='rZN87', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN87}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [8, 7] ) 
 
iZN87 = 	 Parameter(name='iZN87', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN87}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [8, 7] ) 
 
rZN88 = 	 Parameter(name='rZN88', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN88}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [8, 8] ) 
 
iZN88 = 	 Parameter(name='iZN88', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN88}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [8, 8] ) 
 
rZN89 = 	 Parameter(name='rZN89', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN89}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [8, 9] ) 
 
iZN89 = 	 Parameter(name='iZN89', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN89}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [8, 9] ) 
 
rZN91 = 	 Parameter(name='rZN91', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN91}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [9, 1] ) 
 
iZN91 = 	 Parameter(name='iZN91', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN91}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [9, 1] ) 
 
rZN92 = 	 Parameter(name='rZN92', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN92}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [9, 2] ) 
 
iZN92 = 	 Parameter(name='iZN92', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN92}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [9, 2] ) 
 
rZN93 = 	 Parameter(name='rZN93', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN93}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [9, 3] ) 
 
iZN93 = 	 Parameter(name='iZN93', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN93}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [9, 3] ) 
 
rZN94 = 	 Parameter(name='rZN94', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN94}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [9, 4] ) 
 
iZN94 = 	 Parameter(name='iZN94', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN94}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [9, 4] ) 
 
rZN95 = 	 Parameter(name='rZN95', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN95}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [9, 5] ) 
 
iZN95 = 	 Parameter(name='iZN95', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN95}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [9, 5] ) 
 
rZN96 = 	 Parameter(name='rZN96', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN96}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [9, 6] ) 
 
iZN96 = 	 Parameter(name='iZN96', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN96}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [9, 6] ) 
 
rZN97 = 	 Parameter(name='rZN97', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN97}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [9, 7] ) 
 
iZN97 = 	 Parameter(name='iZN97', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN97}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [9, 7] ) 
 
rZN98 = 	 Parameter(name='rZN98', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN98}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [9, 8] ) 
 
iZN98 = 	 Parameter(name='iZN98', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN98}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [9, 8] ) 
 
rZN99 = 	 Parameter(name='rZN99', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN99}', 
	 lhablock = 'NMNMIX', 
	 lhacode = [9, 9] ) 
 
iZN99 = 	 Parameter(name='iZN99', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZN99}', 
	 lhablock = 'IMNMNMIX', 
	 lhacode = [9, 9] ) 
 
rZVL11 = 	 Parameter(name='rZVL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL11}', 
	 lhablock = 'SNULMIX', 
	 lhacode = [1, 1] ) 
 
iZVL11 = 	 Parameter(name='iZVL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL11}', 
	 lhablock = 'IMSNULMIX', 
	 lhacode = [1, 1] ) 
 
rZVL12 = 	 Parameter(name='rZVL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL12}', 
	 lhablock = 'SNULMIX', 
	 lhacode = [1, 2] ) 
 
iZVL12 = 	 Parameter(name='iZVL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL12}', 
	 lhablock = 'IMSNULMIX', 
	 lhacode = [1, 2] ) 
 
rZVL13 = 	 Parameter(name='rZVL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL13}', 
	 lhablock = 'SNULMIX', 
	 lhacode = [1, 3] ) 
 
iZVL13 = 	 Parameter(name='iZVL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL13}', 
	 lhablock = 'IMSNULMIX', 
	 lhacode = [1, 3] ) 
 
rZVL21 = 	 Parameter(name='rZVL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL21}', 
	 lhablock = 'SNULMIX', 
	 lhacode = [2, 1] ) 
 
iZVL21 = 	 Parameter(name='iZVL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL21}', 
	 lhablock = 'IMSNULMIX', 
	 lhacode = [2, 1] ) 
 
rZVL22 = 	 Parameter(name='rZVL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL22}', 
	 lhablock = 'SNULMIX', 
	 lhacode = [2, 2] ) 
 
iZVL22 = 	 Parameter(name='iZVL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL22}', 
	 lhablock = 'IMSNULMIX', 
	 lhacode = [2, 2] ) 
 
rZVL23 = 	 Parameter(name='rZVL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL23}', 
	 lhablock = 'SNULMIX', 
	 lhacode = [2, 3] ) 
 
iZVL23 = 	 Parameter(name='iZVL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL23}', 
	 lhablock = 'IMSNULMIX', 
	 lhacode = [2, 3] ) 
 
rZVL31 = 	 Parameter(name='rZVL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL31}', 
	 lhablock = 'SNULMIX', 
	 lhacode = [3, 1] ) 
 
iZVL31 = 	 Parameter(name='iZVL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL31}', 
	 lhablock = 'IMSNULMIX', 
	 lhacode = [3, 1] ) 
 
rZVL32 = 	 Parameter(name='rZVL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL32}', 
	 lhablock = 'SNULMIX', 
	 lhacode = [3, 2] ) 
 
iZVL32 = 	 Parameter(name='iZVL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL32}', 
	 lhablock = 'IMSNULMIX', 
	 lhacode = [3, 2] ) 
 
rZVL33 = 	 Parameter(name='rZVL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL33}', 
	 lhablock = 'SNULMIX', 
	 lhacode = [3, 3] ) 
 
iZVL33 = 	 Parameter(name='iZVL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVL33}', 
	 lhablock = 'IMSNULMIX', 
	 lhacode = [3, 3] ) 
 
rZVR11 = 	 Parameter(name='rZVR11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR11}', 
	 lhablock = 'SNURMIX', 
	 lhacode = [1, 1] ) 
 
iZVR11 = 	 Parameter(name='iZVR11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR11}', 
	 lhablock = 'IMSNURMIX', 
	 lhacode = [1, 1] ) 
 
rZVR12 = 	 Parameter(name='rZVR12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR12}', 
	 lhablock = 'SNURMIX', 
	 lhacode = [1, 2] ) 
 
iZVR12 = 	 Parameter(name='iZVR12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR12}', 
	 lhablock = 'IMSNURMIX', 
	 lhacode = [1, 2] ) 
 
rZVR13 = 	 Parameter(name='rZVR13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR13}', 
	 lhablock = 'SNURMIX', 
	 lhacode = [1, 3] ) 
 
iZVR13 = 	 Parameter(name='iZVR13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR13}', 
	 lhablock = 'IMSNURMIX', 
	 lhacode = [1, 3] ) 
 
rZVR21 = 	 Parameter(name='rZVR21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR21}', 
	 lhablock = 'SNURMIX', 
	 lhacode = [2, 1] ) 
 
iZVR21 = 	 Parameter(name='iZVR21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR21}', 
	 lhablock = 'IMSNURMIX', 
	 lhacode = [2, 1] ) 
 
rZVR22 = 	 Parameter(name='rZVR22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR22}', 
	 lhablock = 'SNURMIX', 
	 lhacode = [2, 2] ) 
 
iZVR22 = 	 Parameter(name='iZVR22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR22}', 
	 lhablock = 'IMSNURMIX', 
	 lhacode = [2, 2] ) 
 
rZVR23 = 	 Parameter(name='rZVR23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR23}', 
	 lhablock = 'SNURMIX', 
	 lhacode = [2, 3] ) 
 
iZVR23 = 	 Parameter(name='iZVR23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR23}', 
	 lhablock = 'IMSNURMIX', 
	 lhacode = [2, 3] ) 
 
rZVR31 = 	 Parameter(name='rZVR31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR31}', 
	 lhablock = 'SNURMIX', 
	 lhacode = [3, 1] ) 
 
iZVR31 = 	 Parameter(name='iZVR31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR31}', 
	 lhablock = 'IMSNURMIX', 
	 lhacode = [3, 1] ) 
 
rZVR32 = 	 Parameter(name='rZVR32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR32}', 
	 lhablock = 'SNURMIX', 
	 lhacode = [3, 2] ) 
 
iZVR32 = 	 Parameter(name='iZVR32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR32}', 
	 lhablock = 'IMSNURMIX', 
	 lhacode = [3, 2] ) 
 
rZVR33 = 	 Parameter(name='rZVR33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR33}', 
	 lhablock = 'SNURMIX', 
	 lhacode = [3, 3] ) 
 
iZVR33 = 	 Parameter(name='iZVR33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZVR33}', 
	 lhablock = 'IMSNURMIX', 
	 lhacode = [3, 3] ) 
 
rUM11 = 	 Parameter(name='rUM11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UM11}', 
	 lhablock = 'UMIX', 
	 lhacode = [1, 1] ) 
 
iUM11 = 	 Parameter(name='iUM11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UM11}', 
	 lhablock = 'IMUMIX', 
	 lhacode = [1, 1] ) 
 
rUM12 = 	 Parameter(name='rUM12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UM12}', 
	 lhablock = 'UMIX', 
	 lhacode = [1, 2] ) 
 
iUM12 = 	 Parameter(name='iUM12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UM12}', 
	 lhablock = 'IMUMIX', 
	 lhacode = [1, 2] ) 
 
rUM21 = 	 Parameter(name='rUM21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UM21}', 
	 lhablock = 'UMIX', 
	 lhacode = [2, 1] ) 
 
iUM21 = 	 Parameter(name='iUM21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UM21}', 
	 lhablock = 'IMUMIX', 
	 lhacode = [2, 1] ) 
 
rUM22 = 	 Parameter(name='rUM22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UM22}', 
	 lhablock = 'UMIX', 
	 lhacode = [2, 2] ) 
 
iUM22 = 	 Parameter(name='iUM22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UM22}', 
	 lhablock = 'IMUMIX', 
	 lhacode = [2, 2] ) 
 
rUP11 = 	 Parameter(name='rUP11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP11}', 
	 lhablock = 'VMIX', 
	 lhacode = [1, 1] ) 
 
iUP11 = 	 Parameter(name='iUP11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP11}', 
	 lhablock = 'IMVMIX', 
	 lhacode = [1, 1] ) 
 
rUP12 = 	 Parameter(name='rUP12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP12}', 
	 lhablock = 'VMIX', 
	 lhacode = [1, 2] ) 
 
iUP12 = 	 Parameter(name='iUP12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP12}', 
	 lhablock = 'IMVMIX', 
	 lhacode = [1, 2] ) 
 
rUP21 = 	 Parameter(name='rUP21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP21}', 
	 lhablock = 'VMIX', 
	 lhacode = [2, 1] ) 
 
iUP21 = 	 Parameter(name='iUP21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP21}', 
	 lhablock = 'IMVMIX', 
	 lhacode = [2, 1] ) 
 
rUP22 = 	 Parameter(name='rUP22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP22}', 
	 lhablock = 'VMIX', 
	 lhacode = [2, 2] ) 
 
iUP22 = 	 Parameter(name='iUP22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{UP22}', 
	 lhablock = 'IMVMIX', 
	 lhacode = [2, 2] ) 
 
rZEL11 = 	 Parameter(name='rZEL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL11}', 
	 lhablock = 'UELMIX', 
	 lhacode = [1, 1] ) 
 
iZEL11 = 	 Parameter(name='iZEL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL11}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [1, 1] ) 
 
rZEL12 = 	 Parameter(name='rZEL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL12}', 
	 lhablock = 'UELMIX', 
	 lhacode = [1, 2] ) 
 
iZEL12 = 	 Parameter(name='iZEL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL12}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [1, 2] ) 
 
rZEL13 = 	 Parameter(name='rZEL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL13}', 
	 lhablock = 'UELMIX', 
	 lhacode = [1, 3] ) 
 
iZEL13 = 	 Parameter(name='iZEL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL13}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [1, 3] ) 
 
rZEL21 = 	 Parameter(name='rZEL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL21}', 
	 lhablock = 'UELMIX', 
	 lhacode = [2, 1] ) 
 
iZEL21 = 	 Parameter(name='iZEL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL21}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [2, 1] ) 
 
rZEL22 = 	 Parameter(name='rZEL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL22}', 
	 lhablock = 'UELMIX', 
	 lhacode = [2, 2] ) 
 
iZEL22 = 	 Parameter(name='iZEL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL22}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [2, 2] ) 
 
rZEL23 = 	 Parameter(name='rZEL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL23}', 
	 lhablock = 'UELMIX', 
	 lhacode = [2, 3] ) 
 
iZEL23 = 	 Parameter(name='iZEL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL23}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [2, 3] ) 
 
rZEL31 = 	 Parameter(name='rZEL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL31}', 
	 lhablock = 'UELMIX', 
	 lhacode = [3, 1] ) 
 
iZEL31 = 	 Parameter(name='iZEL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL31}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [3, 1] ) 
 
rZEL32 = 	 Parameter(name='rZEL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL32}', 
	 lhablock = 'UELMIX', 
	 lhacode = [3, 2] ) 
 
iZEL32 = 	 Parameter(name='iZEL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL32}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [3, 2] ) 
 
rZEL33 = 	 Parameter(name='rZEL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL33}', 
	 lhablock = 'UELMIX', 
	 lhacode = [3, 3] ) 
 
iZEL33 = 	 Parameter(name='iZEL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZEL33}', 
	 lhablock = 'IMUELMIX', 
	 lhacode = [3, 3] ) 
 
rZER11 = 	 Parameter(name='rZER11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER11}', 
	 lhablock = 'UERMIX', 
	 lhacode = [1, 1] ) 
 
iZER11 = 	 Parameter(name='iZER11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER11}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [1, 1] ) 
 
rZER12 = 	 Parameter(name='rZER12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER12}', 
	 lhablock = 'UERMIX', 
	 lhacode = [1, 2] ) 
 
iZER12 = 	 Parameter(name='iZER12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER12}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [1, 2] ) 
 
rZER13 = 	 Parameter(name='rZER13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER13}', 
	 lhablock = 'UERMIX', 
	 lhacode = [1, 3] ) 
 
iZER13 = 	 Parameter(name='iZER13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER13}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [1, 3] ) 
 
rZER21 = 	 Parameter(name='rZER21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER21}', 
	 lhablock = 'UERMIX', 
	 lhacode = [2, 1] ) 
 
iZER21 = 	 Parameter(name='iZER21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER21}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [2, 1] ) 
 
rZER22 = 	 Parameter(name='rZER22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER22}', 
	 lhablock = 'UERMIX', 
	 lhacode = [2, 2] ) 
 
iZER22 = 	 Parameter(name='iZER22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER22}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [2, 2] ) 
 
rZER23 = 	 Parameter(name='rZER23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER23}', 
	 lhablock = 'UERMIX', 
	 lhacode = [2, 3] ) 
 
iZER23 = 	 Parameter(name='iZER23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER23}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [2, 3] ) 
 
rZER31 = 	 Parameter(name='rZER31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER31}', 
	 lhablock = 'UERMIX', 
	 lhacode = [3, 1] ) 
 
iZER31 = 	 Parameter(name='iZER31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER31}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [3, 1] ) 
 
rZER32 = 	 Parameter(name='rZER32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER32}', 
	 lhablock = 'UERMIX', 
	 lhacode = [3, 2] ) 
 
iZER32 = 	 Parameter(name='iZER32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER32}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [3, 2] ) 
 
rZER33 = 	 Parameter(name='rZER33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER33}', 
	 lhablock = 'UERMIX', 
	 lhacode = [3, 3] ) 
 
iZER33 = 	 Parameter(name='iZER33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZER33}', 
	 lhablock = 'IMUERMIX', 
	 lhacode = [3, 3] ) 
 
rZDL11 = 	 Parameter(name='rZDL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL11}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [1, 1] ) 
 
iZDL11 = 	 Parameter(name='iZDL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL11}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [1, 1] ) 
 
rZDL12 = 	 Parameter(name='rZDL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL12}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [1, 2] ) 
 
iZDL12 = 	 Parameter(name='iZDL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL12}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [1, 2] ) 
 
rZDL13 = 	 Parameter(name='rZDL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL13}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [1, 3] ) 
 
iZDL13 = 	 Parameter(name='iZDL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL13}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [1, 3] ) 
 
rZDL21 = 	 Parameter(name='rZDL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL21}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [2, 1] ) 
 
iZDL21 = 	 Parameter(name='iZDL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL21}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [2, 1] ) 
 
rZDL22 = 	 Parameter(name='rZDL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL22}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [2, 2] ) 
 
iZDL22 = 	 Parameter(name='iZDL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL22}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [2, 2] ) 
 
rZDL23 = 	 Parameter(name='rZDL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL23}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [2, 3] ) 
 
iZDL23 = 	 Parameter(name='iZDL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL23}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [2, 3] ) 
 
rZDL31 = 	 Parameter(name='rZDL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL31}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [3, 1] ) 
 
iZDL31 = 	 Parameter(name='iZDL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL31}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [3, 1] ) 
 
rZDL32 = 	 Parameter(name='rZDL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL32}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [3, 2] ) 
 
iZDL32 = 	 Parameter(name='iZDL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL32}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [3, 2] ) 
 
rZDL33 = 	 Parameter(name='rZDL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL33}', 
	 lhablock = 'UDLMIX', 
	 lhacode = [3, 3] ) 
 
iZDL33 = 	 Parameter(name='iZDL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDL33}', 
	 lhablock = 'IMUDLMIX', 
	 lhacode = [3, 3] ) 
 
rZDR11 = 	 Parameter(name='rZDR11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR11}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [1, 1] ) 
 
iZDR11 = 	 Parameter(name='iZDR11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR11}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [1, 1] ) 
 
rZDR12 = 	 Parameter(name='rZDR12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR12}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [1, 2] ) 
 
iZDR12 = 	 Parameter(name='iZDR12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR12}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [1, 2] ) 
 
rZDR13 = 	 Parameter(name='rZDR13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR13}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [1, 3] ) 
 
iZDR13 = 	 Parameter(name='iZDR13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR13}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [1, 3] ) 
 
rZDR21 = 	 Parameter(name='rZDR21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR21}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [2, 1] ) 
 
iZDR21 = 	 Parameter(name='iZDR21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR21}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [2, 1] ) 
 
rZDR22 = 	 Parameter(name='rZDR22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR22}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [2, 2] ) 
 
iZDR22 = 	 Parameter(name='iZDR22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR22}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [2, 2] ) 
 
rZDR23 = 	 Parameter(name='rZDR23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR23}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [2, 3] ) 
 
iZDR23 = 	 Parameter(name='iZDR23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR23}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [2, 3] ) 
 
rZDR31 = 	 Parameter(name='rZDR31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR31}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [3, 1] ) 
 
iZDR31 = 	 Parameter(name='iZDR31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR31}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [3, 1] ) 
 
rZDR32 = 	 Parameter(name='rZDR32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR32}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [3, 2] ) 
 
iZDR32 = 	 Parameter(name='iZDR32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR32}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [3, 2] ) 
 
rZDR33 = 	 Parameter(name='rZDR33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR33}', 
	 lhablock = 'UDRMIX', 
	 lhacode = [3, 3] ) 
 
iZDR33 = 	 Parameter(name='iZDR33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZDR33}', 
	 lhablock = 'IMUDRMIX', 
	 lhacode = [3, 3] ) 
 
rZUL11 = 	 Parameter(name='rZUL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL11}', 
	 lhablock = 'UULMIX', 
	 lhacode = [1, 1] ) 
 
iZUL11 = 	 Parameter(name='iZUL11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL11}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [1, 1] ) 
 
rZUL12 = 	 Parameter(name='rZUL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL12}', 
	 lhablock = 'UULMIX', 
	 lhacode = [1, 2] ) 
 
iZUL12 = 	 Parameter(name='iZUL12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL12}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [1, 2] ) 
 
rZUL13 = 	 Parameter(name='rZUL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL13}', 
	 lhablock = 'UULMIX', 
	 lhacode = [1, 3] ) 
 
iZUL13 = 	 Parameter(name='iZUL13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL13}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [1, 3] ) 
 
rZUL21 = 	 Parameter(name='rZUL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL21}', 
	 lhablock = 'UULMIX', 
	 lhacode = [2, 1] ) 
 
iZUL21 = 	 Parameter(name='iZUL21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL21}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [2, 1] ) 
 
rZUL22 = 	 Parameter(name='rZUL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL22}', 
	 lhablock = 'UULMIX', 
	 lhacode = [2, 2] ) 
 
iZUL22 = 	 Parameter(name='iZUL22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL22}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [2, 2] ) 
 
rZUL23 = 	 Parameter(name='rZUL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL23}', 
	 lhablock = 'UULMIX', 
	 lhacode = [2, 3] ) 
 
iZUL23 = 	 Parameter(name='iZUL23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL23}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [2, 3] ) 
 
rZUL31 = 	 Parameter(name='rZUL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL31}', 
	 lhablock = 'UULMIX', 
	 lhacode = [3, 1] ) 
 
iZUL31 = 	 Parameter(name='iZUL31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL31}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [3, 1] ) 
 
rZUL32 = 	 Parameter(name='rZUL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL32}', 
	 lhablock = 'UULMIX', 
	 lhacode = [3, 2] ) 
 
iZUL32 = 	 Parameter(name='iZUL32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL32}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [3, 2] ) 
 
rZUL33 = 	 Parameter(name='rZUL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL33}', 
	 lhablock = 'UULMIX', 
	 lhacode = [3, 3] ) 
 
iZUL33 = 	 Parameter(name='iZUL33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUL33}', 
	 lhablock = 'IMUULMIX', 
	 lhacode = [3, 3] ) 
 
rZUR11 = 	 Parameter(name='rZUR11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR11}', 
	 lhablock = 'UURMIX', 
	 lhacode = [1, 1] ) 
 
iZUR11 = 	 Parameter(name='iZUR11', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR11}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [1, 1] ) 
 
rZUR12 = 	 Parameter(name='rZUR12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR12}', 
	 lhablock = 'UURMIX', 
	 lhacode = [1, 2] ) 
 
iZUR12 = 	 Parameter(name='iZUR12', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR12}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [1, 2] ) 
 
rZUR13 = 	 Parameter(name='rZUR13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR13}', 
	 lhablock = 'UURMIX', 
	 lhacode = [1, 3] ) 
 
iZUR13 = 	 Parameter(name='iZUR13', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR13}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [1, 3] ) 
 
rZUR21 = 	 Parameter(name='rZUR21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR21}', 
	 lhablock = 'UURMIX', 
	 lhacode = [2, 1] ) 
 
iZUR21 = 	 Parameter(name='iZUR21', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR21}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [2, 1] ) 
 
rZUR22 = 	 Parameter(name='rZUR22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR22}', 
	 lhablock = 'UURMIX', 
	 lhacode = [2, 2] ) 
 
iZUR22 = 	 Parameter(name='iZUR22', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR22}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [2, 2] ) 
 
rZUR23 = 	 Parameter(name='rZUR23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR23}', 
	 lhablock = 'UURMIX', 
	 lhacode = [2, 3] ) 
 
iZUR23 = 	 Parameter(name='iZUR23', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR23}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [2, 3] ) 
 
rZUR31 = 	 Parameter(name='rZUR31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR31}', 
	 lhablock = 'UURMIX', 
	 lhacode = [3, 1] ) 
 
iZUR31 = 	 Parameter(name='iZUR31', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR31}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [3, 1] ) 
 
rZUR32 = 	 Parameter(name='rZUR32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR32}', 
	 lhablock = 'UURMIX', 
	 lhacode = [3, 2] ) 
 
iZUR32 = 	 Parameter(name='iZUR32', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR32}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [3, 2] ) 
 
rZUR33 = 	 Parameter(name='rZUR33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR33}', 
	 lhablock = 'UURMIX', 
	 lhacode = [3, 3] ) 
 
iZUR33 = 	 Parameter(name='iZUR33', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{ZUR33}', 
	 lhablock = 'IMUURMIX', 
	 lhacode = [3, 3] ) 
 
betaH = 	 Parameter(name='betaH', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1., 
	 texname = '\\text{betaH}', 
	 lhablock = 'HMIX', 
	 lhacode = [10] ) 
 
TWp = 	 Parameter(name='TWp', 
	 nature = 'external', 
	 type = 'real', 
	 value = 1., 
	 texname = '\\text{TWp}', 
	 lhablock = 'ANGLES', 
	 lhacode = [10] ) 
 
aS = 	 Parameter(name='aS', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.119, 
	 texname = '\\text{aS}', 
	 lhablock = 'SMINPUTS', 
	 lhacode = [3] ) 
 
aEWM1 = 	 Parameter(name='aEWM1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 137.035999679, 
	 texname = '\\text{aEWM1}', 
	 lhablock = 'SMINPUTS', 
	 lhacode = [1] ) 
 
Gf = 	 Parameter(name='Gf', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0.0000116639, 
	 texname = '\\text{Gf}', 
	 lhablock = 'SMINPUTS', 
	 lhacode = [2] ) 
 
Yd11 = 	 Parameter(name='Yd11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd11 + complex(0,1)*iYd11', 
	 texname = '\\text{Yd11}' ) 
 
Yd12 = 	 Parameter(name='Yd12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd12 + complex(0,1)*iYd12', 
	 texname = '\\text{Yd12}' ) 
 
Yd13 = 	 Parameter(name='Yd13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd13 + complex(0,1)*iYd13', 
	 texname = '\\text{Yd13}' ) 
 
Yd21 = 	 Parameter(name='Yd21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd21 + complex(0,1)*iYd21', 
	 texname = '\\text{Yd21}' ) 
 
Yd22 = 	 Parameter(name='Yd22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd22 + complex(0,1)*iYd22', 
	 texname = '\\text{Yd22}' ) 
 
Yd23 = 	 Parameter(name='Yd23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd23 + complex(0,1)*iYd23', 
	 texname = '\\text{Yd23}' ) 
 
Yd31 = 	 Parameter(name='Yd31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd31 + complex(0,1)*iYd31', 
	 texname = '\\text{Yd31}' ) 
 
Yd32 = 	 Parameter(name='Yd32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd32 + complex(0,1)*iYd32', 
	 texname = '\\text{Yd32}' ) 
 
Yd33 = 	 Parameter(name='Yd33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYd33 + complex(0,1)*iYd33', 
	 texname = '\\text{Yd33}' ) 
 
Td11 = 	 Parameter(name='Td11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd11 + complex(0,1)*iTd11', 
	 texname = '\\text{Td11}' ) 
 
Td12 = 	 Parameter(name='Td12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd12 + complex(0,1)*iTd12', 
	 texname = '\\text{Td12}' ) 
 
Td13 = 	 Parameter(name='Td13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd13 + complex(0,1)*iTd13', 
	 texname = '\\text{Td13}' ) 
 
Td21 = 	 Parameter(name='Td21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd21 + complex(0,1)*iTd21', 
	 texname = '\\text{Td21}' ) 
 
Td22 = 	 Parameter(name='Td22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd22 + complex(0,1)*iTd22', 
	 texname = '\\text{Td22}' ) 
 
Td23 = 	 Parameter(name='Td23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd23 + complex(0,1)*iTd23', 
	 texname = '\\text{Td23}' ) 
 
Td31 = 	 Parameter(name='Td31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd31 + complex(0,1)*iTd31', 
	 texname = '\\text{Td31}' ) 
 
Td32 = 	 Parameter(name='Td32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd32 + complex(0,1)*iTd32', 
	 texname = '\\text{Td32}' ) 
 
Td33 = 	 Parameter(name='Td33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTd33 + complex(0,1)*iTd33', 
	 texname = '\\text{Td33}' ) 
 
Ye11 = 	 Parameter(name='Ye11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe11 + complex(0,1)*iYe11', 
	 texname = '\\text{Ye11}' ) 
 
Ye12 = 	 Parameter(name='Ye12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe12 + complex(0,1)*iYe12', 
	 texname = '\\text{Ye12}' ) 
 
Ye13 = 	 Parameter(name='Ye13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe13 + complex(0,1)*iYe13', 
	 texname = '\\text{Ye13}' ) 
 
Ye21 = 	 Parameter(name='Ye21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe21 + complex(0,1)*iYe21', 
	 texname = '\\text{Ye21}' ) 
 
Ye22 = 	 Parameter(name='Ye22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe22 + complex(0,1)*iYe22', 
	 texname = '\\text{Ye22}' ) 
 
Ye23 = 	 Parameter(name='Ye23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe23 + complex(0,1)*iYe23', 
	 texname = '\\text{Ye23}' ) 
 
Ye31 = 	 Parameter(name='Ye31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe31 + complex(0,1)*iYe31', 
	 texname = '\\text{Ye31}' ) 
 
Ye32 = 	 Parameter(name='Ye32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe32 + complex(0,1)*iYe32', 
	 texname = '\\text{Ye32}' ) 
 
Ye33 = 	 Parameter(name='Ye33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYe33 + complex(0,1)*iYe33', 
	 texname = '\\text{Ye33}' ) 
 
Te11 = 	 Parameter(name='Te11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe11 + complex(0,1)*iTe11', 
	 texname = '\\text{Te11}' ) 
 
Te12 = 	 Parameter(name='Te12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe12 + complex(0,1)*iTe12', 
	 texname = '\\text{Te12}' ) 
 
Te13 = 	 Parameter(name='Te13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe13 + complex(0,1)*iTe13', 
	 texname = '\\text{Te13}' ) 
 
Te21 = 	 Parameter(name='Te21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe21 + complex(0,1)*iTe21', 
	 texname = '\\text{Te21}' ) 
 
Te22 = 	 Parameter(name='Te22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe22 + complex(0,1)*iTe22', 
	 texname = '\\text{Te22}' ) 
 
Te23 = 	 Parameter(name='Te23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe23 + complex(0,1)*iTe23', 
	 texname = '\\text{Te23}' ) 
 
Te31 = 	 Parameter(name='Te31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe31 + complex(0,1)*iTe31', 
	 texname = '\\text{Te31}' ) 
 
Te32 = 	 Parameter(name='Te32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe32 + complex(0,1)*iTe32', 
	 texname = '\\text{Te32}' ) 
 
Te33 = 	 Parameter(name='Te33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTe33 + complex(0,1)*iTe33', 
	 texname = '\\text{Te33}' ) 
 
lam = 	 Parameter(name='lam', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rlam + complex(0,1)*ilam', 
	 texname = '\\text{lam}' ) 
 
Tlam = 	 Parameter(name='Tlam', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTlam + complex(0,1)*iTlam', 
	 texname = '\\text{Tlam}' ) 
 
Yv11 = 	 Parameter(name='Yv11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYv11 + complex(0,1)*iYv11', 
	 texname = '\\text{Yv11}' ) 
 
Yv12 = 	 Parameter(name='Yv12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYv12 + complex(0,1)*iYv12', 
	 texname = '\\text{Yv12}' ) 
 
Yv13 = 	 Parameter(name='Yv13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYv13 + complex(0,1)*iYv13', 
	 texname = '\\text{Yv13}' ) 
 
Yv21 = 	 Parameter(name='Yv21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYv21 + complex(0,1)*iYv21', 
	 texname = '\\text{Yv21}' ) 
 
Yv22 = 	 Parameter(name='Yv22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYv22 + complex(0,1)*iYv22', 
	 texname = '\\text{Yv22}' ) 
 
Yv23 = 	 Parameter(name='Yv23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYv23 + complex(0,1)*iYv23', 
	 texname = '\\text{Yv23}' ) 
 
Yv31 = 	 Parameter(name='Yv31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYv31 + complex(0,1)*iYv31', 
	 texname = '\\text{Yv31}' ) 
 
Yv32 = 	 Parameter(name='Yv32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYv32 + complex(0,1)*iYv32', 
	 texname = '\\text{Yv32}' ) 
 
Yv33 = 	 Parameter(name='Yv33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYv33 + complex(0,1)*iYv33', 
	 texname = '\\text{Yv33}' ) 
 
Tv11 = 	 Parameter(name='Tv11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTv11 + complex(0,1)*iTv11', 
	 texname = '\\text{Tv11}' ) 
 
Tv12 = 	 Parameter(name='Tv12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTv12 + complex(0,1)*iTv12', 
	 texname = '\\text{Tv12}' ) 
 
Tv13 = 	 Parameter(name='Tv13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTv13 + complex(0,1)*iTv13', 
	 texname = '\\text{Tv13}' ) 
 
Tv21 = 	 Parameter(name='Tv21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTv21 + complex(0,1)*iTv21', 
	 texname = '\\text{Tv21}' ) 
 
Tv22 = 	 Parameter(name='Tv22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTv22 + complex(0,1)*iTv22', 
	 texname = '\\text{Tv22}' ) 
 
Tv23 = 	 Parameter(name='Tv23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTv23 + complex(0,1)*iTv23', 
	 texname = '\\text{Tv23}' ) 
 
Tv31 = 	 Parameter(name='Tv31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTv31 + complex(0,1)*iTv31', 
	 texname = '\\text{Tv31}' ) 
 
Tv32 = 	 Parameter(name='Tv32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTv32 + complex(0,1)*iTv32', 
	 texname = '\\text{Tv32}' ) 
 
Tv33 = 	 Parameter(name='Tv33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTv33 + complex(0,1)*iTv33', 
	 texname = '\\text{Tv33}' ) 
 
kap = 	 Parameter(name='kap', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rkap + complex(0,1)*ikap', 
	 texname = '\\text{kap}' ) 
 
Tk = 	 Parameter(name='Tk', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTk + complex(0,1)*iTk', 
	 texname = '\\text{Tk}' ) 
 
Yu11 = 	 Parameter(name='Yu11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu11 + complex(0,1)*iYu11', 
	 texname = '\\text{Yu11}' ) 
 
Yu12 = 	 Parameter(name='Yu12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu12 + complex(0,1)*iYu12', 
	 texname = '\\text{Yu12}' ) 
 
Yu13 = 	 Parameter(name='Yu13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu13 + complex(0,1)*iYu13', 
	 texname = '\\text{Yu13}' ) 
 
Yu21 = 	 Parameter(name='Yu21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu21 + complex(0,1)*iYu21', 
	 texname = '\\text{Yu21}' ) 
 
Yu22 = 	 Parameter(name='Yu22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu22 + complex(0,1)*iYu22', 
	 texname = '\\text{Yu22}' ) 
 
Yu23 = 	 Parameter(name='Yu23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu23 + complex(0,1)*iYu23', 
	 texname = '\\text{Yu23}' ) 
 
Yu31 = 	 Parameter(name='Yu31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu31 + complex(0,1)*iYu31', 
	 texname = '\\text{Yu31}' ) 
 
Yu32 = 	 Parameter(name='Yu32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu32 + complex(0,1)*iYu32', 
	 texname = '\\text{Yu32}' ) 
 
Yu33 = 	 Parameter(name='Yu33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rYu33 + complex(0,1)*iYu33', 
	 texname = '\\text{Yu33}' ) 
 
Tu11 = 	 Parameter(name='Tu11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu11 + complex(0,1)*iTu11', 
	 texname = '\\text{Tu11}' ) 
 
Tu12 = 	 Parameter(name='Tu12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu12 + complex(0,1)*iTu12', 
	 texname = '\\text{Tu12}' ) 
 
Tu13 = 	 Parameter(name='Tu13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu13 + complex(0,1)*iTu13', 
	 texname = '\\text{Tu13}' ) 
 
Tu21 = 	 Parameter(name='Tu21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu21 + complex(0,1)*iTu21', 
	 texname = '\\text{Tu21}' ) 
 
Tu22 = 	 Parameter(name='Tu22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu22 + complex(0,1)*iTu22', 
	 texname = '\\text{Tu22}' ) 
 
Tu23 = 	 Parameter(name='Tu23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu23 + complex(0,1)*iTu23', 
	 texname = '\\text{Tu23}' ) 
 
Tu31 = 	 Parameter(name='Tu31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu31 + complex(0,1)*iTu31', 
	 texname = '\\text{Tu31}' ) 
 
Tu32 = 	 Parameter(name='Tu32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu32 + complex(0,1)*iTu32', 
	 texname = '\\text{Tu32}' ) 
 
Tu33 = 	 Parameter(name='Tu33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rTu33 + complex(0,1)*iTu33', 
	 texname = '\\text{Tu33}' ) 
 
pG = 	 Parameter(name='pG', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rpG + complex(0,1)*ipG', 
	 texname = '\\text{pG}' ) 
 
ZD11 = 	 Parameter(name='ZD11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD11 + complex(0,1)*iZD11', 
	 texname = '\\text{ZD11}' ) 
 
ZD12 = 	 Parameter(name='ZD12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD12 + complex(0,1)*iZD12', 
	 texname = '\\text{ZD12}' ) 
 
ZD13 = 	 Parameter(name='ZD13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD13 + complex(0,1)*iZD13', 
	 texname = '\\text{ZD13}' ) 
 
ZD14 = 	 Parameter(name='ZD14', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD14 + complex(0,1)*iZD14', 
	 texname = '\\text{ZD14}' ) 
 
ZD15 = 	 Parameter(name='ZD15', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD15 + complex(0,1)*iZD15', 
	 texname = '\\text{ZD15}' ) 
 
ZD16 = 	 Parameter(name='ZD16', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD16 + complex(0,1)*iZD16', 
	 texname = '\\text{ZD16}' ) 
 
ZD21 = 	 Parameter(name='ZD21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD21 + complex(0,1)*iZD21', 
	 texname = '\\text{ZD21}' ) 
 
ZD22 = 	 Parameter(name='ZD22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD22 + complex(0,1)*iZD22', 
	 texname = '\\text{ZD22}' ) 
 
ZD23 = 	 Parameter(name='ZD23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD23 + complex(0,1)*iZD23', 
	 texname = '\\text{ZD23}' ) 
 
ZD24 = 	 Parameter(name='ZD24', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD24 + complex(0,1)*iZD24', 
	 texname = '\\text{ZD24}' ) 
 
ZD25 = 	 Parameter(name='ZD25', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD25 + complex(0,1)*iZD25', 
	 texname = '\\text{ZD25}' ) 
 
ZD26 = 	 Parameter(name='ZD26', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD26 + complex(0,1)*iZD26', 
	 texname = '\\text{ZD26}' ) 
 
ZD31 = 	 Parameter(name='ZD31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD31 + complex(0,1)*iZD31', 
	 texname = '\\text{ZD31}' ) 
 
ZD32 = 	 Parameter(name='ZD32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD32 + complex(0,1)*iZD32', 
	 texname = '\\text{ZD32}' ) 
 
ZD33 = 	 Parameter(name='ZD33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD33 + complex(0,1)*iZD33', 
	 texname = '\\text{ZD33}' ) 
 
ZD34 = 	 Parameter(name='ZD34', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD34 + complex(0,1)*iZD34', 
	 texname = '\\text{ZD34}' ) 
 
ZD35 = 	 Parameter(name='ZD35', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD35 + complex(0,1)*iZD35', 
	 texname = '\\text{ZD35}' ) 
 
ZD36 = 	 Parameter(name='ZD36', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD36 + complex(0,1)*iZD36', 
	 texname = '\\text{ZD36}' ) 
 
ZD41 = 	 Parameter(name='ZD41', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD41 + complex(0,1)*iZD41', 
	 texname = '\\text{ZD41}' ) 
 
ZD42 = 	 Parameter(name='ZD42', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD42 + complex(0,1)*iZD42', 
	 texname = '\\text{ZD42}' ) 
 
ZD43 = 	 Parameter(name='ZD43', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD43 + complex(0,1)*iZD43', 
	 texname = '\\text{ZD43}' ) 
 
ZD44 = 	 Parameter(name='ZD44', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD44 + complex(0,1)*iZD44', 
	 texname = '\\text{ZD44}' ) 
 
ZD45 = 	 Parameter(name='ZD45', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD45 + complex(0,1)*iZD45', 
	 texname = '\\text{ZD45}' ) 
 
ZD46 = 	 Parameter(name='ZD46', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD46 + complex(0,1)*iZD46', 
	 texname = '\\text{ZD46}' ) 
 
ZD51 = 	 Parameter(name='ZD51', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD51 + complex(0,1)*iZD51', 
	 texname = '\\text{ZD51}' ) 
 
ZD52 = 	 Parameter(name='ZD52', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD52 + complex(0,1)*iZD52', 
	 texname = '\\text{ZD52}' ) 
 
ZD53 = 	 Parameter(name='ZD53', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD53 + complex(0,1)*iZD53', 
	 texname = '\\text{ZD53}' ) 
 
ZD54 = 	 Parameter(name='ZD54', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD54 + complex(0,1)*iZD54', 
	 texname = '\\text{ZD54}' ) 
 
ZD55 = 	 Parameter(name='ZD55', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD55 + complex(0,1)*iZD55', 
	 texname = '\\text{ZD55}' ) 
 
ZD56 = 	 Parameter(name='ZD56', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD56 + complex(0,1)*iZD56', 
	 texname = '\\text{ZD56}' ) 
 
ZD61 = 	 Parameter(name='ZD61', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD61 + complex(0,1)*iZD61', 
	 texname = '\\text{ZD61}' ) 
 
ZD62 = 	 Parameter(name='ZD62', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD62 + complex(0,1)*iZD62', 
	 texname = '\\text{ZD62}' ) 
 
ZD63 = 	 Parameter(name='ZD63', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD63 + complex(0,1)*iZD63', 
	 texname = '\\text{ZD63}' ) 
 
ZD64 = 	 Parameter(name='ZD64', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD64 + complex(0,1)*iZD64', 
	 texname = '\\text{ZD64}' ) 
 
ZD65 = 	 Parameter(name='ZD65', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD65 + complex(0,1)*iZD65', 
	 texname = '\\text{ZD65}' ) 
 
ZD66 = 	 Parameter(name='ZD66', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZD66 + complex(0,1)*iZD66', 
	 texname = '\\text{ZD66}' ) 
 
ZV11 = 	 Parameter(name='ZV11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV11 + complex(0,1)*iZV11', 
	 texname = '\\text{ZV11}' ) 
 
ZV12 = 	 Parameter(name='ZV12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV12 + complex(0,1)*iZV12', 
	 texname = '\\text{ZV12}' ) 
 
ZV13 = 	 Parameter(name='ZV13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV13 + complex(0,1)*iZV13', 
	 texname = '\\text{ZV13}' ) 
 
ZV14 = 	 Parameter(name='ZV14', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV14 + complex(0,1)*iZV14', 
	 texname = '\\text{ZV14}' ) 
 
ZV15 = 	 Parameter(name='ZV15', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV15 + complex(0,1)*iZV15', 
	 texname = '\\text{ZV15}' ) 
 
ZV16 = 	 Parameter(name='ZV16', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV16 + complex(0,1)*iZV16', 
	 texname = '\\text{ZV16}' ) 
 
ZV21 = 	 Parameter(name='ZV21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV21 + complex(0,1)*iZV21', 
	 texname = '\\text{ZV21}' ) 
 
ZV22 = 	 Parameter(name='ZV22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV22 + complex(0,1)*iZV22', 
	 texname = '\\text{ZV22}' ) 
 
ZV23 = 	 Parameter(name='ZV23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV23 + complex(0,1)*iZV23', 
	 texname = '\\text{ZV23}' ) 
 
ZV24 = 	 Parameter(name='ZV24', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV24 + complex(0,1)*iZV24', 
	 texname = '\\text{ZV24}' ) 
 
ZV25 = 	 Parameter(name='ZV25', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV25 + complex(0,1)*iZV25', 
	 texname = '\\text{ZV25}' ) 
 
ZV26 = 	 Parameter(name='ZV26', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV26 + complex(0,1)*iZV26', 
	 texname = '\\text{ZV26}' ) 
 
ZV31 = 	 Parameter(name='ZV31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV31 + complex(0,1)*iZV31', 
	 texname = '\\text{ZV31}' ) 
 
ZV32 = 	 Parameter(name='ZV32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV32 + complex(0,1)*iZV32', 
	 texname = '\\text{ZV32}' ) 
 
ZV33 = 	 Parameter(name='ZV33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV33 + complex(0,1)*iZV33', 
	 texname = '\\text{ZV33}' ) 
 
ZV34 = 	 Parameter(name='ZV34', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV34 + complex(0,1)*iZV34', 
	 texname = '\\text{ZV34}' ) 
 
ZV35 = 	 Parameter(name='ZV35', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV35 + complex(0,1)*iZV35', 
	 texname = '\\text{ZV35}' ) 
 
ZV36 = 	 Parameter(name='ZV36', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV36 + complex(0,1)*iZV36', 
	 texname = '\\text{ZV36}' ) 
 
ZV41 = 	 Parameter(name='ZV41', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV41 + complex(0,1)*iZV41', 
	 texname = '\\text{ZV41}' ) 
 
ZV42 = 	 Parameter(name='ZV42', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV42 + complex(0,1)*iZV42', 
	 texname = '\\text{ZV42}' ) 
 
ZV43 = 	 Parameter(name='ZV43', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV43 + complex(0,1)*iZV43', 
	 texname = '\\text{ZV43}' ) 
 
ZV44 = 	 Parameter(name='ZV44', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV44 + complex(0,1)*iZV44', 
	 texname = '\\text{ZV44}' ) 
 
ZV45 = 	 Parameter(name='ZV45', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV45 + complex(0,1)*iZV45', 
	 texname = '\\text{ZV45}' ) 
 
ZV46 = 	 Parameter(name='ZV46', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV46 + complex(0,1)*iZV46', 
	 texname = '\\text{ZV46}' ) 
 
ZV51 = 	 Parameter(name='ZV51', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV51 + complex(0,1)*iZV51', 
	 texname = '\\text{ZV51}' ) 
 
ZV52 = 	 Parameter(name='ZV52', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV52 + complex(0,1)*iZV52', 
	 texname = '\\text{ZV52}' ) 
 
ZV53 = 	 Parameter(name='ZV53', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV53 + complex(0,1)*iZV53', 
	 texname = '\\text{ZV53}' ) 
 
ZV54 = 	 Parameter(name='ZV54', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV54 + complex(0,1)*iZV54', 
	 texname = '\\text{ZV54}' ) 
 
ZV55 = 	 Parameter(name='ZV55', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV55 + complex(0,1)*iZV55', 
	 texname = '\\text{ZV55}' ) 
 
ZV56 = 	 Parameter(name='ZV56', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV56 + complex(0,1)*iZV56', 
	 texname = '\\text{ZV56}' ) 
 
ZV61 = 	 Parameter(name='ZV61', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV61 + complex(0,1)*iZV61', 
	 texname = '\\text{ZV61}' ) 
 
ZV62 = 	 Parameter(name='ZV62', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV62 + complex(0,1)*iZV62', 
	 texname = '\\text{ZV62}' ) 
 
ZV63 = 	 Parameter(name='ZV63', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV63 + complex(0,1)*iZV63', 
	 texname = '\\text{ZV63}' ) 
 
ZV64 = 	 Parameter(name='ZV64', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV64 + complex(0,1)*iZV64', 
	 texname = '\\text{ZV64}' ) 
 
ZV65 = 	 Parameter(name='ZV65', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV65 + complex(0,1)*iZV65', 
	 texname = '\\text{ZV65}' ) 
 
ZV66 = 	 Parameter(name='ZV66', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZV66 + complex(0,1)*iZV66', 
	 texname = '\\text{ZV66}' ) 
 
ZU11 = 	 Parameter(name='ZU11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU11 + complex(0,1)*iZU11', 
	 texname = '\\text{ZU11}' ) 
 
ZU12 = 	 Parameter(name='ZU12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU12 + complex(0,1)*iZU12', 
	 texname = '\\text{ZU12}' ) 
 
ZU13 = 	 Parameter(name='ZU13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU13 + complex(0,1)*iZU13', 
	 texname = '\\text{ZU13}' ) 
 
ZU14 = 	 Parameter(name='ZU14', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU14 + complex(0,1)*iZU14', 
	 texname = '\\text{ZU14}' ) 
 
ZU15 = 	 Parameter(name='ZU15', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU15 + complex(0,1)*iZU15', 
	 texname = '\\text{ZU15}' ) 
 
ZU16 = 	 Parameter(name='ZU16', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU16 + complex(0,1)*iZU16', 
	 texname = '\\text{ZU16}' ) 
 
ZU21 = 	 Parameter(name='ZU21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU21 + complex(0,1)*iZU21', 
	 texname = '\\text{ZU21}' ) 
 
ZU22 = 	 Parameter(name='ZU22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU22 + complex(0,1)*iZU22', 
	 texname = '\\text{ZU22}' ) 
 
ZU23 = 	 Parameter(name='ZU23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU23 + complex(0,1)*iZU23', 
	 texname = '\\text{ZU23}' ) 
 
ZU24 = 	 Parameter(name='ZU24', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU24 + complex(0,1)*iZU24', 
	 texname = '\\text{ZU24}' ) 
 
ZU25 = 	 Parameter(name='ZU25', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU25 + complex(0,1)*iZU25', 
	 texname = '\\text{ZU25}' ) 
 
ZU26 = 	 Parameter(name='ZU26', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU26 + complex(0,1)*iZU26', 
	 texname = '\\text{ZU26}' ) 
 
ZU31 = 	 Parameter(name='ZU31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU31 + complex(0,1)*iZU31', 
	 texname = '\\text{ZU31}' ) 
 
ZU32 = 	 Parameter(name='ZU32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU32 + complex(0,1)*iZU32', 
	 texname = '\\text{ZU32}' ) 
 
ZU33 = 	 Parameter(name='ZU33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU33 + complex(0,1)*iZU33', 
	 texname = '\\text{ZU33}' ) 
 
ZU34 = 	 Parameter(name='ZU34', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU34 + complex(0,1)*iZU34', 
	 texname = '\\text{ZU34}' ) 
 
ZU35 = 	 Parameter(name='ZU35', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU35 + complex(0,1)*iZU35', 
	 texname = '\\text{ZU35}' ) 
 
ZU36 = 	 Parameter(name='ZU36', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU36 + complex(0,1)*iZU36', 
	 texname = '\\text{ZU36}' ) 
 
ZU41 = 	 Parameter(name='ZU41', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU41 + complex(0,1)*iZU41', 
	 texname = '\\text{ZU41}' ) 
 
ZU42 = 	 Parameter(name='ZU42', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU42 + complex(0,1)*iZU42', 
	 texname = '\\text{ZU42}' ) 
 
ZU43 = 	 Parameter(name='ZU43', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU43 + complex(0,1)*iZU43', 
	 texname = '\\text{ZU43}' ) 
 
ZU44 = 	 Parameter(name='ZU44', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU44 + complex(0,1)*iZU44', 
	 texname = '\\text{ZU44}' ) 
 
ZU45 = 	 Parameter(name='ZU45', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU45 + complex(0,1)*iZU45', 
	 texname = '\\text{ZU45}' ) 
 
ZU46 = 	 Parameter(name='ZU46', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU46 + complex(0,1)*iZU46', 
	 texname = '\\text{ZU46}' ) 
 
ZU51 = 	 Parameter(name='ZU51', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU51 + complex(0,1)*iZU51', 
	 texname = '\\text{ZU51}' ) 
 
ZU52 = 	 Parameter(name='ZU52', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU52 + complex(0,1)*iZU52', 
	 texname = '\\text{ZU52}' ) 
 
ZU53 = 	 Parameter(name='ZU53', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU53 + complex(0,1)*iZU53', 
	 texname = '\\text{ZU53}' ) 
 
ZU54 = 	 Parameter(name='ZU54', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU54 + complex(0,1)*iZU54', 
	 texname = '\\text{ZU54}' ) 
 
ZU55 = 	 Parameter(name='ZU55', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU55 + complex(0,1)*iZU55', 
	 texname = '\\text{ZU55}' ) 
 
ZU56 = 	 Parameter(name='ZU56', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU56 + complex(0,1)*iZU56', 
	 texname = '\\text{ZU56}' ) 
 
ZU61 = 	 Parameter(name='ZU61', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU61 + complex(0,1)*iZU61', 
	 texname = '\\text{ZU61}' ) 
 
ZU62 = 	 Parameter(name='ZU62', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU62 + complex(0,1)*iZU62', 
	 texname = '\\text{ZU62}' ) 
 
ZU63 = 	 Parameter(name='ZU63', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU63 + complex(0,1)*iZU63', 
	 texname = '\\text{ZU63}' ) 
 
ZU64 = 	 Parameter(name='ZU64', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU64 + complex(0,1)*iZU64', 
	 texname = '\\text{ZU64}' ) 
 
ZU65 = 	 Parameter(name='ZU65', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU65 + complex(0,1)*iZU65', 
	 texname = '\\text{ZU65}' ) 
 
ZU66 = 	 Parameter(name='ZU66', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZU66 + complex(0,1)*iZU66', 
	 texname = '\\text{ZU66}' ) 
 
ZE11 = 	 Parameter(name='ZE11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE11 + complex(0,1)*iZE11', 
	 texname = '\\text{ZE11}' ) 
 
ZE12 = 	 Parameter(name='ZE12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE12 + complex(0,1)*iZE12', 
	 texname = '\\text{ZE12}' ) 
 
ZE13 = 	 Parameter(name='ZE13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE13 + complex(0,1)*iZE13', 
	 texname = '\\text{ZE13}' ) 
 
ZE14 = 	 Parameter(name='ZE14', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE14 + complex(0,1)*iZE14', 
	 texname = '\\text{ZE14}' ) 
 
ZE15 = 	 Parameter(name='ZE15', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE15 + complex(0,1)*iZE15', 
	 texname = '\\text{ZE15}' ) 
 
ZE16 = 	 Parameter(name='ZE16', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE16 + complex(0,1)*iZE16', 
	 texname = '\\text{ZE16}' ) 
 
ZE21 = 	 Parameter(name='ZE21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE21 + complex(0,1)*iZE21', 
	 texname = '\\text{ZE21}' ) 
 
ZE22 = 	 Parameter(name='ZE22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE22 + complex(0,1)*iZE22', 
	 texname = '\\text{ZE22}' ) 
 
ZE23 = 	 Parameter(name='ZE23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE23 + complex(0,1)*iZE23', 
	 texname = '\\text{ZE23}' ) 
 
ZE24 = 	 Parameter(name='ZE24', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE24 + complex(0,1)*iZE24', 
	 texname = '\\text{ZE24}' ) 
 
ZE25 = 	 Parameter(name='ZE25', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE25 + complex(0,1)*iZE25', 
	 texname = '\\text{ZE25}' ) 
 
ZE26 = 	 Parameter(name='ZE26', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE26 + complex(0,1)*iZE26', 
	 texname = '\\text{ZE26}' ) 
 
ZE31 = 	 Parameter(name='ZE31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE31 + complex(0,1)*iZE31', 
	 texname = '\\text{ZE31}' ) 
 
ZE32 = 	 Parameter(name='ZE32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE32 + complex(0,1)*iZE32', 
	 texname = '\\text{ZE32}' ) 
 
ZE33 = 	 Parameter(name='ZE33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE33 + complex(0,1)*iZE33', 
	 texname = '\\text{ZE33}' ) 
 
ZE34 = 	 Parameter(name='ZE34', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE34 + complex(0,1)*iZE34', 
	 texname = '\\text{ZE34}' ) 
 
ZE35 = 	 Parameter(name='ZE35', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE35 + complex(0,1)*iZE35', 
	 texname = '\\text{ZE35}' ) 
 
ZE36 = 	 Parameter(name='ZE36', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE36 + complex(0,1)*iZE36', 
	 texname = '\\text{ZE36}' ) 
 
ZE41 = 	 Parameter(name='ZE41', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE41 + complex(0,1)*iZE41', 
	 texname = '\\text{ZE41}' ) 
 
ZE42 = 	 Parameter(name='ZE42', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE42 + complex(0,1)*iZE42', 
	 texname = '\\text{ZE42}' ) 
 
ZE43 = 	 Parameter(name='ZE43', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE43 + complex(0,1)*iZE43', 
	 texname = '\\text{ZE43}' ) 
 
ZE44 = 	 Parameter(name='ZE44', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE44 + complex(0,1)*iZE44', 
	 texname = '\\text{ZE44}' ) 
 
ZE45 = 	 Parameter(name='ZE45', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE45 + complex(0,1)*iZE45', 
	 texname = '\\text{ZE45}' ) 
 
ZE46 = 	 Parameter(name='ZE46', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE46 + complex(0,1)*iZE46', 
	 texname = '\\text{ZE46}' ) 
 
ZE51 = 	 Parameter(name='ZE51', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE51 + complex(0,1)*iZE51', 
	 texname = '\\text{ZE51}' ) 
 
ZE52 = 	 Parameter(name='ZE52', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE52 + complex(0,1)*iZE52', 
	 texname = '\\text{ZE52}' ) 
 
ZE53 = 	 Parameter(name='ZE53', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE53 + complex(0,1)*iZE53', 
	 texname = '\\text{ZE53}' ) 
 
ZE54 = 	 Parameter(name='ZE54', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE54 + complex(0,1)*iZE54', 
	 texname = '\\text{ZE54}' ) 
 
ZE55 = 	 Parameter(name='ZE55', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE55 + complex(0,1)*iZE55', 
	 texname = '\\text{ZE55}' ) 
 
ZE56 = 	 Parameter(name='ZE56', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE56 + complex(0,1)*iZE56', 
	 texname = '\\text{ZE56}' ) 
 
ZE61 = 	 Parameter(name='ZE61', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE61 + complex(0,1)*iZE61', 
	 texname = '\\text{ZE61}' ) 
 
ZE62 = 	 Parameter(name='ZE62', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE62 + complex(0,1)*iZE62', 
	 texname = '\\text{ZE62}' ) 
 
ZE63 = 	 Parameter(name='ZE63', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE63 + complex(0,1)*iZE63', 
	 texname = '\\text{ZE63}' ) 
 
ZE64 = 	 Parameter(name='ZE64', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE64 + complex(0,1)*iZE64', 
	 texname = '\\text{ZE64}' ) 
 
ZE65 = 	 Parameter(name='ZE65', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE65 + complex(0,1)*iZE65', 
	 texname = '\\text{ZE65}' ) 
 
ZE66 = 	 Parameter(name='ZE66', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZE66 + complex(0,1)*iZE66', 
	 texname = '\\text{ZE66}' ) 
 
ZH11 = 	 Parameter(name='ZH11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH11 + complex(0,1)*iZH11', 
	 texname = '\\text{ZH11}' ) 
 
ZH12 = 	 Parameter(name='ZH12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH12 + complex(0,1)*iZH12', 
	 texname = '\\text{ZH12}' ) 
 
ZH13 = 	 Parameter(name='ZH13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH13 + complex(0,1)*iZH13', 
	 texname = '\\text{ZH13}' ) 
 
ZH14 = 	 Parameter(name='ZH14', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH14 + complex(0,1)*iZH14', 
	 texname = '\\text{ZH14}' ) 
 
ZH15 = 	 Parameter(name='ZH15', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH15 + complex(0,1)*iZH15', 
	 texname = '\\text{ZH15}' ) 
 
ZH16 = 	 Parameter(name='ZH16', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH16 + complex(0,1)*iZH16', 
	 texname = '\\text{ZH16}' ) 
 
ZH21 = 	 Parameter(name='ZH21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH21 + complex(0,1)*iZH21', 
	 texname = '\\text{ZH21}' ) 
 
ZH22 = 	 Parameter(name='ZH22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH22 + complex(0,1)*iZH22', 
	 texname = '\\text{ZH22}' ) 
 
ZH23 = 	 Parameter(name='ZH23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH23 + complex(0,1)*iZH23', 
	 texname = '\\text{ZH23}' ) 
 
ZH24 = 	 Parameter(name='ZH24', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH24 + complex(0,1)*iZH24', 
	 texname = '\\text{ZH24}' ) 
 
ZH25 = 	 Parameter(name='ZH25', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH25 + complex(0,1)*iZH25', 
	 texname = '\\text{ZH25}' ) 
 
ZH26 = 	 Parameter(name='ZH26', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH26 + complex(0,1)*iZH26', 
	 texname = '\\text{ZH26}' ) 
 
ZH31 = 	 Parameter(name='ZH31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH31 + complex(0,1)*iZH31', 
	 texname = '\\text{ZH31}' ) 
 
ZH32 = 	 Parameter(name='ZH32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH32 + complex(0,1)*iZH32', 
	 texname = '\\text{ZH32}' ) 
 
ZH33 = 	 Parameter(name='ZH33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH33 + complex(0,1)*iZH33', 
	 texname = '\\text{ZH33}' ) 
 
ZH34 = 	 Parameter(name='ZH34', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH34 + complex(0,1)*iZH34', 
	 texname = '\\text{ZH34}' ) 
 
ZH35 = 	 Parameter(name='ZH35', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH35 + complex(0,1)*iZH35', 
	 texname = '\\text{ZH35}' ) 
 
ZH36 = 	 Parameter(name='ZH36', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH36 + complex(0,1)*iZH36', 
	 texname = '\\text{ZH36}' ) 
 
ZH41 = 	 Parameter(name='ZH41', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH41 + complex(0,1)*iZH41', 
	 texname = '\\text{ZH41}' ) 
 
ZH42 = 	 Parameter(name='ZH42', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH42 + complex(0,1)*iZH42', 
	 texname = '\\text{ZH42}' ) 
 
ZH43 = 	 Parameter(name='ZH43', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH43 + complex(0,1)*iZH43', 
	 texname = '\\text{ZH43}' ) 
 
ZH44 = 	 Parameter(name='ZH44', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH44 + complex(0,1)*iZH44', 
	 texname = '\\text{ZH44}' ) 
 
ZH45 = 	 Parameter(name='ZH45', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH45 + complex(0,1)*iZH45', 
	 texname = '\\text{ZH45}' ) 
 
ZH46 = 	 Parameter(name='ZH46', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH46 + complex(0,1)*iZH46', 
	 texname = '\\text{ZH46}' ) 
 
ZH51 = 	 Parameter(name='ZH51', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH51 + complex(0,1)*iZH51', 
	 texname = '\\text{ZH51}' ) 
 
ZH52 = 	 Parameter(name='ZH52', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH52 + complex(0,1)*iZH52', 
	 texname = '\\text{ZH52}' ) 
 
ZH53 = 	 Parameter(name='ZH53', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH53 + complex(0,1)*iZH53', 
	 texname = '\\text{ZH53}' ) 
 
ZH54 = 	 Parameter(name='ZH54', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH54 + complex(0,1)*iZH54', 
	 texname = '\\text{ZH54}' ) 
 
ZH55 = 	 Parameter(name='ZH55', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH55 + complex(0,1)*iZH55', 
	 texname = '\\text{ZH55}' ) 
 
ZH56 = 	 Parameter(name='ZH56', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH56 + complex(0,1)*iZH56', 
	 texname = '\\text{ZH56}' ) 
 
ZH61 = 	 Parameter(name='ZH61', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH61 + complex(0,1)*iZH61', 
	 texname = '\\text{ZH61}' ) 
 
ZH62 = 	 Parameter(name='ZH62', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH62 + complex(0,1)*iZH62', 
	 texname = '\\text{ZH62}' ) 
 
ZH63 = 	 Parameter(name='ZH63', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH63 + complex(0,1)*iZH63', 
	 texname = '\\text{ZH63}' ) 
 
ZH64 = 	 Parameter(name='ZH64', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH64 + complex(0,1)*iZH64', 
	 texname = '\\text{ZH64}' ) 
 
ZH65 = 	 Parameter(name='ZH65', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH65 + complex(0,1)*iZH65', 
	 texname = '\\text{ZH65}' ) 
 
ZH66 = 	 Parameter(name='ZH66', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZH66 + complex(0,1)*iZH66', 
	 texname = '\\text{ZH66}' ) 
 
ZA11 = 	 Parameter(name='ZA11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA11 + complex(0,1)*iZA11', 
	 texname = '\\text{ZA11}' ) 
 
ZA12 = 	 Parameter(name='ZA12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA12 + complex(0,1)*iZA12', 
	 texname = '\\text{ZA12}' ) 
 
ZA13 = 	 Parameter(name='ZA13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA13 + complex(0,1)*iZA13', 
	 texname = '\\text{ZA13}' ) 
 
ZA14 = 	 Parameter(name='ZA14', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA14 + complex(0,1)*iZA14', 
	 texname = '\\text{ZA14}' ) 
 
ZA15 = 	 Parameter(name='ZA15', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA15 + complex(0,1)*iZA15', 
	 texname = '\\text{ZA15}' ) 
 
ZA16 = 	 Parameter(name='ZA16', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA16 + complex(0,1)*iZA16', 
	 texname = '\\text{ZA16}' ) 
 
ZA21 = 	 Parameter(name='ZA21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA21 + complex(0,1)*iZA21', 
	 texname = '\\text{ZA21}' ) 
 
ZA22 = 	 Parameter(name='ZA22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA22 + complex(0,1)*iZA22', 
	 texname = '\\text{ZA22}' ) 
 
ZA23 = 	 Parameter(name='ZA23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA23 + complex(0,1)*iZA23', 
	 texname = '\\text{ZA23}' ) 
 
ZA24 = 	 Parameter(name='ZA24', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA24 + complex(0,1)*iZA24', 
	 texname = '\\text{ZA24}' ) 
 
ZA25 = 	 Parameter(name='ZA25', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA25 + complex(0,1)*iZA25', 
	 texname = '\\text{ZA25}' ) 
 
ZA26 = 	 Parameter(name='ZA26', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA26 + complex(0,1)*iZA26', 
	 texname = '\\text{ZA26}' ) 
 
ZA31 = 	 Parameter(name='ZA31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA31 + complex(0,1)*iZA31', 
	 texname = '\\text{ZA31}' ) 
 
ZA32 = 	 Parameter(name='ZA32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA32 + complex(0,1)*iZA32', 
	 texname = '\\text{ZA32}' ) 
 
ZA33 = 	 Parameter(name='ZA33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA33 + complex(0,1)*iZA33', 
	 texname = '\\text{ZA33}' ) 
 
ZA34 = 	 Parameter(name='ZA34', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA34 + complex(0,1)*iZA34', 
	 texname = '\\text{ZA34}' ) 
 
ZA35 = 	 Parameter(name='ZA35', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA35 + complex(0,1)*iZA35', 
	 texname = '\\text{ZA35}' ) 
 
ZA36 = 	 Parameter(name='ZA36', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA36 + complex(0,1)*iZA36', 
	 texname = '\\text{ZA36}' ) 
 
ZA41 = 	 Parameter(name='ZA41', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA41 + complex(0,1)*iZA41', 
	 texname = '\\text{ZA41}' ) 
 
ZA42 = 	 Parameter(name='ZA42', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA42 + complex(0,1)*iZA42', 
	 texname = '\\text{ZA42}' ) 
 
ZA43 = 	 Parameter(name='ZA43', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA43 + complex(0,1)*iZA43', 
	 texname = '\\text{ZA43}' ) 
 
ZA44 = 	 Parameter(name='ZA44', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA44 + complex(0,1)*iZA44', 
	 texname = '\\text{ZA44}' ) 
 
ZA45 = 	 Parameter(name='ZA45', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA45 + complex(0,1)*iZA45', 
	 texname = '\\text{ZA45}' ) 
 
ZA46 = 	 Parameter(name='ZA46', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA46 + complex(0,1)*iZA46', 
	 texname = '\\text{ZA46}' ) 
 
ZA51 = 	 Parameter(name='ZA51', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA51 + complex(0,1)*iZA51', 
	 texname = '\\text{ZA51}' ) 
 
ZA52 = 	 Parameter(name='ZA52', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA52 + complex(0,1)*iZA52', 
	 texname = '\\text{ZA52}' ) 
 
ZA53 = 	 Parameter(name='ZA53', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA53 + complex(0,1)*iZA53', 
	 texname = '\\text{ZA53}' ) 
 
ZA54 = 	 Parameter(name='ZA54', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA54 + complex(0,1)*iZA54', 
	 texname = '\\text{ZA54}' ) 
 
ZA55 = 	 Parameter(name='ZA55', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA55 + complex(0,1)*iZA55', 
	 texname = '\\text{ZA55}' ) 
 
ZA56 = 	 Parameter(name='ZA56', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA56 + complex(0,1)*iZA56', 
	 texname = '\\text{ZA56}' ) 
 
ZA61 = 	 Parameter(name='ZA61', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA61 + complex(0,1)*iZA61', 
	 texname = '\\text{ZA61}' ) 
 
ZA62 = 	 Parameter(name='ZA62', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA62 + complex(0,1)*iZA62', 
	 texname = '\\text{ZA62}' ) 
 
ZA63 = 	 Parameter(name='ZA63', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA63 + complex(0,1)*iZA63', 
	 texname = '\\text{ZA63}' ) 
 
ZA64 = 	 Parameter(name='ZA64', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA64 + complex(0,1)*iZA64', 
	 texname = '\\text{ZA64}' ) 
 
ZA65 = 	 Parameter(name='ZA65', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA65 + complex(0,1)*iZA65', 
	 texname = '\\text{ZA65}' ) 
 
ZA66 = 	 Parameter(name='ZA66', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZA66 + complex(0,1)*iZA66', 
	 texname = '\\text{ZA66}' ) 
 
ZN11 = 	 Parameter(name='ZN11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN11 + complex(0,1)*iZN11', 
	 texname = '\\text{ZN11}' ) 
 
ZN12 = 	 Parameter(name='ZN12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN12 + complex(0,1)*iZN12', 
	 texname = '\\text{ZN12}' ) 
 
ZN13 = 	 Parameter(name='ZN13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN13 + complex(0,1)*iZN13', 
	 texname = '\\text{ZN13}' ) 
 
ZN14 = 	 Parameter(name='ZN14', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN14 + complex(0,1)*iZN14', 
	 texname = '\\text{ZN14}' ) 
 
ZN15 = 	 Parameter(name='ZN15', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN15 + complex(0,1)*iZN15', 
	 texname = '\\text{ZN15}' ) 
 
ZN16 = 	 Parameter(name='ZN16', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN16 + complex(0,1)*iZN16', 
	 texname = '\\text{ZN16}' ) 
 
ZN17 = 	 Parameter(name='ZN17', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN17 + complex(0,1)*iZN17', 
	 texname = '\\text{ZN17}' ) 
 
ZN18 = 	 Parameter(name='ZN18', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN18 + complex(0,1)*iZN18', 
	 texname = '\\text{ZN18}' ) 
 
ZN19 = 	 Parameter(name='ZN19', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN19 + complex(0,1)*iZN19', 
	 texname = '\\text{ZN19}' ) 
 
ZN21 = 	 Parameter(name='ZN21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN21 + complex(0,1)*iZN21', 
	 texname = '\\text{ZN21}' ) 
 
ZN22 = 	 Parameter(name='ZN22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN22 + complex(0,1)*iZN22', 
	 texname = '\\text{ZN22}' ) 
 
ZN23 = 	 Parameter(name='ZN23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN23 + complex(0,1)*iZN23', 
	 texname = '\\text{ZN23}' ) 
 
ZN24 = 	 Parameter(name='ZN24', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN24 + complex(0,1)*iZN24', 
	 texname = '\\text{ZN24}' ) 
 
ZN25 = 	 Parameter(name='ZN25', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN25 + complex(0,1)*iZN25', 
	 texname = '\\text{ZN25}' ) 
 
ZN26 = 	 Parameter(name='ZN26', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN26 + complex(0,1)*iZN26', 
	 texname = '\\text{ZN26}' ) 
 
ZN27 = 	 Parameter(name='ZN27', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN27 + complex(0,1)*iZN27', 
	 texname = '\\text{ZN27}' ) 
 
ZN28 = 	 Parameter(name='ZN28', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN28 + complex(0,1)*iZN28', 
	 texname = '\\text{ZN28}' ) 
 
ZN29 = 	 Parameter(name='ZN29', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN29 + complex(0,1)*iZN29', 
	 texname = '\\text{ZN29}' ) 
 
ZN31 = 	 Parameter(name='ZN31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN31 + complex(0,1)*iZN31', 
	 texname = '\\text{ZN31}' ) 
 
ZN32 = 	 Parameter(name='ZN32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN32 + complex(0,1)*iZN32', 
	 texname = '\\text{ZN32}' ) 
 
ZN33 = 	 Parameter(name='ZN33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN33 + complex(0,1)*iZN33', 
	 texname = '\\text{ZN33}' ) 
 
ZN34 = 	 Parameter(name='ZN34', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN34 + complex(0,1)*iZN34', 
	 texname = '\\text{ZN34}' ) 
 
ZN35 = 	 Parameter(name='ZN35', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN35 + complex(0,1)*iZN35', 
	 texname = '\\text{ZN35}' ) 
 
ZN36 = 	 Parameter(name='ZN36', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN36 + complex(0,1)*iZN36', 
	 texname = '\\text{ZN36}' ) 
 
ZN37 = 	 Parameter(name='ZN37', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN37 + complex(0,1)*iZN37', 
	 texname = '\\text{ZN37}' ) 
 
ZN38 = 	 Parameter(name='ZN38', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN38 + complex(0,1)*iZN38', 
	 texname = '\\text{ZN38}' ) 
 
ZN39 = 	 Parameter(name='ZN39', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN39 + complex(0,1)*iZN39', 
	 texname = '\\text{ZN39}' ) 
 
ZN41 = 	 Parameter(name='ZN41', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN41 + complex(0,1)*iZN41', 
	 texname = '\\text{ZN41}' ) 
 
ZN42 = 	 Parameter(name='ZN42', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN42 + complex(0,1)*iZN42', 
	 texname = '\\text{ZN42}' ) 
 
ZN43 = 	 Parameter(name='ZN43', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN43 + complex(0,1)*iZN43', 
	 texname = '\\text{ZN43}' ) 
 
ZN44 = 	 Parameter(name='ZN44', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN44 + complex(0,1)*iZN44', 
	 texname = '\\text{ZN44}' ) 
 
ZN45 = 	 Parameter(name='ZN45', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN45 + complex(0,1)*iZN45', 
	 texname = '\\text{ZN45}' ) 
 
ZN46 = 	 Parameter(name='ZN46', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN46 + complex(0,1)*iZN46', 
	 texname = '\\text{ZN46}' ) 
 
ZN47 = 	 Parameter(name='ZN47', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN47 + complex(0,1)*iZN47', 
	 texname = '\\text{ZN47}' ) 
 
ZN48 = 	 Parameter(name='ZN48', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN48 + complex(0,1)*iZN48', 
	 texname = '\\text{ZN48}' ) 
 
ZN49 = 	 Parameter(name='ZN49', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN49 + complex(0,1)*iZN49', 
	 texname = '\\text{ZN49}' ) 
 
ZN51 = 	 Parameter(name='ZN51', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN51 + complex(0,1)*iZN51', 
	 texname = '\\text{ZN51}' ) 
 
ZN52 = 	 Parameter(name='ZN52', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN52 + complex(0,1)*iZN52', 
	 texname = '\\text{ZN52}' ) 
 
ZN53 = 	 Parameter(name='ZN53', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN53 + complex(0,1)*iZN53', 
	 texname = '\\text{ZN53}' ) 
 
ZN54 = 	 Parameter(name='ZN54', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN54 + complex(0,1)*iZN54', 
	 texname = '\\text{ZN54}' ) 
 
ZN55 = 	 Parameter(name='ZN55', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN55 + complex(0,1)*iZN55', 
	 texname = '\\text{ZN55}' ) 
 
ZN56 = 	 Parameter(name='ZN56', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN56 + complex(0,1)*iZN56', 
	 texname = '\\text{ZN56}' ) 
 
ZN57 = 	 Parameter(name='ZN57', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN57 + complex(0,1)*iZN57', 
	 texname = '\\text{ZN57}' ) 
 
ZN58 = 	 Parameter(name='ZN58', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN58 + complex(0,1)*iZN58', 
	 texname = '\\text{ZN58}' ) 
 
ZN59 = 	 Parameter(name='ZN59', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN59 + complex(0,1)*iZN59', 
	 texname = '\\text{ZN59}' ) 
 
ZN61 = 	 Parameter(name='ZN61', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN61 + complex(0,1)*iZN61', 
	 texname = '\\text{ZN61}' ) 
 
ZN62 = 	 Parameter(name='ZN62', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN62 + complex(0,1)*iZN62', 
	 texname = '\\text{ZN62}' ) 
 
ZN63 = 	 Parameter(name='ZN63', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN63 + complex(0,1)*iZN63', 
	 texname = '\\text{ZN63}' ) 
 
ZN64 = 	 Parameter(name='ZN64', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN64 + complex(0,1)*iZN64', 
	 texname = '\\text{ZN64}' ) 
 
ZN65 = 	 Parameter(name='ZN65', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN65 + complex(0,1)*iZN65', 
	 texname = '\\text{ZN65}' ) 
 
ZN66 = 	 Parameter(name='ZN66', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN66 + complex(0,1)*iZN66', 
	 texname = '\\text{ZN66}' ) 
 
ZN67 = 	 Parameter(name='ZN67', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN67 + complex(0,1)*iZN67', 
	 texname = '\\text{ZN67}' ) 
 
ZN68 = 	 Parameter(name='ZN68', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN68 + complex(0,1)*iZN68', 
	 texname = '\\text{ZN68}' ) 
 
ZN69 = 	 Parameter(name='ZN69', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN69 + complex(0,1)*iZN69', 
	 texname = '\\text{ZN69}' ) 
 
ZN71 = 	 Parameter(name='ZN71', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN71 + complex(0,1)*iZN71', 
	 texname = '\\text{ZN71}' ) 
 
ZN72 = 	 Parameter(name='ZN72', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN72 + complex(0,1)*iZN72', 
	 texname = '\\text{ZN72}' ) 
 
ZN73 = 	 Parameter(name='ZN73', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN73 + complex(0,1)*iZN73', 
	 texname = '\\text{ZN73}' ) 
 
ZN74 = 	 Parameter(name='ZN74', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN74 + complex(0,1)*iZN74', 
	 texname = '\\text{ZN74}' ) 
 
ZN75 = 	 Parameter(name='ZN75', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN75 + complex(0,1)*iZN75', 
	 texname = '\\text{ZN75}' ) 
 
ZN76 = 	 Parameter(name='ZN76', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN76 + complex(0,1)*iZN76', 
	 texname = '\\text{ZN76}' ) 
 
ZN77 = 	 Parameter(name='ZN77', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN77 + complex(0,1)*iZN77', 
	 texname = '\\text{ZN77}' ) 
 
ZN78 = 	 Parameter(name='ZN78', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN78 + complex(0,1)*iZN78', 
	 texname = '\\text{ZN78}' ) 
 
ZN79 = 	 Parameter(name='ZN79', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN79 + complex(0,1)*iZN79', 
	 texname = '\\text{ZN79}' ) 
 
ZN81 = 	 Parameter(name='ZN81', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN81 + complex(0,1)*iZN81', 
	 texname = '\\text{ZN81}' ) 
 
ZN82 = 	 Parameter(name='ZN82', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN82 + complex(0,1)*iZN82', 
	 texname = '\\text{ZN82}' ) 
 
ZN83 = 	 Parameter(name='ZN83', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN83 + complex(0,1)*iZN83', 
	 texname = '\\text{ZN83}' ) 
 
ZN84 = 	 Parameter(name='ZN84', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN84 + complex(0,1)*iZN84', 
	 texname = '\\text{ZN84}' ) 
 
ZN85 = 	 Parameter(name='ZN85', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN85 + complex(0,1)*iZN85', 
	 texname = '\\text{ZN85}' ) 
 
ZN86 = 	 Parameter(name='ZN86', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN86 + complex(0,1)*iZN86', 
	 texname = '\\text{ZN86}' ) 
 
ZN87 = 	 Parameter(name='ZN87', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN87 + complex(0,1)*iZN87', 
	 texname = '\\text{ZN87}' ) 
 
ZN88 = 	 Parameter(name='ZN88', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN88 + complex(0,1)*iZN88', 
	 texname = '\\text{ZN88}' ) 
 
ZN89 = 	 Parameter(name='ZN89', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN89 + complex(0,1)*iZN89', 
	 texname = '\\text{ZN89}' ) 
 
ZN91 = 	 Parameter(name='ZN91', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN91 + complex(0,1)*iZN91', 
	 texname = '\\text{ZN91}' ) 
 
ZN92 = 	 Parameter(name='ZN92', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN92 + complex(0,1)*iZN92', 
	 texname = '\\text{ZN92}' ) 
 
ZN93 = 	 Parameter(name='ZN93', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN93 + complex(0,1)*iZN93', 
	 texname = '\\text{ZN93}' ) 
 
ZN94 = 	 Parameter(name='ZN94', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN94 + complex(0,1)*iZN94', 
	 texname = '\\text{ZN94}' ) 
 
ZN95 = 	 Parameter(name='ZN95', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN95 + complex(0,1)*iZN95', 
	 texname = '\\text{ZN95}' ) 
 
ZN96 = 	 Parameter(name='ZN96', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN96 + complex(0,1)*iZN96', 
	 texname = '\\text{ZN96}' ) 
 
ZN97 = 	 Parameter(name='ZN97', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN97 + complex(0,1)*iZN97', 
	 texname = '\\text{ZN97}' ) 
 
ZN98 = 	 Parameter(name='ZN98', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN98 + complex(0,1)*iZN98', 
	 texname = '\\text{ZN98}' ) 
 
ZN99 = 	 Parameter(name='ZN99', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZN99 + complex(0,1)*iZN99', 
	 texname = '\\text{ZN99}' ) 
 
ZVL11 = 	 Parameter(name='ZVL11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVL11 + complex(0,1)*iZVL11', 
	 texname = '\\text{ZVL11}' ) 
 
ZVL12 = 	 Parameter(name='ZVL12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVL12 + complex(0,1)*iZVL12', 
	 texname = '\\text{ZVL12}' ) 
 
ZVL13 = 	 Parameter(name='ZVL13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVL13 + complex(0,1)*iZVL13', 
	 texname = '\\text{ZVL13}' ) 
 
ZVL21 = 	 Parameter(name='ZVL21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVL21 + complex(0,1)*iZVL21', 
	 texname = '\\text{ZVL21}' ) 
 
ZVL22 = 	 Parameter(name='ZVL22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVL22 + complex(0,1)*iZVL22', 
	 texname = '\\text{ZVL22}' ) 
 
ZVL23 = 	 Parameter(name='ZVL23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVL23 + complex(0,1)*iZVL23', 
	 texname = '\\text{ZVL23}' ) 
 
ZVL31 = 	 Parameter(name='ZVL31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVL31 + complex(0,1)*iZVL31', 
	 texname = '\\text{ZVL31}' ) 
 
ZVL32 = 	 Parameter(name='ZVL32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVL32 + complex(0,1)*iZVL32', 
	 texname = '\\text{ZVL32}' ) 
 
ZVL33 = 	 Parameter(name='ZVL33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVL33 + complex(0,1)*iZVL33', 
	 texname = '\\text{ZVL33}' ) 
 
ZVR11 = 	 Parameter(name='ZVR11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVR11 + complex(0,1)*iZVR11', 
	 texname = '\\text{ZVR11}' ) 
 
ZVR12 = 	 Parameter(name='ZVR12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVR12 + complex(0,1)*iZVR12', 
	 texname = '\\text{ZVR12}' ) 
 
ZVR13 = 	 Parameter(name='ZVR13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVR13 + complex(0,1)*iZVR13', 
	 texname = '\\text{ZVR13}' ) 
 
ZVR21 = 	 Parameter(name='ZVR21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVR21 + complex(0,1)*iZVR21', 
	 texname = '\\text{ZVR21}' ) 
 
ZVR22 = 	 Parameter(name='ZVR22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVR22 + complex(0,1)*iZVR22', 
	 texname = '\\text{ZVR22}' ) 
 
ZVR23 = 	 Parameter(name='ZVR23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVR23 + complex(0,1)*iZVR23', 
	 texname = '\\text{ZVR23}' ) 
 
ZVR31 = 	 Parameter(name='ZVR31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVR31 + complex(0,1)*iZVR31', 
	 texname = '\\text{ZVR31}' ) 
 
ZVR32 = 	 Parameter(name='ZVR32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVR32 + complex(0,1)*iZVR32', 
	 texname = '\\text{ZVR32}' ) 
 
ZVR33 = 	 Parameter(name='ZVR33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZVR33 + complex(0,1)*iZVR33', 
	 texname = '\\text{ZVR33}' ) 
 
UM11 = 	 Parameter(name='UM11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUM11 + complex(0,1)*iUM11', 
	 texname = '\\text{UM11}' ) 
 
UM12 = 	 Parameter(name='UM12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUM12 + complex(0,1)*iUM12', 
	 texname = '\\text{UM12}' ) 
 
UM21 = 	 Parameter(name='UM21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUM21 + complex(0,1)*iUM21', 
	 texname = '\\text{UM21}' ) 
 
UM22 = 	 Parameter(name='UM22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUM22 + complex(0,1)*iUM22', 
	 texname = '\\text{UM22}' ) 
 
UP11 = 	 Parameter(name='UP11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUP11 + complex(0,1)*iUP11', 
	 texname = '\\text{UP11}' ) 
 
UP12 = 	 Parameter(name='UP12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUP12 + complex(0,1)*iUP12', 
	 texname = '\\text{UP12}' ) 
 
UP21 = 	 Parameter(name='UP21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUP21 + complex(0,1)*iUP21', 
	 texname = '\\text{UP21}' ) 
 
UP22 = 	 Parameter(name='UP22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rUP22 + complex(0,1)*iUP22', 
	 texname = '\\text{UP22}' ) 
 
ZEL11 = 	 Parameter(name='ZEL11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL11 + complex(0,1)*iZEL11', 
	 texname = '\\text{ZEL11}' ) 
 
ZEL12 = 	 Parameter(name='ZEL12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL12 + complex(0,1)*iZEL12', 
	 texname = '\\text{ZEL12}' ) 
 
ZEL13 = 	 Parameter(name='ZEL13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL13 + complex(0,1)*iZEL13', 
	 texname = '\\text{ZEL13}' ) 
 
ZEL21 = 	 Parameter(name='ZEL21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL21 + complex(0,1)*iZEL21', 
	 texname = '\\text{ZEL21}' ) 
 
ZEL22 = 	 Parameter(name='ZEL22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL22 + complex(0,1)*iZEL22', 
	 texname = '\\text{ZEL22}' ) 
 
ZEL23 = 	 Parameter(name='ZEL23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL23 + complex(0,1)*iZEL23', 
	 texname = '\\text{ZEL23}' ) 
 
ZEL31 = 	 Parameter(name='ZEL31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL31 + complex(0,1)*iZEL31', 
	 texname = '\\text{ZEL31}' ) 
 
ZEL32 = 	 Parameter(name='ZEL32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL32 + complex(0,1)*iZEL32', 
	 texname = '\\text{ZEL32}' ) 
 
ZEL33 = 	 Parameter(name='ZEL33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZEL33 + complex(0,1)*iZEL33', 
	 texname = '\\text{ZEL33}' ) 
 
ZER11 = 	 Parameter(name='ZER11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER11 + complex(0,1)*iZER11', 
	 texname = '\\text{ZER11}' ) 
 
ZER12 = 	 Parameter(name='ZER12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER12 + complex(0,1)*iZER12', 
	 texname = '\\text{ZER12}' ) 
 
ZER13 = 	 Parameter(name='ZER13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER13 + complex(0,1)*iZER13', 
	 texname = '\\text{ZER13}' ) 
 
ZER21 = 	 Parameter(name='ZER21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER21 + complex(0,1)*iZER21', 
	 texname = '\\text{ZER21}' ) 
 
ZER22 = 	 Parameter(name='ZER22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER22 + complex(0,1)*iZER22', 
	 texname = '\\text{ZER22}' ) 
 
ZER23 = 	 Parameter(name='ZER23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER23 + complex(0,1)*iZER23', 
	 texname = '\\text{ZER23}' ) 
 
ZER31 = 	 Parameter(name='ZER31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER31 + complex(0,1)*iZER31', 
	 texname = '\\text{ZER31}' ) 
 
ZER32 = 	 Parameter(name='ZER32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER32 + complex(0,1)*iZER32', 
	 texname = '\\text{ZER32}' ) 
 
ZER33 = 	 Parameter(name='ZER33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZER33 + complex(0,1)*iZER33', 
	 texname = '\\text{ZER33}' ) 
 
ZDL11 = 	 Parameter(name='ZDL11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL11 + complex(0,1)*iZDL11', 
	 texname = '\\text{ZDL11}' ) 
 
ZDL12 = 	 Parameter(name='ZDL12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL12 + complex(0,1)*iZDL12', 
	 texname = '\\text{ZDL12}' ) 
 
ZDL13 = 	 Parameter(name='ZDL13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL13 + complex(0,1)*iZDL13', 
	 texname = '\\text{ZDL13}' ) 
 
ZDL21 = 	 Parameter(name='ZDL21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL21 + complex(0,1)*iZDL21', 
	 texname = '\\text{ZDL21}' ) 
 
ZDL22 = 	 Parameter(name='ZDL22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL22 + complex(0,1)*iZDL22', 
	 texname = '\\text{ZDL22}' ) 
 
ZDL23 = 	 Parameter(name='ZDL23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL23 + complex(0,1)*iZDL23', 
	 texname = '\\text{ZDL23}' ) 
 
ZDL31 = 	 Parameter(name='ZDL31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL31 + complex(0,1)*iZDL31', 
	 texname = '\\text{ZDL31}' ) 
 
ZDL32 = 	 Parameter(name='ZDL32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL32 + complex(0,1)*iZDL32', 
	 texname = '\\text{ZDL32}' ) 
 
ZDL33 = 	 Parameter(name='ZDL33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDL33 + complex(0,1)*iZDL33', 
	 texname = '\\text{ZDL33}' ) 
 
ZDR11 = 	 Parameter(name='ZDR11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR11 + complex(0,1)*iZDR11', 
	 texname = '\\text{ZDR11}' ) 
 
ZDR12 = 	 Parameter(name='ZDR12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR12 + complex(0,1)*iZDR12', 
	 texname = '\\text{ZDR12}' ) 
 
ZDR13 = 	 Parameter(name='ZDR13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR13 + complex(0,1)*iZDR13', 
	 texname = '\\text{ZDR13}' ) 
 
ZDR21 = 	 Parameter(name='ZDR21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR21 + complex(0,1)*iZDR21', 
	 texname = '\\text{ZDR21}' ) 
 
ZDR22 = 	 Parameter(name='ZDR22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR22 + complex(0,1)*iZDR22', 
	 texname = '\\text{ZDR22}' ) 
 
ZDR23 = 	 Parameter(name='ZDR23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR23 + complex(0,1)*iZDR23', 
	 texname = '\\text{ZDR23}' ) 
 
ZDR31 = 	 Parameter(name='ZDR31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR31 + complex(0,1)*iZDR31', 
	 texname = '\\text{ZDR31}' ) 
 
ZDR32 = 	 Parameter(name='ZDR32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR32 + complex(0,1)*iZDR32', 
	 texname = '\\text{ZDR32}' ) 
 
ZDR33 = 	 Parameter(name='ZDR33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZDR33 + complex(0,1)*iZDR33', 
	 texname = '\\text{ZDR33}' ) 
 
ZUL11 = 	 Parameter(name='ZUL11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL11 + complex(0,1)*iZUL11', 
	 texname = '\\text{ZUL11}' ) 
 
ZUL12 = 	 Parameter(name='ZUL12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL12 + complex(0,1)*iZUL12', 
	 texname = '\\text{ZUL12}' ) 
 
ZUL13 = 	 Parameter(name='ZUL13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL13 + complex(0,1)*iZUL13', 
	 texname = '\\text{ZUL13}' ) 
 
ZUL21 = 	 Parameter(name='ZUL21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL21 + complex(0,1)*iZUL21', 
	 texname = '\\text{ZUL21}' ) 
 
ZUL22 = 	 Parameter(name='ZUL22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL22 + complex(0,1)*iZUL22', 
	 texname = '\\text{ZUL22}' ) 
 
ZUL23 = 	 Parameter(name='ZUL23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL23 + complex(0,1)*iZUL23', 
	 texname = '\\text{ZUL23}' ) 
 
ZUL31 = 	 Parameter(name='ZUL31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL31 + complex(0,1)*iZUL31', 
	 texname = '\\text{ZUL31}' ) 
 
ZUL32 = 	 Parameter(name='ZUL32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL32 + complex(0,1)*iZUL32', 
	 texname = '\\text{ZUL32}' ) 
 
ZUL33 = 	 Parameter(name='ZUL33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUL33 + complex(0,1)*iZUL33', 
	 texname = '\\text{ZUL33}' ) 
 
ZUR11 = 	 Parameter(name='ZUR11', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR11 + complex(0,1)*iZUR11', 
	 texname = '\\text{ZUR11}' ) 
 
ZUR12 = 	 Parameter(name='ZUR12', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR12 + complex(0,1)*iZUR12', 
	 texname = '\\text{ZUR12}' ) 
 
ZUR13 = 	 Parameter(name='ZUR13', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR13 + complex(0,1)*iZUR13', 
	 texname = '\\text{ZUR13}' ) 
 
ZUR21 = 	 Parameter(name='ZUR21', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR21 + complex(0,1)*iZUR21', 
	 texname = '\\text{ZUR21}' ) 
 
ZUR22 = 	 Parameter(name='ZUR22', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR22 + complex(0,1)*iZUR22', 
	 texname = '\\text{ZUR22}' ) 
 
ZUR23 = 	 Parameter(name='ZUR23', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR23 + complex(0,1)*iZUR23', 
	 texname = '\\text{ZUR23}' ) 
 
ZUR31 = 	 Parameter(name='ZUR31', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR31 + complex(0,1)*iZUR31', 
	 texname = '\\text{ZUR31}' ) 
 
ZUR32 = 	 Parameter(name='ZUR32', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR32 + complex(0,1)*iZUR32', 
	 texname = '\\text{ZUR32}' ) 
 
ZUR33 = 	 Parameter(name='ZUR33', 
	 nature = 'internal', 
	 type = 'complex', 
	 value = 'rZUR33 + complex(0,1)*iZUR33', 
	 texname = '\\text{ZUR33}' ) 
 
G = 	 Parameter(name='G', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '2*cmath.sqrt(aS)*cmath.sqrt(cmath.pi)', 
	 texname = 'G') 
 
ZP11 = 	 Parameter(name='ZP11', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '-cmath.cos(betaH)', 
	 texname = 'ZP11') 
 
ZP12 = 	 Parameter(name='ZP12', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.sin(betaH)', 
	 texname = 'ZP12') 
 
ZP21 = 	 Parameter(name='ZP21', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.sin(betaH)', 
	 texname = 'ZP21') 
 
ZP22 = 	 Parameter(name='ZP22', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.cos(betaH)', 
	 texname = 'ZP22') 
 
el = 	 Parameter(name='el', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '2*cmath.sqrt(1/aEWM1)*cmath.sqrt(cmath.pi)', 
	 texname = 'el') 
 
MWm = 	 Parameter(name='MWm', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.sqrt(MZ**2/2. + cmath.sqrt(MZ**4/4. - (MZ**2*cmath.pi)/(cmath.sqrt(2)*aEWM1*Gf)))', 
	 texname = 'MWm') 
 
TW = 	 Parameter(name='TW', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'cmath.asin(cmath.sqrt(1 - MWm**2/MZ**2))', 
	 texname = 'TW') 
 
g1 = 	 Parameter(name='g1', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'el*1./cmath.cos(TW)', 
	 texname = 'g1') 
 
g2 = 	 Parameter(name='g2', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'el*1./cmath.sin(TW)', 
	 texname = 'g2') 
 
v = 	 Parameter(name='v', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '2*cmath.sqrt(MWm**2/g2**2)', 
	 texname = 'v') 
 
vd = 	 Parameter(name='vd', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'v*cmath.cos(betaH)', 
	 texname = 'vd') 
 
vu = 	 Parameter(name='vu', 
	 nature = 'internal', 
	 type = 'real', 
	 value = 'v*cmath.sin(betaH)', 
	 texname = 'vu') 
 
RXiWm = 	 Parameter(name='RXiWm', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '1.', 
	 texname = 'RXiWm') 
 
RXiZ = 	 Parameter(name='RXiZ', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '1.', 
	 texname = 'RXiZ') 
 
RXiZp = 	 Parameter(name='RXiZp', 
	 nature = 'internal', 
	 type = 'real', 
	 value = '1.', 
	 texname = 'RXiZp') 
 
HPP1 = 	 Parameter(name='HPP1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HPP1}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [25,22,22] ) 
 
HGG1 = 	 Parameter(name='HGG1', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HGG1}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [25,21,21] ) 
 
HPP2 = 	 Parameter(name='HPP2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HPP2}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [35,22,22] ) 
 
HGG2 = 	 Parameter(name='HGG2', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HGG2}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [35,21,21] ) 
 
HPP3 = 	 Parameter(name='HPP3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HPP3}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [45,22,22] ) 
 
HGG3 = 	 Parameter(name='HGG3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HGG3}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [45,21,21] ) 
 
HPP4 = 	 Parameter(name='HPP4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HPP4}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [55,22,22] ) 
 
HGG4 = 	 Parameter(name='HGG4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HGG4}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [55,21,21] ) 
 
HPP5 = 	 Parameter(name='HPP5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HPP5}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [65,22,22] ) 
 
HGG5 = 	 Parameter(name='HGG5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HGG5}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [65,21,21] ) 
 
HPP6 = 	 Parameter(name='HPP6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HPP6}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [75,22,22] ) 
 
HGG6 = 	 Parameter(name='HGG6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{HGG6}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [75,21,21] ) 
 
APP3 = 	 Parameter(name='APP3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{APP3}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [36,22,22] ) 
 
AGG3 = 	 Parameter(name='AGG3', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{AGG3}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [36,21,21] ) 
 
APP4 = 	 Parameter(name='APP4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{APP4}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [46,22,22] ) 
 
AGG4 = 	 Parameter(name='AGG4', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{AGG4}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [46,21,21] ) 
 
APP5 = 	 Parameter(name='APP5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{APP5}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [56,22,22] ) 
 
AGG5 = 	 Parameter(name='AGG5', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{AGG5}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [56,21,21] ) 
 
APP6 = 	 Parameter(name='APP6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{APP6}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [66,22,22] ) 
 
AGG6 = 	 Parameter(name='AGG6', 
	 nature = 'external', 
	 type = 'real', 
	 value = 0., 
	 texname = '\\text{AGG6}', 
	 lhablock = 'EFFHIGGSCOUPLINGS', 
	 lhacode = [66,21,21] ) 
 
