% Change input files units to run bling

% Units in darwin are micromol
% Units in bling are mol
dir1='/data/SO2/akuhncordova/OMI/';
indir = '/home/akuhncordova/GulfGuinea/run_template/obcs/';
var2do = 'o2'

% Specify directory location for saving figures, e.g.,
dir2='~/GulfGuinea/figs/';

% Grid dimensions
nx=69;
ny=66;
nz=50;
nt=36;

% Define a Coastal Ghana region
ix=18:32;
iy=55:64;

% Plot bathymetry
XC=readbin([dir1 'grid/XC_69x66'],[nx ny]);
YC=readbin([dir1 'grid/YC_69x66'],[nx ny]);
Depth=readbin([dir1 'grid/Depth_69x66'],[nx ny]);
Depth(find(Depth==0))=nan;

RF=readbin([dir1 'grid/RF.data'],nz+1);
thk=abs(diff(RF)); % model level thicknesses (m)

myvars = {'dic', 'no3','alk','doc','fe','nh4','o2','po4','don','dop'}
for vv = 1:length(myvars)
	var2do =myvars{vv};
	display(['working on ',var2do,' files... '])
% Choose file
switch var2do
case 'dic'
infile1 = 'GulfGuinea_69x66x50_DIC_South'
outfile1 = 'GulfGuinea_69x66x50_DIC_South_bling'

infile2 = 'GulfGuinea_69x66x50_DIC_West'
outfile2 = 'GulfGuinea_69x66x50_DIC_West_bling'

case 'no3'
infile1 = 'GulfGuinea_69x66x50_NO3_South'
outfile1 = 'GulfGuinea_69x66x50_NO3_South_bling'

infile2 = 'GulfGuinea_69x66x50_NO3_West'
outfile2 = 'GulfGuinea_69x66x50_NO3_West_bling'
case 'alk'
infile1 = 'GulfGuinea_69x66x50_ALK_South'
outfile1 = 'GulfGuinea_69x66x50_ALK_South_bling'

infile2 = 'GulfGuinea_69x66x50_ALK_West'
outfile2 = 'GulfGuinea_69x66x50_ALK_West_bling'

case 'doc'
	infile1 = 'GulfGuinea_69x66x50_DOC_South'
outfile1 = 'GulfGuinea_69x66x50_DOC_South_bling'

infile2 = 'GulfGuinea_69x66x50_DOC_West'
outfile2 = 'GulfGuinea_69x66x50_DOC_West_bling'
case 'fe'
	 infile1 = 'GulfGuinea_69x66x50_FeT_South'
outfile1 = 'GulfGuinea_69x66x50_FeT_South_bling'

infile2 = 'GulfGuinea_69x66x50_FeT_West'
outfile2 = 'GulfGuinea_69x66x50_FeT_West_bling'

case 'nh4'
	infile1 = 'GulfGuinea_69x66x50_NH4_South'
outfile1 = 'GulfGuinea_69x66x50_NH4_South_bling'

infile2 = 'GulfGuinea_69x66x50_NH4_West'
outfile2 = 'GulfGuinea_69x66x50_NH4_West_bling'
 case 'o2'
	   infile1 = 'GulfGuinea_69x66x50_O2_South'
outfile1 = 'GulfGuinea_69x66x50_O2_South_bling'

infile2 = 'GulfGuinea_69x66x50_O2_West'
outfile2 = 'GulfGuinea_69x66x50_O2_West_bling'
	 case 'po4'
 infile1 = 'GulfGuinea_69x66x50_PO4_South'
outfile1 = 'GulfGuinea_69x66x50_PO4_South_bling'

infile2 = 'GulfGuinea_69x66x50_PO4_West'
outfile2 = 'GulfGuinea_69x66x50_PO4_West_bling'
case 'don'
 infile1 = 'GulfGuinea_69x66x50_DON_South'
outfile1 = 'GulfGuinea_69x66x50_DON_South_bling'

infile2 = 'GulfGuinea_69x66x50_DON_West'
outfile2 = 'GulfGuinea_69x66x50_DON_West_bling'
case 'dop'
 infile1 = 'GulfGuinea_69x66x50_DOP_South'
outfile1 = 'GulfGuinea_69x66x50_DOP_South_bling'

infile2 = 'GulfGuinea_69x66x50_DOP_West'
outfile2 = 'GulfGuinea_69x66x50_DOP_West_bling'

end

% Read input file
fname = [indir,infile1];
A=readbin(fname,[nx nz 374]);
A4bling = A.*10^-3;


%fid=fopen([indir,infile1],'r','b');

%VAR = fread(fid,'single');

%fclose(fid);
%dims = [69 66 50]
%VARreshp = reshape(VAR,dims);

%    fwrite(fid,A4bling,'single');


%-----------------------------------------------------
% save new file
%----------------------------------------------------
fid=fopen(['/home/akuhncordova/GulfGuinea/nbling/',outfile1],'w','b');
    fwrite(fid,A4bling,'single');
    fclose(fid);


    % Read input file
fname = [indir,infile2];
A=readbin(fname,[ny nz 374]);
A4bling = A.*10^-3;

%-----------------------------------------------------
% save new file
%----------------------------------------------------
fid=fopen(['/home/akuhncordova/GulfGuinea/nbling/',outfile2],'w','b');
    fwrite(fid,A4bling,'single');
    fclose(fid);



!cp /home/akuhncordova/GulfGuinea/nbling/*_bling* /data/SO2/akuhncordova/ghana/.
