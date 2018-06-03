function [chain, eq0Var, lbd, ubd] ...
    = genEqIneq(uniqueSupport, I01, Icomp, nonneg)
%%GENEQINEQ   Generate chain, Eq 
%   
% uniqueSupport must be sorted with respect to degree
% in order to allow the simple expression of chain.

    Ibox = true(1, size(uniqueSupport, 2));
    Ibox(I01) = false; % just Ibox = ~I01;

    function idxcell = myfunc(idx)
        if length(idx) == 1
            idxcell = {[]};
        else
            idxcell = {sparse(idx, 1, ones(length(idx), 1), numvar, 1)};
        end
    end

    if any(Ibox)
        tmpSupport = uniqueSupport;

        gcdBox = colgcdsp(uniqueSupport(:, Ibox)')';
        for ii = find(Ibox)
            tmpSupport(:, ii) = uniqueSupport(:, ii) ./ gcdBox;
        end

        [~, ~, ic] = fastUnique(tmpSupport); 
        numvar = length(ic);

        isNotSingleton = accumarray(ic, 1) > 1;
        intoChain = isNotSingleton(ic);
        chain = accumarray(ic(intoChain), find(intoChain), [], @myfunc);
        chain = logical(cell2mat(chain'));
    else
        chain = logical([]);
    end

    %gen Eq0 and cut chain
    numSDPvar = size(uniqueSupport, 1);

    eq0Var = false(numSDPvar, 1);
    boolSupport = logical(uniqueSupport);
    for ii = 1:size(Icomp, 1)
        iicomp = Icomp(ii, :); % full?
        tmp = boolSupport(:, iicomp);
        tmpAll = all(tmp, 2); % all() was very slow on Matlab 2016b/Mac
%         tmpAll = tmp(:, 1);
%         for jj = 2:size(tmp, 2) 
%             tmpAll = tmpAll & tmp(:, jj);  
%         end
        eq0Var = eq0Var | tmpAll;
    end
    eq0Var2 = dnf(boolSupport, Icomp');
    if ~isequal(eq0Var, eq0Var2); error('dnf error'); end
    
    deg = sum(Icomp, 2);
    tmp = false(numSDPvar, max(deg));
    eq0Var2 = false(numSDPvar, 1);
    for ii = 1:size(Icomp, 1)
        iicomp = Icomp(ii, :);
        iideg = deg(ii);
        tmp(:, 1:iideg) = ~boolSupport(:, iicomp);
        eq0Var2 = eq0Var2 | ~any(tmp(:, 1:iideg), 2);
    end
    if ~isequal(eq0Var, eq0Var2); error('error'); end


    if nonneg
        lbd = zeros(numSDPvar, 1);
    else
        lbd = - 1e20 * ones(numSDPvar, 1);
    end
    ubd = 1e20 * ones(numSDPvar, 1);
    lbd(eq0Var) = 0;
    ubd(eq0Var) = 0;

    if isempty(chain)
        chain = sparse(size(uniqueSupport, 1), 0);
    else
        addchain = sparse(1, 1, false, size(chain, 1), size(chain, 2), nnz(chain));
        for ii = 1:size(chain, 2)
            chain0 = chain(:, ii) & eq0Var;

            top0 = find(chain0, 1, 'first');
            end0 = find(chain0, 1, 'last');

            lbd(1:end0) = lbd(1:end0) .* ~chain(1:end0, ii);
            ubd(top0:end) = ubd(top0:end) .* ~chain(top0:end, ii);

            addchain(end0+1:end, ii) = chain(end0+1:end, ii); % would not be so slow.
            chain(top0:end, ii) = 0;
        end
        chain = [chain, addchain];
    end
    chain = chain(:, sum(chain, 1) >= 2);

end