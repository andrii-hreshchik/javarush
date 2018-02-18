package com.gre4o.controller;

import javax.validation.Valid;
import com.gre4o.model.Book;
import com.gre4o.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping(value = "/bookmanager")
public class BookController {

    @Autowired
    private BookService bookService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView listBooks(@RequestParam(required = false) Integer page) throws IOException {
        ModelAndView modelAndView = new ModelAndView("bookList");
        List<Book> listBook = bookService.getAllBooks();
        PagedListHolder<Book> pagedListHolder = new PagedListHolder<Book>(listBook);
        pagedListHolder.setPageSize(10);
        modelAndView.addObject("maxPages", pagedListHolder.getPageCount());
        if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
            page = 1;
        }
        modelAndView.addObject("page", page);
        if (page < 1 || page > pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(0);
            modelAndView.addObject("listBook", pagedListHolder.getPageList());
        } else if (page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page - 1);
            modelAndView.addObject("listBook", pagedListHolder.getPageList());
        }
        return modelAndView;
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView addBooks(ModelAndView modelAndView) {
        modelAndView.addObject("book", new Book());
        modelAndView.setViewName("addBook");
        return modelAndView;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView saveBook(@Valid @ModelAttribute(value = "book") Book book, BindingResult bindingResult) throws UnsupportedEncodingException {
        if (bindingResult.hasErrors()) {
            return new ModelAndView("/error");
        }
        book.setAuthor(new String(book.getAuthor().getBytes("ISO-8859-1"), "UTF-8"));
        book.setDescription(new String(book.getDescription().getBytes("ISO-8859-1"), "UTF-8"));
        book.setTitle(new String(book.getTitle().getBytes("ISO-8859-1"), "UTF-8"));
        book.setIsbn(new String(book.getIsbn().getBytes("ISO-8859-1"), "UTF-8"));
        bookService.createBook(book);
        return new ModelAndView("redirect:/bookmanager/list");
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public ModelAndView searchBooks(ModelAndView modelAndView) {
        modelAndView.addObject("book", new Book());
        modelAndView.setViewName("searchBooks");
        return modelAndView;
    }

    @RequestMapping(value = "/findbooksbytitle", method = RequestMethod.POST)
    public ModelAndView findBooks(@ModelAttribute(value = "book") Book book) throws UnsupportedEncodingException {
        book.setTitle(new String(book.getTitle().getBytes("ISO-8859-1"), "UTF-8"));
        ModelAndView modelAndView = new ModelAndView("findBooks");
        modelAndView.addObject("listBooks", bookService.searchBookByTitle(book.getTitle()));
        return modelAndView;
    }


    @RequestMapping(value = "/findunread", method = RequestMethod.POST)
    public ModelAndView findUnreadBooks() {
        ModelAndView modelAndView = new ModelAndView("findBooks");
        modelAndView.addObject("listBooks", bookService.searchBookByUnread());
        return modelAndView;
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public ModelAndView deleteBook(@PathVariable("id") int id) {
        this.bookService.deleteBook(id);
        return new ModelAndView("redirect:/bookmanager/list");
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView editBook(ModelAndView modelAndView, HttpServletRequest request) {
        Book book = bookService.getBook(Integer.parseInt(request.getParameter("id")));
        book.setReadAlready(false);
        modelAndView.addObject("book", book);
        modelAndView.setViewName("updateBook");
        return modelAndView;
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.POST)
    public ModelAndView updateBook(@Valid @ModelAttribute(value = "book") Book book, BindingResult bindingResult) throws UnsupportedEncodingException {
        if (bindingResult.hasErrors()) {
            return new ModelAndView("/error");
        }
        book.setAuthor(new String(book.getAuthor().getBytes("ISO-8859-1"), "UTF-8"));
        book.setDescription(new String(book.getDescription().getBytes("ISO-8859-1"), "UTF-8"));
        book.setTitle(new String(book.getTitle().getBytes("ISO-8859-1"), "UTF-8"));
        book.setIsbn(new String(book.getIsbn().getBytes("ISO-8859-1"), "UTF-8"));
        bookService.updateBook(book);
        return new ModelAndView("redirect:/bookmanager/list");
    }

    @RequestMapping(value = "/updateread", method = RequestMethod.GET)
    public ModelAndView updateReadBook(HttpServletRequest request) {
        Book book = bookService.getBook(Integer.parseInt(request.getParameter("id")));
        book.setReadAlready(true);
        bookService.updateBook(book);
        return new ModelAndView("redirect:/bookmanager/list");
    }

}
