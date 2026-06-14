package dto;

public class customer {
    private String id;
    private String passwd;
    private String name;

    public customer() {
    }

    public customer(String id, String passwd, String name) {
        this.id = id;
        this.passwd = passwd;
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return passwd;
    }

    public void setPassword(String password) {
        this.passwd = passwd;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}