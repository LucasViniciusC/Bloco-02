package br.com.generation.actiongames.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.generation.actiongames.model.Categoria;

@Repository
public interface CategoriaRepository extends JpaRepository<Categoria, Long> {
	public Categoria findById(long id);
	public Categoria findByCategoria(String categoria);
	public Categoria findByDescricaoCategoria(String categoria);
	public List<Categoria> findByCategoriaContainingIgnoreCase(String categoria);
	public Categoria deleteById(long id);
}
