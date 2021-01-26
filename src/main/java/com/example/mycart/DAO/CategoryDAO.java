package com.example.mycart.DAO;

import com.example.mycart.Entities.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import javax.persistence.Query;
import java.util.List;

public class CategoryDAO {
    public SessionFactory factory;

    public CategoryDAO(SessionFactory factory) {
        this.factory = factory;
    }

    public int saveCategory (Category category) {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int catId = (int) session.save(category);
        tx.commit();
        session.close();
        return catId;
    }

    public List<Category> getCategories() {
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Category ");
        List<Category> list = query.getResultList();
        return list;
    }

    public Category getCategoryById(int cid) {

        Category cat = null;

        try{

            Session session = this.factory.openSession();
            cat = session.get(Category.class,cid);
            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }

    public void deleteCategory(int id) {

    }

}
