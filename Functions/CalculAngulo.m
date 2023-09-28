function angulo = Calculoss(Vorticef,largo) 
    x = [1,0];
    
    for l=1:length(Vorticef(:,:,:))

        Vector = [Vorticef(1,1,l)-Vorticef(largo,1,l), Vorticef(1,2,l)-Vorticef(largo,2,l)];

        Modvect = norm(Vector);

        Prod = dot(Vector,x);

        angulo(l) =  acos(Prod/Modvect)*180/pi;
        

    end



    


end