package com.example.mycart.Helper;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import javax.persistence.Query;
import java.util.HashMap;
import java.util.Map;

public class Helper {
    public static String getLimitedWords (String desc) {
        String str[] = desc.split(" ");

        if(str.length > 10) {

            String string = "";
            for(int i=0; i<10; i++) {
                string = string + str[i] + " ";
            }
            return (string + "...");
        } else {
            return (desc + "...");
        }
    }

    public static Map<String,Long> getCount(SessionFactory factory) {
        Session session = factory.openSession();

        String q1 = "Select count(*) from User";
        String q2 = "Select count(*) from Product";

        Query query1 = session.createQuery(q1);
        Query query2 = session.createQuery(q2);

        Long userCount=(Long)query1.getResultList().get(0);
        Long productCount=(Long)query2.getResultList().get(0);

        Map<String,Long> map= new HashMap<>();
        map.put("userCount",userCount);
        map.put("productCount",productCount);

        session.close();
        return map;
    }

}
