function k_unc = calculate_uncertainity(k,a,b,c,ncpmg,nmc)
 
 i_list= a/a(c);
 i_list=i_list(1:length(i_list)-1);

if (nmc > 0)
 for mm=1:nmc
 y = i_list + randn(1,length(b)).*b;
 fval2=[];
 xval2=[];
 x1= k;
 fun = @(x)sseval(x,y,ncpmg,b);
 [xval1 fval1] =  fminsearch(fun,x1);
 
 mcout2(mm,:) =  xval1 ; 
 end
end
ni=length(mcout2(:,1));
s=std(mcout2(:,1))
CI= 1.96*s/sqrt(ni)
meaner=mean(mcout2(:,1))
k_unc=[meaner-CI meaner+CI];
end
