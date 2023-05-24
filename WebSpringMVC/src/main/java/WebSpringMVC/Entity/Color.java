package WebSpringMVC.Entity;

public class Color {
    private int id;
    private long id_product;
    private String name;
    private String code;
    private String img;

    public Color() {
    }

    public Color(int id, long id_product, String name, String code, String img) {
        this.id = id;
        this.id_product = id_product;
        this.name = name;
        this.code = code;
        this.img = img;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getId_product() {
        return id_product;
    }

    public void setId_product(long id_product) {
        this.id_product = id_product;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Color{" +
                "id=" + id +
                ", id_product=" + id_product +
                ", name='" + name + '\'' +
                ", code='" + code + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
