
package model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private Connection con;
    private String sql;
    private PreparedStatement pst;
    private ResultSet rs;
    
    public ProductDao(Connection con){
        this.con = con;
    }
    
    public List<Product> getAllProducts(){
        List<Product> products=new ArrayList<Product>();
        try {
                        
            sql="SELECT * FROM painting";
            rs =this.pst.executeQuery(sql);
            while(rs.next()){
                Product row=new Product();
                row.setId(rs.getInt("P_ID"));
                row.setName(rs.getString("Name"));
                row.setDescription(rs.getString("Description"));
                row.setPrices(rs.getString(rs.getString("Prices")));
                row.setCategory(rs.getString("Category"));
                row.setPainting(rs.getString("Painting"));
                row.setArtist(rs.getString("Artist"));
                
                products.add(row);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
        return products;
    }

}
