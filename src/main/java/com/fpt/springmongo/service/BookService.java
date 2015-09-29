package com.fpt.springmongo.service;

import java.util.List;

import com.fpt.springmongo.model.Book;

public interface BookService{
	public void create(Book b);
    
    public Book readById(String id);
     
    public List<Book> read();
    
    public void update(Book b);
     
    public Book deleteById(String id);
}
