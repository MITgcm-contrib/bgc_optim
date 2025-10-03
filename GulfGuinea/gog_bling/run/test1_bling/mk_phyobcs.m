% Change input files units to run bling

% Units in darwin are micromol
% Units in bling are mol
dir1='/data/SO2/akuhncordova/OMI/';
indir = '~/GulfGuinea/run_template/obcs/';

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


outfile = 'GulfGuinea_69x66x50_phy_West_bling'
infile = 'GulfGuinea_69x66x50_c1_West'
% Read input file
fname = [indir,infile];
A1=readbin(fname,[ny nz 374]);


 infile = 'GulfGuinea_69x66x50_c2_West'
 % Read input file
fname = [indir,infile];
A2=readbin(fname,[ny nz 374]);

infile = 'GulfGuinea_69x66x50_c3_West'
 % Read input file
fname = [indir,infile];
A3=readbin(fname,[ny nz 374]);

infile = 'GulfGuinea_69x66x50_c4_West'
 % Read input file
fname = [indir,infile];
A4=readbin(fname,[ny nz 374]);

infile = 'GulfGuinea_69x66x50_c5_West'
 % Read input file
fname = [indir,infile];
A5=readbin(fname,[ny nz 374]);
A4bling = (A1+A2+A3+A4+A5).*10^-3;


%-----------------------------------------------------
% save new file
%----------------------------------------------------
fid=fopen(['/home/akuhncordova/GulfGuinea/nbling/',outfile],'w','b');
    fwrite(fid,A4bling,'single');
    fclose(fid);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

outfile = 'GulfGuinea_69x66x50_phy_South_bling'
infile = 'GulfGuinea_69x66x50_c1_South'
% Read input file
fname = [indir,infile];
A1=readbin(fname,[nx nz 374]);


 infile = 'GulfGuinea_69x66x50_c2_South'
 % Read input file
fname = [indir,infile];
A2=readbin(fname,[nx nz 374]);

infile = 'GulfGuinea_69x66x50_c3_South'
 % Read input file
fname = [indir,infile];
A3=readbin(fname,[nx nz 374]);

infile = 'GulfGuinea_69x66x50_c4_South'
 % Read input file
fname = [indir,infile];
A4=readbin(fname,[nx nz 374]);

infile = 'GulfGuinea_69x66x50_c5_South'
 % Read input file
fname = [indir,infile];
A5=readbin(fname,[nx nz 374]);
A4bling = (A1+A2+A3+A4+A5).*10^-3;

%-----------------------------------------------------
% save new file
%----------------------------------------------------
fid=fopen(['/home/akuhncordova/GulfGuinea/nbling/',outfile],'w','b');
    fwrite(fid,A4bling,'single');
    fclose(fid);

    !cp /home/akuhncordova/GulfGuinea/nbling/*phy*bling* /data/SO2/akuhncordova/ghana/.
