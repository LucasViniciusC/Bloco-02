package br.com.generation.farmacia.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.generation.farmacia.model.Categoria;

@Repository
public interface CategoriaRepository extends JpaRepository<Categoria, Long> {

	public Categoria findById(long id);
	public List<Categoria> findByDescricaoCategoriaContainingIgnoreCase(String descricaoCategoria);
	public Categoria deleteById(long id);
	
}