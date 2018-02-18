package com.gre4o.dao;

import com.gre4o.model.Book;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDAOImpl implements BookDAO {


    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void createBook(Book book) {
        sessionFactory.getCurrentSession().persist(book);
    }

    @Override
    public void deleteBook(int bookId) {
        Book book = sessionFactory.getCurrentSession().load(Book.class, bookId);
        if (book !=null) {
            this.sessionFactory.getCurrentSession().delete(book);
        }
    }

    @Override
    public Book getBook(int bookId) {
        return sessionFactory.getCurrentSession().get(Book.class, bookId);
    }

    @Override
    public void updateBook(Book book) {
        sessionFactory.getCurrentSession().update(book);
    }

    @Override
    public List<Book> getAllBooks() {
        return sessionFactory.getCurrentSession().createQuery("from Book").list();
    }

}
