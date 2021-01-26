package com.example.mycart.DAO;

import com.example.mycart.Entities.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import javax.persistence.Query;
import java.util.List;

public class ProductDAO {

    public SessionFactory factory;

    public ProductDAO(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveProduct(Product product) {
        boolean f = false;

        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(product);
            tx.commit();
            session.close();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    @SuppressWarnings("unchecked")
    public List<Product> getAllProducts() {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        List<Product> list = session.createQuery("from Product").getResultList();
        tx.commit();
        return list;
    }

    @SuppressWarnings("unchecked")
    public List<Product> getProductsById(int cid) {
        Session session = this.factory.openSession();
        Query query = session.createQuery("from Product as p where p.category.categoryId =: id");
        query.setParameter("id",cid);
        List<Product> list = query.getResultList();
        return list;
    }
}
