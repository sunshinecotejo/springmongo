/**
 * 
 */
package com.fpt.springmongo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fpt.springmongo.model.Book;
import com.fpt.springmongo.repositories.BookRepository;

/**
 * @author Sunshine Cotejo
 *
 */
@Service
public class BookServiceImpl  implements BookService{

	@Autowired
	private BookRepository bookRepository;
	
	@Override
	@Transactional
	public void create(Book b) {
		bookRepository.create(b);
	}

	@Override
	@Transactional
	public Book readById(String id) {
		return bookRepository.readById(id);
	}

	@Override
	@Transactional
	public void update(Book b) {
		 bookRepository.update(b);
		
	}

	@Override
	@Transactional
	public Book deleteById(String id) {
		return bookRepository.deleteById(id);
	}

	@Override
	@Transactional
	public List<Book> read() {
		return bookRepository.read();
	}
	
}
