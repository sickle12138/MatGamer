function outputImage=screenCapture(subRegion,outputFile)
if ~exist('subRegion','var') || isempty(subRegion)
    %��ȡ��Ļ�ߴ�
    subRegion = {0, 0, ...
        py.win32api.GetSystemMetrics(py.win32con.SM_CXSCREEN),...
        py.win32api.GetSystemMetrics(py.win32con.SM_CYSCREEN)};
else
    x=subRegion(1);
    y=subRegion(2);
    w=subRegion(3);
    h=subRegion(4);
    subRegion = {x, y, x+w, y+h};
end
img = py.PIL.ImageGrab.grab().crop(subRegion);
%��ȡ���ξ���
if exist('outputFile','var')
    %�����ļ�
    img.save(outputFile);
end
if nargout
    %ת��ΪMATLAB����
    data = py.numpy.array(img).reshape(img.height*img.width*3);
    img_arr=cellfun(@uint8,cell(data.data));
    tmp=reshape(img_arr(:),3,w,h);
    outputImage=zeros(h,w,3);
    for ii=1:3
        outputImage(:,:,ii)=squeeze(tmp(ii,:,:))';
    end
    %     outputImage=outputImage/255;
end
end