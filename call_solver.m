function k= call_solver(a,b,c,ncpmg,label,i);



 i_list= a/a(c);
 i_list=i_list( 1:length(i_list)-1 );
 iter = linspace(1,10000);
 
 fval2=[];
 xval2=[];
 for x1= iter(1):20:iter(length(iter))
  fun = @(x)sseval(x,i_list,ncpmg,b);
 [xval1 fval1] =  fminsearch(fun,x1);
 fval2=[fval2;fval1];
 xval2=[xval2;xval1];
 end
 [minval, minidx] = min(fval2);
  k=xval2(minidx)


 for kidx = 1 : length(ncpmg);
     n=cal_rho(ncpmg(kidx),k) ;
     x4(kidx)=n(1);
 end
 plotx=figure;
 plot(ncpmg,i_list,'*');hold on
 errorbar(ncpmg,i_list,b,'LineStyle','none');hold on;
 plot(ncpmg,x4,'g');hold off
 ylim([0 1.2])
 xlabel('ncpmg')
 ylabel('A\B')
 title({k,label})
 saveas(plotx,sprintf('%0dy.svg',i))
end
