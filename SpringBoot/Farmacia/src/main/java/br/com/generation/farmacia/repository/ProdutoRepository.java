package br.com.generation.farmacia.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.generation.farmacia.model.Produto;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Long>{
	
	public Produto findById(long id);
	public Produto findByDescricaoContainingIgnoreCase(String descricao);
	public List<Produto> findByNomeContainingIgnoreCase(String nome);
	public Produto deleteById(long id);
}
