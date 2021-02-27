% Code developed by Engr.Muhammad Kashif, engr.kashifaawan@gmail.com
% Implementation of lossy image compression using variable no of coefficients
 
a=imread('cameraman.tif'); 
a2=blkproc(a,[8 8],'dct2');
discoeff=zeros(size(a2));
for i=1:8:size(a2,1)-7
    for j=1:8:size(a2,1)-7
        block=a2(i:i+7,j:j+7); % extracting each block
        b=abs(block);
        [~,Idx] = maxk(b(:),7);
        dIdx=setdiff(1:64,Idx);
        block(dIdx)=0;
        discoeff(i:i+7,j:j+7)=block; %reshape to original image size
    end
end
  reconc= blkproc(discoeff,[8 8],'idct2'); 
  imshow(reconc,[])