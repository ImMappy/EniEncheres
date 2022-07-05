package fr.eni.eniencheres.dal;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class ConnectionProvider {
    private static DataSource dataSource;

    static {
        try {
            Context context = new InitialContext();
            //Recherche de la DataSource
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/pool_cnx");

        } catch (NamingException exc ) {
            exc.printStackTrace();
            throw new RuntimeException("Connexion à la BD impossible");
        }
    }


    public static Connection getConnection() throws SQLException
    {
        return dataSource.getConnection();
    }

}
