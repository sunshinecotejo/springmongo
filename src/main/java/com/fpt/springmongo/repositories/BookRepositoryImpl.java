/**
 * 
 */
package com.fpt.springmongo.repositories;

import java.util.List;

import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.fpt.springmongo.model.Book;
//import com.mongodb.WriteResult;

/**
 * @author Sunshine Cotejo
 *
 */
//@Repository
public class BookRepositoryImpl implements BookRepository{
	
	private MongoOperations mongoOps;
    private static final String BOOK_COLLECTION = "books";
    
    public BookRepositoryImpl(MongoOperations mongoOps){
        this.mongoOps=mongoOps;
    }
    
	@Override
	public void create(Book b) {
		this.mongoOps.insert(b, BOOK_COLLECTION);
	}

	@Override
	public Book readById(String id) {
		 Query query = new Query(Criteria.where("_id").is(id));
		 return this.mongoOps.findOne(query, Book.class, BOOK_COLLECTION);
	}
	
	@Override
	public List<Book> read() {
		 return this.mongoOps.findAll( Book.class);
	}

	@Override
	public void update(Book b) {
		 this.mongoOps.save(b, BOOK_COLLECTION);
	}

	@Override
	public Book deleteById(String id) {
		 Query query = new Query(Criteria.where("_id").is(id));
	     Book book = this.mongoOps.findAndRemove(query, Book.class);  
	     return book;
	}
	/*
	 @Override
	    public int deleteById(String id) {
	        Query query = new Query(Criteria.where("_id").is(id));
			 WriteResult result = this.mongoOps.remove(query, Book.class, BOOK_COLLECTION);
		     return result.getN();
	    }
	 */

}
