** To install **

1) Download BBCPOPv1.0.tar.gz ad unpack it any place folder you like. 

2) Set MATLAB-path to BBCPOPv1.0 and its subdirectories. 

3) Executable mex functions have already been prepared for 64bit Windows, OS X, and Linux.
If these functions do not work, please execute recompile.m.

4) Now you are ready to use BBCPOP. Test it by typing
>> [objPoly, I01, Icomp, relaxOrder, params] = example1;
>> [sol, info] = BBCPOP(objPoly, I01, Icomp, relaxOrder, params);

** Some other examples. 

Dense POP example:  
>> degree=3; nDim=5; isBin=true; addComplement=false; 
>> [objPoly,I01,Icomp,relaxOrder,params] = genPOPdense(degree,nDim,isBin,addComplement); 
>> [sol, info] = BBCPOP(objPoly, I01, Icomp, relaxOrder, params);

Arrow type sparse POP example 
>> degree=4; a=10; b=2; c=2; l=3; isBin=0; addComplement=true; 
>> [objPoly, I01, Icomp, relaxOrder, params] = genPOParrow(degree,a,b,c,l,isBin,addComplement);
>> [sol, info] = BBCPOP(objPoly, I01, Icomp, relaxOrder, params);

Chordal graph type sparse POP example: 
>> degree=3; nDim=100; radiorange=0.1; isBin=1; addComplement=false;
>> [objPoly, I01, Icomp, relaxOrder, params] = genPOPchordal(degree,nDim,radiorange,isBin,addComplement);
>> [sol, info] = BBCPOP(objPoly, I01, Icomp, relaxOrder, params);

QAP example:
>> instance='chr12a'; lambda=100000; 
>> [objPoly, I01, Icomp, relaxOrder, params] = qapreadBP(instance,lambda);
>> [sol, info] = BBCPOP(objPoly, I01, Icomp, relaxOrder, params);

BIQ example:
>> instance='bqp100-1'; lambda=10000;
>> [objPoly, I01, Icomp, relaxOrder, params] = biqreadBP(instance,lambda);
>> [sol, info] = BBCPOP(objPoly, I01, Icomp, relaxOrder, params);

Help messages are available for most functions. 
Try, for example, 
>> help BBCPOP

Reference

N. Ito, S. Kim, M. Kojima, A. Takeda, and K.-C. Toh.
A Sparse Doubly Nonnegative Relaxation of Polynomial Optimization Problems
with Binary, Box and Complementarity Constraints. 
Research Rport B-489, Department of Mathematical and Computing Sciences, 
Oh-Okayama, Meguro-ku, Tokyo 152-8552, March 2018. 

N. Ito, S. Kim, M. Kojima, A. Takeda, and K.-C. Toh.
User Manual for BBCPOP:  A Sparse Doubly Nonnegative Relaxation
of Polynomial Optimization Problems with Binary, Box and Complementarity 
Constraints.
Research Rport B-490, Department of Mathematical and Computing Sciences, 
Oh-Okayama, Meguro-ku, Tokyo 152-8552, March 2018. 
