function [Vorticef,Vortice] = Follow(coordenadas,s,largo)

if s==1
    Vortice(:,1) = coordenadas{1,1}.centrosc(:,1);
    Vortice(:,2) = coordenadas{1,1}.centrosc(:,2);
elseif s==0
    % ELegimos los vórtices

    [Vortice(:,1), Vortice(:,2)] = ginput;

end


% Vortice = zeros(num,2)
% Vortice(1,:) = frame1.a.centrosc(131,:);


%Estos bucles hacen el seguimiento viendo cual es la distanci mínima de nuestro vórtice
% con los del siguiente frame
Vorticef = zeros(largo,2,length(Vortice(:,1)));

for k = 1:length(Vortice(:,1))

    Vorticef(1,:,k) = Vortice(k,:);


    for j = 2:largo

        coord = coordenadas{1,j};

        for i= 1:length(coord.centrosc)

            dist(i) = sqrt((Vorticef(j-1,1,k) - coord.centrosc(i,1)).^2 + (Vorticef(j-1,2,k) - coord.centrosc(i,2)).^2);

        end

        [~, indice] = min(dist);

        Vorticef(j,1,k) = coord.centrosc(indice,1);
        Vorticef(j,2,k) = coord.centrosc(indice,2);
        clear dist

    end

end


end