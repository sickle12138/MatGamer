function outputImage=screenCapture(subRegion,outputFile)
robo = java.awt.Robot;
if ~exist('subRegion','var') || isempty(subRegion)
    %��ȡ��Ļ�ߴ�
    t = java.awt.Toolkit.getDefaultToolkit();
    rectangle = java.awt.Rectangle(t.getScreenSize());
else
    x=subRegion(1);
    y=subRegion(2);
    w=subRegion(3);
    h=subRegion(4);
    rectangle = java.awt.Rectangle(x,y,w,h);
end
img = robo.createScreenCapture(rectangle);
%��ȡ���ξ���
if nargout
    %ת��ΪMATLAB����
    h=img.getHeight();
    w=img.getWidth();
    data=img.getData();
    pix=data.getPixels(0,0,w,h,[]);
    tmp=reshape(pix(:),3,w,h);
    outputImage=zeros(h,w,3);
    for ii=1:3
        outputImage(:,:,ii)=squeeze(tmp(ii,:,:))';
    end
end
if exist('outputFile','var')
    %�����ļ�
    filehandle = java.io.File(outputFile);
    javax.imageio.ImageIO.write(img,'jpg',filehandle);
end
end
