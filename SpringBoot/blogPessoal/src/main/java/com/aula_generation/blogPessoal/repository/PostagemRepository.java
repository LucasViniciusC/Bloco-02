package com.aula_generation.blogPessoal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.aula_generation.blogPessoal.model.Postagem;

@Repository
public interface PostagemRepository extends JpaRepository<Postagem, Long> {
	public Postagem findById(long id);
	public Postagem deleteById(long id);
	public List<Postagem>findByTituloContainingIgnoreCase(String descricao);
}