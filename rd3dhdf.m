function [nx,ny,nz,time,x,y,z,v]=rd3dhdf(dataset,num)
filename=['data',sprintf('%0.4d',num),'.hdf'];
time=hdf5read(filename,'ttime');
x=hdf5read(filename,'x');
y=hdf5read(filename,'y');
z=hdf5read(filename,'z');
nx=length(x);
ny=length(y);
nz=length(z);
v=hdf5read(filename, dataset);  
type=whos('v');
if (strcmp(type.class,'uint8') || strcmp(type.class,'uint16') || ...
      strcmp(type.class,'int8') || strcmp(type.class,'int16')) % binned data
    scale=hdf5read(filename,[dataset '_scale']);
    offset=hdf5read(filename,[dataset '_offset']);
    v=double(v)*scale+offset;
elseif (strcmp(type.class,'single'))
    v=double(v);
end
    
return
    
                                              
                                        
                                               
