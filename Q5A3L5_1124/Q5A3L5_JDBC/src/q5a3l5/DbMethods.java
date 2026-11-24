package q5a3l5;

import java.sql.*;

public class DbMethods
{

    final static String url = "jdbc:sqlite:C:/sqlite3/autodb";

    public static void Register() {

        try {
            Class.forName("org.sqlite.JDBC");
        } catch (ClassNotFoundException e) {
            System.out.println("Class not found exception: " + e.getMessage());
        }
    }
}

public static Connection Connect() {
    Connection conn = null;
    try {
        conn = DriverManager.getConnection(DbMethods.url);
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }
    return conn;
}

public static void DisConnect(Connection conn) {
    if(conn != null) {
        try {
            conn.close();
        }
        catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}


public static void CommandExec(String command) {
    Connection conn = Connect();
    try {
        Statement s = conn.createStatement();
        s.execute(command);
    }
    catch (SQLException e) {
        System.out.println("Command: " + command);
        System.out.println(e.getMessage());
    }
    DisConnect(conn);
}


public static void ReadAllData() {
    String rendszam = " ";
    String tipus = " ";
    String szin = " ";
    String tulaj = " ";
    int kor = 0;
    int ar = 0;
    String sqlp = "SELECT Rendszam, Tipus, Szin, Kor, Ar, Tulaj FROM Auto";
    Connection conn = Connect();

    System.out.println("Autó tábla\n");

    try {
        Statement statement = conn.createStatement();
        ResultSet result_set = statement.executeQuery(sqlp);

        while(result_set.next()) {
            rendszam = result_set.getString( "Rendszam");
            tipus = result_set.getString( "Tipus");
            szin = result_set.getString( "Szin");
            kor = result_set.getInt( "Kor");
            tulaj = result_set.getString( "Tulaj");
            System.out.println(
                    rendszam + "\t" +
                            tipus + "\t" +
                            szin + "\t" +
                            kor + "\t" +
                            ar + "\t" +
                            tulaj
            );
        }
        result_set.close();
    }
    catch (SQLException e){
        System.out.println(e.getMessage());
    }
    DisConnect(conn);
}
	}
