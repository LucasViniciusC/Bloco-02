package com.aula_generation.blogPessoal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.aula_generation.blogPessoal.model.Tema;

@Repository
public interface TemaRepository extends JpaRepository<Tema, Long>{
	public List<Tema> findByDescricaoContainingIgnoreCase(String descricao); 
	public Tema findById(long id);
	public Tema deleteById(long id);
}
