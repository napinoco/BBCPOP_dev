(1)
BBCPOP.m can be combinedly used with general SDP solvers, 
SDPNAL+, SeDuMi, SDPT3, SDPA and MOSEK by specifying 

params.solver = 'sdpnalplus', 'sedumi', 'sdpt3', 'sdpa' and 'mosek',
 
respectively (Installation of the corresponding SDP solver is necessary). 

For example:  

>>[objPoly, I01, Icomp] = example1;
>>relaxOrder = 2; params.solver='sdpnalplus';
>>[sol, info] = BCCPOP(objPoly, I01, Icomp, relaxOrder, params);

(2)
To solve randomly generated POP instances in the directory instances/randomPOP 
and QAP instances in the directory instances/QAP/qapdata, the user can use 
the following functions.

advancedUse/experiment/POPrandom/
solvePOPdense(degree,nDim,isBin,addComplement,solver);
% where params.solver \in \{'BP','sdpnalplus', 'sedumi'\}

advancedUse/experiment/POPrandom/
solvePOParrow(degree,a,b,c,l,isBin,addComplement,solver);
% where params.solver \in \{'BP','sdpnalplus', 'sedumi'\}

advancedUse/experiment/POPrandom/
solvePOPchordal(degree,nDim,radiorange,isBin,addComplement,solver); 
% where params.solver \in \{'BP','sdpnalplus', 'sedumi'\}

advancedUse/experiment/QAP
solveQAP(instance, solver, lambda); 
% where params.solver \in \{'BP','sdpnalplus'\}

(3)
For numerical experiment of randomly generated POP instances:  
advancedUse/experiment/POPrandom/expPOP

(4)
For numerical experiment of QAP instances: 
advancedUse/experiment/QAP/expQAP
