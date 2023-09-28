function [jitter,creep] = Calcul(Vorticef,Vortice,largo,d,t)
% Calculamos la mean creep velocity como dice el paper
dr = zeros(1,length(Vortice(:,1)));

for k = 1:length(Vortice(:,1))

    dr(k) = norm(Vorticef(largo,1,k)-Vorticef(1,1,k),Vorticef(largo,2,k)-Vorticef(1,2,k))/(largo-1);
end

% Pasamos de pixeles a nm
dr = d.* dr./474;
creep = sum(dr)/(t*length(Vortice(:,1)));

% Ahora vamos a calcular el jitter este sea lo que sea 
  
drj = zeros(1,largo-1);

for k = 1:length(Vortice(:,1))

    for l = 2:largo

        aux =  (Vorticef(l-1,1,k)-Vorticef(l,1,k));
        auy =  (Vorticef(l-1,2,k)-Vorticef(l,2,k));

        drj(l) = sqrt(aux^2 + auy^2);

    end    
    
    drj = d .* drj./474;
    ds(k) = (sum(drj)/(largo-1))-dr(k);

end

jitter = sum(ds)/length(Vortice(:,1))
num2str(jitter)
num2str(creep)
end