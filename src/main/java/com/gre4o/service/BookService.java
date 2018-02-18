package com.gre4o.service;


import com.gre4o.model.Book;

import java.util.List;

public interface BookService {
    void createBook(Book book);

    void deleteBook(int bookId);

    void updateBook(Book book);

    List<Book> getAllBooks();

    Book getBook(int bookId);

    List<Book> searchBookByTitle(String title);

    List<Book> searchBookByUnread();

}
