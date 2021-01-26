package com.example.mycart.DAO;

import com.example.mycart.Entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.persistence.Query;

public class UserDAO {
    private final SessionFactory factory;

    public UserDAO(SessionFactory factory) {
        this.factory = factory;
    }

    public User getUser(String email, String password) {
        User user = null;

        try {

            String query = "from User where userEmail =: e and userPassword =: p";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e",email);
            q.setParameter("p",password);

            user = (User) q.getSingleResult();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
