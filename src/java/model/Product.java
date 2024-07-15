package model;

public class Product {

    private int id;
    private String Name;
    private String Description;
    private String Prices;
    private String Category;
    private String Painting;
    private String Artist;

    // Default constructor
    public Product() {

    }

    // Parameterized constructor
    public Product(int id, String name, String description, String prices, String category, String painting, String artist) {
        this.id = id;
        this.Name = name;
        this.Description = description;
        this.Prices = prices;
        this.Category = category;
        this.Painting = painting;
        this.Artist = artist;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        this.Name = name;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        this.Description = description;
    }

    public String getPrices() {
        return Prices;
    }

    public void setPrices(String prices) {
        this.Prices = prices;
    }

    public String getCategory() {
        return Category;
    }

    public void setCategory(String category) {
        this.Category = category;
    }

    public String getPainting() {
        return Painting;
    }

    public void setPainting(String painting) {
        this.Painting = painting;
    }

    public String getArtist() {
        return Artist;
    }

    public void setArtist(String artist) {
        this.Artist = artist;
    }

    // toString method to represent object as a string
    @Override
	public String toString() {
		return "Product [id=" + id + ", name=" + Name + ",Description="+Description+",price="+Prices+" category=" + Category + ", Painting="+Painting+", Artist="+ Artist + "]";
	}
   
}
