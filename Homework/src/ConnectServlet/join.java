package ConnectServlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;;

public class join{
	private static final String url = "jdbc:mysql://localhost:3306/customer";
    private static final String name = "com.mysql.jdbc.Driver";
    private static final String username = "test";
    private static final String password = "290013";
    
    private Connection connection =null;
    private PreparedStatement preparedStatement = null;
    
    private join(String sql){
        try{
            Class.forName(name);
            connection = DriverManager.getConnection(url, username, password);
            preparedStatement = connection.prepareStatement(sql);

        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    private void close(){
        try{
            this.connection.close();
            this.preparedStatement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    
    
    public static void main(String[] args){
        String sql = "SELECT * FROM customer";
        join dbManager = new join(sql);  //实例化

        String id, name, gender, phone, email, description;

        try{
            ResultSet result = dbManager.preparedStatement.executeQuery();
            while(result.next()){                  //若有数据，就输出
                id = result.getString(1);
                name = result.getString(2);
                gender = result.getString(3);
                phone = result.getString(4);
                email = result.getString(5);
                description = result.getString(6);
                //显示出每一行数据
                System.out.println(id + "  " + name + "  " + gender + "  "
                                    + phone + "  " + email + "  " + description);
            }
            result.close();
            dbManager.close();
            
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}