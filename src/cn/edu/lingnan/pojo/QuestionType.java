package cn.edu.lingnan.pojo;

public class QuestionType {
    private Integer typeno;

    private String typename;

    private Integer belongtypeno;

    public Integer getTypeno() {
        return typeno;
    }

    public void setTypeno(Integer typeno) {
        this.typeno = typeno;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename == null ? null : typename.trim();
    }

    public Integer getBelongtypeno() {
        return belongtypeno;
    }

    public void setBelongtypeno(Integer belongtypeno) {
        this.belongtypeno = belongtypeno;
    }
}