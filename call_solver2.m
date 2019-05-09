function k= call_solver(a,b,c,ncpmg,label,i);
opts = optimset('Display','off');
 i_list= a/a(c);
 i_list=i_list( 1:length(i_list)-1 );
 x=1;
 fun = @(x)sseval(x,i_list,ncpmg,b);

 [xval1 fval1] =  fminsearch(fun,x,opts);

 for x1= xval1:250:10000
  fun = @(x)sseval(x,i_list,ncpmg,b);
  [xval2 fval2] =  fminsearch(fun,x1,opts);
  if fval2 < fval1
  xval1=xval2;
  fval1=fval2;
  end
 end
 
 k=xval1

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
 saveas(plotx,sprintf('%0dt.png',i))
 close all
end
