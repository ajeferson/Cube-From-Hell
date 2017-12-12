function [ centro ] = centroCubo( objetos )
	
	pontos = [];
	for( i = 1 : size(objetos, 2))
		pontos = [pontos; objetos{i}.p1; objetos{i}.p2;objetos{i}.p3;objetos{i}.p4];
	end

	centro = mean(pontos);

end

