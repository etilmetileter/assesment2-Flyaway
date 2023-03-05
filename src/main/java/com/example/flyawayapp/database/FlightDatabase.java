package com.example.flyawayapp.database;

import com.example.flyawayapp.entity.Admin;
import com.example.flyawayapp.entity.Flight;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import javax.persistence.criteria.CriteriaQuery;
import java.util.List;

public class FlightDatabase {

    private static final SessionFactory factory = HibernateConfig.getSessionFactory();

    public Admin getAdmin() {
        Session session = factory.openSession();
        CriteriaQuery<Admin> cq = session.getCriteriaBuilder().createQuery(Admin.class);
        cq.from(Admin.class);
        Admin admin = session.createQuery(cq).getSingleResult();
        session.close();
        return admin;
    }

    public List<Flight> getAllFlights() {
        Session session = factory.openSession();
        CriteriaQuery<Flight> cq = session.getCriteriaBuilder().createQuery(Flight.class);
        cq.from(Flight.class);
        List<Flight> flightList = session.createQuery(cq).getResultList();
        session.close();
        return flightList;
    }

    public List<String> getUniqueFlightList() {
        Session session = factory.openSession();
        String sql = "SELECT DISTINCT airline FROM Flight";
        Query query = session.createQuery(sql);
        List a = query.getResultList();
        session.close();
        return a;
    }

    public void updateAdmin(String password) {
        Admin admin = new Admin();
        admin.setEmail("admin@flywaway.com");
        admin.setPassword(password);
        Session session = factory.openSession();
        session.update(admin);
        session.close();
    }

}
