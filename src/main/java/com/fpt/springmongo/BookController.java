/**
 * 
 */
package com.fpt.springmongo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fpt.springmongo.model.Book;
import com.fpt.springmongo.service.BookService;



/**
 * @author Sunshine Cotejo
 *
 */
@Controller
@RequestMapping(value="/books")
public class BookController {

	@Autowired
	private BookService bookService;
	
	/*Return the page with all the list of books*/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView allBooksPage( ModelMap model ) {
		List<Book> books = bookService.read();
		ModelAndView modelAndView = new ModelAndView("listBooks");
		modelAndView.addObject("books", books );
		return modelAndView;
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	@ResponseBody
	public List<Book> getBooks(){
		return bookService.read();
	}
	
	@RequestMapping(value="/read/{id}", method=RequestMethod.GET)
	@ResponseBody
	public Book readBookById(@PathVariable String id){
		return bookService.readById(id);
	}
	
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
    public String deleteBook(@PathVariable String id, RedirectAttributes redirectAttributes) { 
		 Book book = readBookById(id);
         bookService.deleteById(id);
         String   message = "Book  was deleted successfully : [";
         message += book.getTitle()+" : ";
         message += book.getAuthor() + " : ";
         message += book.getIsbn()+ " ] ";
         redirectAttributes.addFlashAttribute("message", message);
         return "redirect:/books/";
    }

	
	@RequestMapping(value="/create", method = RequestMethod.POST)
	@ResponseBody
	public Book createBook(@RequestBody Book b){
		bookService.create(b);
		return b;

	}
	
	@RequestMapping(value="/update", method = RequestMethod.PUT)
	@ResponseBody
	public Book updateBook(@RequestBody Book b){
		bookService.update(b);
		return b;
	}
 
}
	