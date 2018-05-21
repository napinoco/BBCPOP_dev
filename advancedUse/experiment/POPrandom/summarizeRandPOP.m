id = @(x) mean(x);
%%
ta = readtable('solvePOPchordal.csv');
ce = table2cell(ta);
%[bin d n], [comp solver], [LBv time iter bpiter term]
out= pivottable(ce, [4 1 2], [5 7], [8 9 10 12 11], {id,id,id,id,id});

formatSpecIdx = '%d & %d & %d';
formatSpecVal = ' & %1.6e & %1.2e & %d & %d & %d';
formatSpec = [formatSpecIdx repmat(formatSpecVal, 1, 4) '\\\\\n'];

fileID = fopen('celldata.txt','w');
[nrows,ncols] = size(out);
for row = 3:nrows
    fprintf(fileID, formatSpec, out{row,:});
end
fclose(fileID);

%%
ta = readtable('solvePOParrow.csv');
ce = table2cell(ta);
%[bin d n], [comp solver], [LBv time iter bpiter term]
out= pivottable(ce, [7 1 2], [8 10], [11 12 13 15 14], {id,id,id,id,id});

formatSpecIdx = '%d & %d & %d';
formatSpecVal = ' & %1.6e & %1.2e & %d & %d & %d';
formatSpec = [formatSpecIdx repmat(formatSpecVal, 1, 4) '\\\\\n'];

fileID = fopen('celldata.txt','w');
[nrows,ncols] = size(out);
for row = 3:nrows
    fprintf(fileID, formatSpec, out{row,:});
end
fclose(fileID);


%%
ta = readtable('solvePOPdense.csv');
ce = table2cell(ta);
%[bin d n], [comp solver], [LBv time iter bpiter term]

out= pivottable(ce, [3 1 2], [4 6], [7 8 9 11 10], {id,id,id,id,id});

formatSpecIdx = '%d & %d & %d';
formatSpecVal = ' & %1.6e & %1.2e & %d & %d & %d';
formatSpec = [formatSpecIdx repmat(formatSpecVal, 1, 4) '\\\\\n'];

fileID = fopen('celldata.txt','w');
[nrows,ncols] = size(out);
for row = 3:nrows
    fprintf(fileID, formatSpec, out{row,:});
end
fclose(fileID);

%%
ta = readtable('solveBroydenBand.csv');
ce = table2cell(ta);

out= pivottable(ce, [1], [2 4], [5 6 7 9 8], {id,id,id,id,id});

formatSpecIdx = '%d';
formatSpecVal = ' & %1.6e & %1.2e & %d & %d & %d';
formatSpec = [formatSpecIdx repmat(formatSpecVal, 1, 4) '\\\\\n'];

fileID = fopen('celldata.txt','w');
[nrows,ncols] = size(out);
for row = 3:nrows
    fprintf(fileID, formatSpec, out{row,:});
end
fclose(fileID);

%%
ta = readtable('solveChainedWood.csv');
ce = table2cell(ta);

out= pivottable(ce, [1], [2 4], [5 6 7 9 8], {id,id,id,id,id});

formatSpecIdx = '%d';
formatSpecVal = ' & %1.6e & %1.2e & %d & %d & %d';
formatSpec = [formatSpecIdx repmat(formatSpecVal, 1, 4) '\\\\\n'];

fileID = fopen('celldata.txt','w');
[nrows,ncols] = size(out);
for row = 3:nrows
    fprintf(fileID, formatSpec, out{row,:});
end
fclose(fileID);

%%
ta = readtable('solveChainedSingular.csv');
ce = table2cell(ta);

out= pivottable(ce, [1], [2 4], [5 6 7 9 8], {id,id,id,id,id});

formatSpecIdx = '%d';
formatSpecVal = ' & %1.6e & %1.2e & %d & %d & %d';
formatSpec = [formatSpecIdx repmat(formatSpecVal, 1, 4) '\\\\\n'];

fileID = fopen('celldata.txt','w');
[nrows,ncols] = size(out);
for row = 3:nrows
    fprintf(fileID, formatSpec, out{row,:});
end
fclose(fileID);

%%
ta = readtable('solveRosenbrock.csv');
ce = table2cell(ta);

out= pivottable(ce, [1], [2 4], [5 6 7 9 8], {id,id,id,id,id});

formatSpecIdx = '%d';
formatSpecVal = ' & %1.6e & %1.2e & %d & %d & %d';
formatSpec = [formatSpecIdx repmat(formatSpecVal, 1, 4) '\\\\\n'];

fileID = fopen('celldata.txt','w');
[nrows,ncols] = size(out);
for row = 3:nrows
    fprintf(fileID, formatSpec, out{row,:});
end
fclose(fileID);