package kr.or.nextit.jdbc;

import java.io.FileReader;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionFactory {

	private String driver;
	private String url;
	private String user;
	private String password;
	private int maxConnection;

	private static ConnectionFactory instance = new ConnectionFactory();

	public static ConnectionFactory getInstance() {
		if (instance == null) {
			instance = new ConnectionFactory();
		}
		return instance;
	}

	private ConnectionFactory() {

		Properties prop =  null;
		InputStream resouce = null;
		try {
			prop = new Properties();
			
			resouce  = this.getClass().getResourceAsStream("/db.properties");
			prop.load(resouce);
			
//			prop.load(this.getClass().getResourceAsStream("/db.properties"));
			
			
			
			
			
			
			
			
			
			 
			 
			 	// prop.load(this.getClass().getResourceAsStream("/db.properties"));
			 
			driver = prop.getProperty("driver"); // oracle.jdbc.driver.OracleDriver
			url = prop.getProperty("url");
			user = prop.getProperty("user");
			password = prop.getProperty("password");

			if (prop.getProperty("max.connection") != null) {
				maxConnection = Integer.parseInt(prop.getProperty("max.connection"));
			}

			// 드라이버 로딩
			Class.forName(driver);
			System.out.println("ConnectionFactory -> JDBC Driver 로딩.");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
//			resouce.close();
		}
	}

	public Connection getConnection() throws SQLException {

		Connection conn = DriverManager.getConnection(url, user, password);

		return conn;
	}

	public int getMaxConnection() {
		return maxConnection;
	}
}
