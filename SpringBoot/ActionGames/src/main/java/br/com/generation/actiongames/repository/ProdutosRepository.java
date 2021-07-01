package br.com.generation.actiongames.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.generation.actiongames.model.Produto;

@Repository
public interface ProdutosRepository extends JpaRepository<Produto, Long>{
	
	public Produto findById(long id);
	public Produto findByTitulo(String titulo);
	public Produto findByTituloContainingIgnoreCase(String titulo);
	public Produto deleteById(long id);
}
