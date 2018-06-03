#include <vector>
#include <limits>
#include <queue>
#include <string.h>
#include "mex.h"
#include "matrix.h"


void mexFunction(int nlhs,   mxArray  *plhs[], 
                 int nrhs,   const mxArray  *prhs[] )
{
/* CHECK FOR PROPER NUMBER OF ARGUMENTS */

    if ((nrhs != 2) || (nlhs != 1)) { mexErrMsgTxt("Usage: eq0Var = dnf(boolSupport, Icomp)"); }

/* Check the proper input type */
    if (!mxIsSparse(prhs[0])) { mexErrMsgTxt("boolSupport must be sparse."); }
    if (!mxIsSparse(prhs[1])) { mexErrMsgTxt("Icomp must be sparse."); }

/* Read inputs */
    mwSize m = mxGetM(prhs[0]);
    mwSize n = mxGetN(prhs[0]);
    mwSize l = mxGetN(prhs[1]);
    mwSize n2 = mxGetM(prhs[1]);
    if (n != n2) {
        if (n == l) {
            mexErrMsgTxt("Column dimension of boolSupport and Icomp must agree; Try to use transpose of Icomp.");
        } else {
            mexErrMsgTxt("Column dimension of boolSupport and Icomp must agree.");
        }
    }

    bool *pr_s = (bool *)mxGetData(prhs[0]);
    mwIndex *jc_s = mxGetJc(prhs[0]);
    mwIndex *ir_s = mxGetIr(prhs[0]);
    bool *pr_c = (bool *)mxGetPr(prhs[1]);
    mwIndex *jc_c = mxGetJc(prhs[1]);
    mwIndex *ir_c = mxGetIr(prhs[1]);

/* Allocate space for output vector */
    plhs[0] = mxCreateLogicalMatrix(m, 1);
    bool *eq0Var = (bool *)mxGetData(plhs[0]);

/* solve */
    std::vector<mwIndex> swap;
    std::vector<mwIndex> tmp1; tmp1.reserve(m);
    std::vector<mwIndex> tmp2; tmp2.reserve(m);
    std::vector<mwIndex> res; res.reserve(m);
    for (mwIndex it = 0; it < l; it++) {
        tmp1.clear();
        for (mwIndex fill = 0; fill < m; fill++) {
            tmp1.push_back(fill);
        }
        for (mwIndex p = jc_c[it]; p < jc_c[it+1]; p++) {
            mwIndex q = ir_c[p];
            tmp2.clear();
            res.clear();
            for (mwIndex r = jc_s[q]; r < jc_s[q+1]; r++){
                tmp2.push_back(ir_s[r]);
            }
            std::set_intersection(tmp1.begin(), tmp1.end(), tmp2.begin(), tmp2.end(), std::inserter(res, res.end()));
            swap = tmp1;
            tmp1 = res;
            res = swap;
        }
        for (mwIndex s = 0; s < tmp1.size(); s++) {
            eq0Var[tmp1[s]] = true;
        }
    }
}


